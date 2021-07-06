import 'package:emoji_ui/DashboardPage.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(EmojiApp());
}

class EmojiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Emoji App",
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}
