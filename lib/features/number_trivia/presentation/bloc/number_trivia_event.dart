part of 'number_trivia_bloc.dart';

abstract class NumberTriviaEvent extends Equatable {
  const NumberTriviaEvent();

  @override
  List<Object> get props => [];
}

class GetTriviaForConcreteNumber extends NumberTriviaEvent {
  final String numberString;
  const GetTriviaForConcreteNumber({required this.numberString});
}

class GetTriviaForRandomNumber extends NumberTriviaEvent {
  final String numberString;
  const GetTriviaForRandomNumber({required this.numberString});
}
