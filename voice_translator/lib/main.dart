import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:voice_translator/HomeScreen.dart';
import 'package:voice_translator/language_select_page.dart';
import 'package:voice_translator/speech_to_text.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SelectLanguage(),
      // home: SpeechToTextPage(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
