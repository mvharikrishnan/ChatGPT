import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:chat_gpt/Constants/constants.dart';

class Services {
  static Future<String> getResponse({required String searchText}) async {
    const api_key = apiKey;
    var url = Uri.https("api.openai.com", "/v1/completions");
    final headers = {
      "Content-Type": "application/json",
      "Authorization": "Bearer $api_key",
    };
    final body = jsonEncode({
      "model": "text-davinci-003",
      "prompt": searchText,
      "temperature": 0,
      "max_tokens": 2000,
      "top_p": 1,
      "frequency_penalty": 0.0,
      "presence_penalty": 0.0
    });
    //response body
    final response = await http.post(url, headers: headers, body: body);
    // Decode the response
    Map<String, dynamic> newResponse = jsonDecode(response.body);
    return newResponse['choices'][0]['text'];
  }
}
