import 'package:number_trivia_app/features/number_trivia/domain/entities/number_trivia.dart';

class NumberTriviaModel extends NumberTrivia {
  
  String text;
  int number;
  NumberTriviaModel({required this.number, required this.text})
      : super(number: number, text: text);

  factory NumberTriviaModel.fromJson(Map<String, dynamic> json) {
  return NumberTriviaModel(
    text: json['text'],
    // The 'num' type can be both a 'double' and an 'int'
    number: (json['number'] as num).toInt(),
  );
}
 Map<String, dynamic> toJson() {
    return {
      'text': text,
      'number': number,
    };
  }

}
