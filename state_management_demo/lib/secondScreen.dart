import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/provider/CounterProvider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CounterProvider(),
        ),
      ],
      child: MaterialApp(
        home: Directionality(
          textDirection:
              TextDirection.ltr, // or TextDirection.rtl based on your language
          child: Scaffold(
            body: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Text(context.watch<CounterProvider>().count.toString()),
                    Center(
                      child: Text("Second screen"),
                    )
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
    );
  }
}
