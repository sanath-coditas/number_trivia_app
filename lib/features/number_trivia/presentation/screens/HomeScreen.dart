import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:number_trivia_app/features/number_trivia/presentation/bloc/number_trivia_bloc.dart';
import 'package:number_trivia_app/features/number_trivia/presentation/widgets/app_body.dart';
import '../bloc/number_trivia_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        centerTitle: false,
        title: const Text('Number Trivia'),
      ),
      body: BlocBuilder<NumberTriviaBloc, NumberTriviaState>(
        builder: (context, state) {
          if (state is Empty) {
            return AppBody(state: state);
          }
          if (state is Loading) {
            return const Center(child: Text('Loading.....'));
          } else if (state is Loaded) {
            return AppBody(state: state);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
