import 'package:flutter/material.dart';
import 'package:store_demo/home.dart';
import '../Override/page_route.dart';
import 'main_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const Main(),
      onGenerateRoute: (RouteSettings setting) {
        WidgetBuilder builder = (BuildContext context) => Container();

        switch (setting.name) {
          case "home":
          {
            builder = (BuildContext context) => const Home();
            break;
          }
          default:
            builder = (BuildContext context) => const Home();
        }

        return CustomPageRoute(builder: builder, settings: setting);
      },
    );
  }
}
