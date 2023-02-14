import 'package:ebook_one/main.dart';
import 'package:ebook_one/pages/book_page.dart';
import 'package:ebook_one/pages/main_page.dart';
import 'package:flutter/material.dart';


class RouteManager {
  static const String homePage = '/';
  static const String bookPage = '/Book';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
          builder: (context) => const MainPage(),
        );
      case bookPage:
        return MaterialPageRoute(
          builder: (context) =>  BookPage(), // BookPage(files: files,),
        );

      default:
        throw const FormatException('route not found');
    }
  }
}
