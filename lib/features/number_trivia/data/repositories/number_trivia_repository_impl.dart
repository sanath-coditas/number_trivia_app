import 'package:number_trivia_app/core/error/exceptions.dart';
import 'package:number_trivia_app/core/platform/network_info.dart';
import 'package:number_trivia_app/features/number_trivia/data/datasources/number_trivia_local_datasources.dart';
import 'package:number_trivia_app/features/number_trivia/data/datasources/number_trivia_remote_datasources.dart';
import 'package:number_trivia_app/features/number_trivia/data/models/number_trivia_model.dart';
import 'package:number_trivia_app/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:number_trivia_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:number_trivia_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';

class NumberTriviaRepositoryImpl implements NumberTriviaRepository {
  final NumberTriviaLocalDataSource numberTriviaLocalDataSource;
  final NumberTriviaRemoteDataSource numberTriviaRemoteDataSource;
  final NetworkInfo networkInfo;
  NumberTriviaRepositoryImpl({
    required this.numberTriviaLocalDataSource,
    required this.networkInfo,
    required this.numberTriviaRemoteDataSource,
  });

  @override
  Future<Either<Failure, NumberTrivia>> getConcreteNumberTrivia(
      int number) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia =
            await numberTriviaRemoteDataSource.getConcreteNumberTrivia(number);
        numberTriviaLocalDataSource
            .cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia =
            await numberTriviaLocalDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, NumberTrivia>> getRandomNumberTrivia() async {
    if (await networkInfo.isConnected) {
      try {
        final remoteTrivia =
            await numberTriviaRemoteDataSource.getRandomNumberTrivia();
        numberTriviaLocalDataSource
            .cacheNumberTrivia(remoteTrivia);
        return Right(remoteTrivia);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localTrivia =
            await numberTriviaLocalDataSource.getLastNumberTrivia();
        return Right(localTrivia);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }
}
