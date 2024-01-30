import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/home.dart';
import 'package:state_management_demo/provider/CounterProvider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const MainApp(),
    ),
  );
}