import 'package:chat_gpt/Constants/constants.dart';
import 'package:chat_gpt/Controller/messageNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TextEditingWigdet extends StatelessWidget {
  TextEditingWigdet({
    Key? key,
  }) : super(key: key);
  final TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final messagedata = Provider.of<MessageNotifier>(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: size.width - 70,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              controller: textEditingController,
              decoration:
                  InputDecoration(hintText: hintText, border: InputBorder.none),
            ),
          ),
          InkWell(
            onTap: () {
              final userSearchPromt = textEditingController.text.trim();
              messagedata.runGPT(promt: userSearchPromt);
            },
            child: const CircleAvatar(
              radius: 25,
              backgroundColor: Colors.transparent,
              child: Icon(
                Icons.telegram_sharp,
                color: Colors.green,
                size: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
