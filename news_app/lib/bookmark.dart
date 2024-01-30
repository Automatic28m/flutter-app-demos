import 'package:flutter/material.dart';
import 'package:news_app/provider/BookmarkProvider.dart';
import 'package:provider/provider.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    List<String> bookmark = context.watch<BookmarkProvider>().getBookMark();

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.home,
                color: Colors.white60,
              ))
        ],
        title: Text(
          'New york times',
          style: TextStyle(color: Colors.white, fontFamily: 'Chomsky'),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Bookmark ${bookmark.length}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
              itemCount: bookmark.length,
              itemBuilder: (BuildContext context, int index) {
                String item = bookmark[index];
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              item,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              // Add your button click logic here
                              // print('${title} clicked');
                              setState(() {
                                context
                                    .read<BookmarkProvider>()
                                    .removeBookmark(item);
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.bookmark_remove,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
