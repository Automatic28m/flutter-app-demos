import 'package:flutter/material.dart';

class BookmarkProvider extends ChangeNotifier {
  List<String> bookmark = [];

  String testMsg = "";

  void saveToBookmark(String title) {
    bookmark.add(title);
    // testMsg = title;
    notifyListeners();
    // bookmark.forEach((element) {
    //   print(object)
    //  });
    print(bookmark);
  }

  void removeBookmark(String title) {
    print(bookmark.indexOf(title));
    int index = bookmark.indexOf(title);
    bookmark.removeAt(index);
  }

  List<String> getBookMark() => bookmark;
}
