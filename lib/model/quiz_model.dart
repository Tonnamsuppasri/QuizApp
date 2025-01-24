class QuizModel {
  String question;
  List<String> answers;
  

  QuizModel(this.question, this.answers);

  List<String> getShuffledAnswers() {
    final shuffledAnswers = List.of(answers);
    shuffledAnswers.shuffle();
    return shuffledAnswers;
  }
}