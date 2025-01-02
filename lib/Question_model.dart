import 'dart:convert';

// Convert JSON string to a list of QuestionModel
List<QuestionModel> questionModelFromJson(String str) =>
    List<QuestionModel>.from(json.decode(str).map((x) => QuestionModel.fromJson(x)));

// Convert a list of QuestionModel to a JSON string
String questionModelToJson(List<QuestionModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// QuestionModel class
class QuestionModel {
  QuestionModel({
    required this.id,
    required this.topicId,
    required this.question,
    required this.answer,
  });

  int id;          // Unique ID for the question
  int topicId;     // ID of the topic this question belongs to
  String question; // The question text
  String answer;   // The answer to the question

  // Factory constructor to create a QuestionModel from a JSON map
  factory QuestionModel.fromJson(Map<String, dynamic> json) => QuestionModel(
    id: json["id"],
    topicId: json["topic_id"],
    question: json["question"],
    answer: json["answer"],
  );

  // Convert a QuestionModel instance to a JSON map
  Map<String, dynamic> toJson() => {
    "id": id,
    "topic_id": topicId,
    "question": question,
    "answer": answer,
  };
}
