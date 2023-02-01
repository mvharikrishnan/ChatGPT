import 'package:chat_gpt/Controller/messageNotifier.dart';
import 'package:chat_gpt/Model/messageModel.dart';
import 'package:chat_gpt/View/widgets/greenMessage.dart';

import 'package:chat_gpt/View/widgets/textEditingWidget.dart';
import 'package:chat_gpt/View/widgets/whiteMessage.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Screen_Home extends StatelessWidget {
  const Screen_Home({super.key});

  @override
  Widget build(BuildContext context) {
    final messageData = Provider.of<MessageNotifier>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            "Chat GPT",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: messageData.messageList.length,
              itemBuilder: (context, index) {
                if (messageData.messageList[index].type ==
                    messageType.chatGpt) {
                  return whiteMessage(
                    message: messageData.messageList[index],
                    messageNotifier: messageData,
                  );
                } else {
                  return GreenMessage(
                    message: messageData.messageList[index],
                    messageNotifier: messageData,
                  );
                }
              },
            )),
            //text editin controller
            TextEditingWigdet()
          ],
        ));
  }
}
