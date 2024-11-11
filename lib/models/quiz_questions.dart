class QuizQuestions {
  const QuizQuestions(this.questionText, this.answersText);

  final String questionText;
  final List<String> answersText;

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answersText);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}
