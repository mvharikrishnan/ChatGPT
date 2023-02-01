import 'package:chat_gpt/Model/messageModel.dart';
import 'package:chat_gpt/Services/networkServices.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class MessageNotifier extends ChangeNotifier {
  List<MessageModel> messageList = [
    MessageModel(
        message: "Hey You can ask me anything", type: messageType.chatGpt),
  ];
   runGPT({required String promt}) async {
    //user promt
    final userPromt = MessageModel(
      message: promt,
      type: messageType.user,
    );
    messageList.add(userPromt);
    notifyListeners();
    final response = await Services.getResponse(searchText: promt);
    final gptPromt = MessageModel(message: response, type: messageType.chatGpt);
    messageList.add(gptPromt);
    notifyListeners();
  }
}
