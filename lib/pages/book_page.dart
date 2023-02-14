import 'package:ebook_one/main.dart';
import 'package:flutter/material.dart';
import 'package:epub_view/epub_view.dart';

class BookPage extends StatefulWidget {
  final int? index;

  const BookPage({this.index, super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  late EpubController _epubController;

  @override
  void initState() {
    super.initState();
    _epubController = EpubController(
      // document: EpubDocument.openAsset('assets/book.epub'),
      document: EpubDocument.openFile(files),

      epubCfi: 'epubcfi(/6/6[chapter-2]!/4/2/1612)',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        // Show actual chapter name
        title: EpubViewActualChapter(
            controller: _epubController,
            builder: (chapterValue) => Text(
                  'Chapter: ${chapterValue?.chapter?.Title?.replaceAll('\n', '').trim() ?? ''}',
                  textAlign: TextAlign.start,
                )),
      ),
      // Show table of contents
      endDrawer: Drawer(
        child: EpubViewTableOfContents(
          controller: _epubController,
        ),
      ),

      drawer: Drawer(
        child: Column(
          children: [
            ListTile(
              onTap: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              leading: const Icon(
                Icons.arrow_back,
                size: 25,
              ),
              title: const Text('Go back'),
            ),
            ListTile(
              onTap: () {},
            ),
          ],
        ),
      ),

      // Show epub document
      body: EpubView(
        
        controller: _epubController,
      ),
    );
  }

  @override
  void dispose() {
    _epubController.dispose();
    super.dispose();
  }
}
