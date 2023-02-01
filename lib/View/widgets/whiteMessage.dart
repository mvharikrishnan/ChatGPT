import 'package:chat_gpt/Controller/messageNotifier.dart';
import 'package:chat_gpt/Model/messageModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class whiteMessage extends StatelessWidget {
  const whiteMessage({
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
      padding: EdgeInsets.all(10),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Chat GPT",
            style: TextStyle(fontSize: 10),
          ),
          GestureDetector(
            onLongPress: () {
              Clipboard.setData(ClipboardData(text: message.message));

              showTopSnackBar(
                Overlay.of(context)!,
                CustomSnackBar.success(
                  message: "Text copied to clipboard",
                ),
              );
            },
            child: Text(
              message.message,
              style: TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
