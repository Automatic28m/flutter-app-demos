import 'package:flutter/material.dart';
import 'package:store_demo/Components/bottom_nav.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      bottomNavigationBar: BottomNavbar(),
      body: Placeholder(),
    );
  }
}