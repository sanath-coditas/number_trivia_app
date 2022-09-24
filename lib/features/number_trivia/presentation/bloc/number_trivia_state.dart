import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import '../../domain/entities/number_trivia.dart';

abstract class NumberTriviaState extends Equatable {
  NumberTriviaState([List props = const <dynamic>[]]) : super();
}

class Empty extends NumberTriviaState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loading extends NumberTriviaState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loaded extends NumberTriviaState {
  final NumberTrivia trivia;

  Loaded({required this.trivia}) : super([trivia]);
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Error extends NumberTriviaState {
  final String message;

  Error({required this.message}) : super([message]);
  
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
