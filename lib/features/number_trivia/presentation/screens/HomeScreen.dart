import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:number_trivia_app/constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Number Trivia'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 3,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Sample',
                      style: kNumberTextStyle,
                    ),
                    Text(
                      'Sample Text',
                      textAlign: TextAlign.center,
                      style: kTriviaTextStyle,
                    ),
                  ],
                )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(32.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    hintText: 'Input a number', border: OutlineInputBorder()),
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
                          },
                          child: const Text('Search'))),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.grey),
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
        ),
      ),
    );
  }
}
