part of 'number_trivia_bloc.dart';

abstract class NumberTriviaEvent extends Equatable {
  NumberTriviaEvent();

  @override
  List<Object> get props => [];
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;
  GetTriviaForConcreteNumber({required this.numberString});
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {
  final String numberString;
  GetTriviaForRandomNumber({required this.numberString});
}
