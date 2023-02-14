

// import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:ebook_one/routes/routes.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

File files = File('');



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: RouteManager.homePage,
      onGenerateRoute: RouteManager.generateRoute,
    );
  }
}