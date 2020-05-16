//application.dart
import 'package:flutter/material.dart';
import 'package:sample_flutter_app/pages/gallery_page/gallery_page.dart';
import 'package:sample_flutter_app/pages/home_page/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter workshop",
      theme: ThemeData(
        primaryColor: Colors.white,
        buttonColor: Colors.lightBlue,
      ),
//      home: HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/gallery_page': (context) => GalleryPage()
      },
    );
  }
}
