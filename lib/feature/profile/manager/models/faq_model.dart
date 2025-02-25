class FaqModel {
  String question;
  String answer;

  FaqModel({this.question = '', this.answer = ''});

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
      question: json["question"].toString(), answer: json["answer"].toString());
}
