import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:number_trivia_app/constants.dart';
import 'package:number_trivia_app/core/util/input_converter.dart';
import 'package:number_trivia_app/features/number_trivia/data/datasources/number_trivia_local_datasources.dart';
import 'package:number_trivia_app/features/number_trivia/data/datasources/number_trivia_remote_datasources.dart';
import 'package:number_trivia_app/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';
import 'package:number_trivia_app/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia_app/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia_app/features/number_trivia/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia_app/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:number_trivia_app/features/number_trivia/presentation/screens/HomeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'package:http/http.dart' as http;

dynamic sp;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await di.init();
  sp = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return NumberTriviaBloc(
            getConcreteNumberTrivia: GetConcreteNumberTrivia(
                NumberTriviaRepositoryImpl(
                    numberTriviaLocalDataSource:
                        NumberTriviaLocalDataSourceImpl(sharedPreferences: sp),
                    numberTriviaRemoteDataSource:
                        NumberTriviaRemoteDataSourceImpl(
                            client: http.Client()))),
            getRandomNumberTrivia: GetRandomNumberTrivia(
                numberTriviaRepository: NumberTriviaRepositoryImpl(
                    numberTriviaLocalDataSource:
                        NumberTriviaLocalDataSourceImpl(sharedPreferences: sp),
                    numberTriviaRemoteDataSource:
                        NumberTriviaRemoteDataSourceImpl(
                            client: http.Client()))),
            inputConverter: InputConverter());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: customPrimarySwatch),
        home: const HomeScreen(),
      ),
    );
  }
}
