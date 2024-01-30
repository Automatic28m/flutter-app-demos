import 'package:flutter/material.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // actions: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: Icon(
        //         Icons.arrow_back,
        //         color: Colors.white60,
        //       ))
        // ],
        title: const Text(
          'New york times',
          style: TextStyle(color: Colors.white, fontFamily: 'Chomsky'),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Bookmark',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
