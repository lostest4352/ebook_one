import 'package:ebook_one/main.dart';
import 'package:ebook_one/routes/routes.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // List files = [File('')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                pickFile();
                
                
              },
              child: const Text('Open a ebook'),
            ),
            const SizedBox(
              height: 10,
            ),
            // ElevatedButton(
            //   onPressed: () {
            //     // pickFile();
            //   },
            //   child: const Text('Included epub'),
            // ),
          ],
        ),
      ),
    );
  }

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: ['epub']);

    if (result != null) {
      setState(() {
        // Use this for multiple files
        // files = result.paths.map((path) => File(path.toString())).toList();

        // Use this for single file
        files = File(result.files.single.path.toString());
        Navigator.of(context).pushNamed(RouteManager.bookPage, arguments: files);
      });
    }
  }
}
