import 'package:first_project/questions_screen.dart';
import 'package:first_project/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:first_project/data/questions.dart';
import 'package:first_project/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // Widget? activeScreen;
  // @override
  // void initState() {
  //   super.initState();
  //   activeScreen = StartScreen(switchScreen);
  // }
  List<String> selectedAnswers = [];
  var activeScreen = 'StartScreen';

  void switchScreen() {
    setState(
      () {
        activeScreen = 'QuestionsScreen';
      },
    );
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'QuestionsScreen';
      selectedAnswers = [];
      // print('object');
    });
  }

  void homePage() {
    setState(() {
      activeScreen = 'StartScreen';
      selectedAnswers = [];
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    setState(() {
      if (selectedAnswers.length == questions.length) {
        // selectedAnswers = [];
        activeScreen = 'ResultsScreen';
      }
    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'QuestionsScreen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'StartScreen') {
      screenWidget = StartScreen(switchScreen);
    }

    if (activeScreen == 'ResultsScreen') {
      screenWidget = ResultsScreen(
          chosenAnswers: selectedAnswers,
          restartQuiz: restartQuiz,
          homePage: homePage);
    }

    // if (activeScreen == 'Start-Screen') {
    //   screenWidget = ResultsScreen(
    //       chosenAnswers: selectedAnswers, restartQuiz: restartQuiz);
    // }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 77, 1, 132),
                Color.fromARGB(255, 121, 2, 201),
              ],
            ),
          ),
          child: screenWidget,
          //Alternative => child: activeScreen == 'Start-Screen'
          //                    ? StartScreen(switchScreen)
          //                    : const QuestionsScreen(),
        ),
      ),
    );
  }
}
