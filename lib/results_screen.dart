import 'package:first_project/data/questions.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key,
      required this.chosenAnswers,
      required this.restartQuiz,
      required this.homePage});

  final Function restartQuiz;

  final Function homePage;

  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'Question Index': i,
        'Question': questions[i].questionText,
        'Correct Answer': questions[i].answersText[0],
        'Chosen Answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    int numTotalQuestions = questions.length;
    int numCorrectAnswers = getSummaryData().where((data) {
      return data['Chosen Answer'] == data['Correct Answer'];
    }).length;

    String emote = '😊';
    // numCorrectAnswers < 4 ? emote = '😐' : emote = '😞';

    if (numCorrectAnswers == 4 || numCorrectAnswers == 3) {
      emote = '😐';
    }

    if (numCorrectAnswers == 2 || numCorrectAnswers <= 1) {
      emote = '😞';
    }

    // String getEmote() {
    //   String emote = 'emote';
    //   if (numCorrectAnswers <= 2) {
    //     return emote = '😞'; // Sad emote for 1 or 2 correct answers
    //   } else if (numCorrectAnswers >= 3 && numCorrectAnswers <= 4) {
    //     return emote = '😐'; // Apathy emote for 3 or 4 correct answers
    //   } else {
    //     return emote = '😊'; // Happy emote for 5 or 6 correct answers
    //   }
    // }

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Result! $emote',
              style: GoogleFonts.oswald(fontSize: 40, color: Colors.white),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              textAlign: TextAlign.center,
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
              style: TextStyle(
                color: const Color.fromARGB(255, 223, 175, 248),
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 360,
              child: SingleChildScrollView(
                child: Column(
                    children: getSummaryData().map(
                  (data) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: data['Chosen Answer'] ==
                                      data['Correct Answer']
                                  ? const Color.fromARGB(255, 20, 196, 14)
                                  : const Color.fromARGB(255, 236, 37, 120),
                              borderRadius: BorderRadius.circular(90)),
                          width: 30,
                          height: 30,
                          child: Text(
                            ((data['Question Index'] as int) + 1).toString(),
                            style: GoogleFonts.lato(
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${data['Question']}",
                                style: GoogleFonts.lato(
                                  color:
                                      const Color.fromARGB(255, 243, 228, 247),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.check,
                                    color: const Color.fromARGB(
                                        255, 194, 194, 194),
                                  ),
                                  Text(
                                    data['Correct Answer'] as String,
                                    style: TextStyle(
                                        color: const Color.fromARGB(
                                            255, 180, 179, 179)),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  data['Chosen Answer'] ==
                                          data['Correct Answer']
                                      ? Icon(
                                          Icons.done_all,
                                          color: const Color.fromARGB(
                                              255, 47, 252, 81),
                                        )
                                      : Icon(
                                          Icons.clear,
                                          color: const Color.fromARGB(
                                              255, 255, 37, 37),
                                        ),
                                  Expanded(
                                    child: Text(
                                      data['Chosen Answer'] as String,
                                      style: TextStyle(
                                          color: const Color.fromARGB(
                                              255, 193, 251, 246)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  },
                ).toList()),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 20)),
              onPressed: () {
                restartQuiz();
              },
              icon: Icon(
                Icons.refresh,
                color: Colors.white,
              ),
              label: Text(
                'Restart Quiz!',
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            TextButton.icon(
              style: TextButton.styleFrom(textStyle: TextStyle(fontSize: 20)),
              onPressed: () {
                homePage();
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ),
              label: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
