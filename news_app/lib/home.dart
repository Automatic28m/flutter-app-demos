import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_app/bookmark.dart';
import 'package:news_app/provider/BookmarkProvider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    final dio = Dio();
    final response = await dio.get(
        'https://api.nytimes.com/svc/topstories/v2/home.json?api-key=0MDVBGne1TjEySH8GX25uYFy7KSgDFT6');
    // print(response.data['results']);
    data = response.data['results'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New York Times',
          style: TextStyle(color: Colors.white, fontFamily: 'Chomsky'),
        ),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Bookmark()));
            },
            icon: Row(
              children: [
                Icon(
                  Icons.bookmark,
                  color: Colors.white60,
                ),
                Text(
                  context.watch<BookmarkProvider>().bookmark.length.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Top stories',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: data.length,
              itemBuilder: (BuildContext context, index) {
                //Fields
                String title = data[index]['title'];
                List<dynamic> multimedia = data[index][
                    'multimedia']; // Replace 'multimedia' with the actual key in your data
                String section = data[index]['section'];
                String subsection = data[index]['subsection'];
                String abstract = data[index]['abstract'];

                // Check if multimedia is not empty and contains at least one item
                dynamic firstImageUrl =
                    multimedia.isNotEmpty ? multimedia[0]['url'] : '';

                return Container(
                  // decoration: BoxDecoration(
                  //     border: Border.all(
                  //   color: Colors.black,
                  //   width: 0.5,
                  // )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.network(
                        firstImageUrl,
                        fit: BoxFit.contain,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(section),
                                const SizedBox(
                                  width: 20,
                                ),
                                Text(subsection),
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                context
                                    .read<BookmarkProvider>()
                                    .saveToBookmark(title);
                              },
                              child: Container(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.bookmark_outline,
                                  color: Colors.blue,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(abstract),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
