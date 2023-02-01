import 'package:chat_gpt/Controller/messageNotifier.dart';
import 'package:chat_gpt/Model/messageModel.dart';

import 'package:flutter/material.dart';

class GreenMessage extends StatelessWidget {
  const GreenMessage({
    required this.message,
    required this.messageNotifier,
    Key? key,
  }) : super(key: key);
  final MessageModel message;
  final MessageNotifier messageNotifier;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            bottomLeft: Radius.circular(15)),
        color: Colors.green,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            "User",
            style: TextStyle(fontSize: 10),
          ),
          Text(
            message.message,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
