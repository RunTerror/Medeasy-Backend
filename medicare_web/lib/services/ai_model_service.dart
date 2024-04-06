import 'package:google_generative_ai/google_generative_ai.dart';

const apiKey = 'AIzaSyCMnSa2M_K95X8T6lAjt0SHgl4PwiAhp_A';

class AIService {
  Future<String?> api(String input) async {
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

    final prompt =
        '''You are a medical expert. You have been provided a patient's problems in sentences.
Convert this sentences in proper english so that the doctor can diagnose the diseases properly.
The output should be very specific to the original input sentence. The better the english the better the doctor would be able to diagnose.
Return the output in only one line. Describe the symptoms from first person

$input''';
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    print("api1: ${response.text}");
    return response.text;
  }

  Future<String?> genQuesTextApi(String input) async {
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

    final prompt =
        '''Please assist me with formulating questions to ask a patient based on their symptoms. I will Provide a brief description of the symptoms (e.g., "sore throat, cough, fatigue"), and  you will generate four relevant questions a healthcare professional might ask to gather more details. 
For example, if I provide "sore throat, cough, fatigue," I can generate four questions related to these symptoms.
So, below are the patient's symptoms I like to ask questions about:

$input''';
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    print("api2: ${response.text}");
    return response.text;
  }

  Future<String?> findQuesApi(String input) async {
    final model = GenerativeModel(model: 'gemini-pro', apiKey: apiKey);

    final prompt =
        '''Please assit me with finding the questions mentioned in the below text and please don't give any text other than questions, not even the text like:The four questions a healthcare professional might ask to gather more details, as mentioned in the text, are:

here is the text below:

$input''';
    final content = [Content.text(prompt)];
    final response = await model.generateContent(content);
    print("api3: ${response.text}");
    return response.text;
  }
}
