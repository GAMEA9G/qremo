import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:qremo/constants.dart'; // Adjust the import path based on your project structure
import 'package:qremo/Question_model.dart'; // Adjust the import path based on your project structure

class ApiService {
  Future<List<QuestionModel>?> getQuestions() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.QuestionbytopicEndpoint); // Update endpoint as needed
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // Convert the JSON response to a list of QuestionModel
        List<QuestionModel> questions = questionModelFromJson(response.body);
        return questions;
      } else {
        log('Failed to load questions. Status code: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      log('Error fetching questions: $e');
      return null;
    }
  }
}
