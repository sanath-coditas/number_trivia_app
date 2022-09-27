import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia_app/constants.dart';

import '../bloc/number_trivia_bloc.dart';
import '../bloc/number_trivia_state.dart';

class AppBody extends StatelessWidget {
  AppBody({Key? key, required this.state}) : super(key: key);
  String val = '';
  String desc = '';
  final NumberTriviaState state;
  @override
  Widget build(BuildContext context) {
    if (state is Empty) {
      val = 'Start searching....';
    }
    if (state is Loaded) {
      val = (state as Loaded).trivia.number.toString();
      desc = (state as Loaded).trivia.text;
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: Text(
                    val,
                    style: kNumberTextStyle,
                  ),
                ),
                Expanded(
                  child: Text(
                    desc,
                    textAlign: TextAlign.center,
                    style: kTriviaTextStyle,
                  ),
                ),
              ],
            )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                hintText: 'Input a number', border: OutlineInputBorder()),
            onChanged: (value) {
              val = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        HapticFeedback.vibrate();
                        BlocProvider.of<NumberTriviaBloc>(context)
                            .add(GetTriviaForConcreteNumber(numberString: val));
                      },
                      child: const Text('Search'))),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.grey),
                    ),
                    onPressed: () {
                      HapticFeedback.vibrate();
                    },
                    child: const Text(
                      'Get random trivia',
                      style: TextStyle(color: Colors.black),
                    )),
              )
            ],
          ),
        )
      ],
    );
  }
}
