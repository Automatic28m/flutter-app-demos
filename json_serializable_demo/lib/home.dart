import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:json_serializable_demo/user.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<User> users = [];

  @override
  void initState() {
    super.initState();
    fetchData();
    convertToJson();
  }

  void fetchData() async {
    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/users');

    // print(response.data);
    // Assuming User.fromJson creates a single user from a map
    users = (response.data as List<dynamic>).map((userData) {
      return User.fromJson(userData);
    }).toList();

    setState(() {});
  }

  void convertToJson() {
    User user = User("John Doe", 3, "Username", "johnDoe@test.com", "address", "0881231234", "www.test.com", "Hello world company");
    Map<String, dynamic> json = user.toJson();

    print(json);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: users.length,
              itemBuilder: (BuildContext context, index) {
                return ListTile(
                  title: Text(users[index].name),
                  subtitle: Text(users[index].email),
                );
              }),
        )
      ],
    );
  }
}
