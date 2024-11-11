import 'package:first_project/answer_button.dart';
import 'package:first_project/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({required this.onSelectAnswer, super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    // setState(() {
    //   currentIndex = currentIndex + 1;
    //   });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.questionText,
              style: GoogleFonts.lato(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 255, 255, 255),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map((optionText) {
              return AnswerButton(
                answerText: optionText,
                onTap: () => {
                  answerQuestion(optionText),
                  if (currentQuestionIndex < questions.length)
                    {
                      {setState(() => currentQuestionIndex++)}
                    }
                },
              );
            }),
            // AnswerButton(
            //     answerText: currentQuestion.answersText[0], onTap: nextQuestion
            //     //() => setState(() => currentIndex++)
            //     ),
            // AnswerButton(
            //     answerText: currentQuestion.answersText[1], onTap: nextQuestion
            //     //() => setState(() => currentIndex++)
            //     ),
            // AnswerButton(
            //     answerText: currentQuestion.answersText[2], onTap: nextQuestion
            //     //() => setState(() => currentIndex++)
            //     ),
            // AnswerButton(
            //     answerText: currentQuestion.answersText[3], onTap: nextQuestion
            //     // () => setState(() => currentIndex++)
            //     ),
          ],
        ),
      ),
    );
  }
}
