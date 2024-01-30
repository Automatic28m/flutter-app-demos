import 'package:flutter/material.dart';

class BookmarkProvider extends ChangeNotifier {
	List<String> bookmark = [];

	void saveToBookmark(title) {
		bookmark.add(title);
		notifyListeners();
	}
}