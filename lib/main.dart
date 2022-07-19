import 'package:flutter/material.dart';
import 'package:music_application/screen/music_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Lyrics Of Any Song',
        home: MusicListScreen());
  }
}
