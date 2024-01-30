import 'package:flutter/material.dart';

class CustomPageRoute extends MaterialPageRoute {
  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);

  CustomPageRoute({builder, required RouteSettings settings})
      : super(builder: builder);
}
