import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_demo/provider/CounterProvider.dart';
import 'package:state_management_demo/secondScreen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

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
              body: Center(
                child: Text(context.watch<CounterProvider>().count.toString()),
              ),
              floatingActionButton: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      context.read<CounterProvider>().increment();
                    },
                    child: Icon(Icons.add),
                  ),
                  SizedBox(width: 10,),
                  FloatingActionButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
