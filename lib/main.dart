import 'package:chat_gpt/Controller/messageNotifier.dart';
import 'package:chat_gpt/View/screen_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MessageNotifier>(
          create: (context) => MessageNotifier(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Screen_Home(),
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
      ),
    );
  }
}
