import 'package:flutter/material.dart';
import 'package:store_demo/Components/base_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const BaseScreen();
  }
}
