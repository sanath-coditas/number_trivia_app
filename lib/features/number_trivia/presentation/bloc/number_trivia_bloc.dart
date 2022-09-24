import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:number_trivia_app/core/error/failure.dart';
import 'package:number_trivia_app/core/util/input_converter.dart';
import 'package:number_trivia_app/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia_app/features/number_trivia/domain/usecases/get_random_number_trivia.dart';

import '../../domain/entities/number_trivia.dart';
import 'number_trivia_state.dart';

part 'number_trivia_event.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
const String INVALID_INPUT_FAILURE_MESSAGE =
    'Invalid Input - The number must be a positive integer or zero.';

class NumberTriviaBloc extends Bloc<NumberTriviaEvent, NumberTriviaState> {
  final InputConverter inputConverter;
  final GetConcreteNumberTrivia getConcreteNumberTrivia;
  final GetRandomNumberTrivia getRandomNumberTrivia;
  NumberTriviaBloc(
      {required this.getConcreteNumberTrivia,
      required this.getRandomNumberTrivia,
      required this.inputConverter})
      : super(Empty()) {
    on<GetTriviaForConcreteNumber>((event, emit) {
      final inputEither =
          inputConverter.stringToUnsignedInteger(event.numberString);
      inputEither.fold(
          (failure) => (emit(Error(message: INVALID_INPUT_FAILURE_MESSAGE))),
          (integer) async {
        emit(Loading());
        final failureOrTrivia =
            await getConcreteNumberTrivia(Params(number: integer));
        failureOrTrivia.fold(
            (failure) => (emit(Error(message: SERVER_FAILURE_MESSAGE))),
            (loaded) => emit(Loaded(trivia: loaded)));
      });
    });
  }
}
