import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Timer? _timer;
  Timer? _timer2;

  String alienDirection = "right";

  @override
  void initState() {
    super.initState();

    _timer = Timer.periodic(
      const Duration(milliseconds: 500),
      (Timer timer) {
        if (alien.isNotEmpty) {
          if (alien.contains(30)) {
            alienDirection = "left";
          }

          if (alien.contains(16)) {
            alienDirection = "right";
          }

          switch (alienDirection) {
            case "left":
              alienMoveLeft();
              break;
            case "right":
              alienMoveRight();
              break;
            default:
              alienMoveRight();
          }
        }
      },
    );

    _timer2 = Timer.periodic(
      const Duration(seconds: 2),
      (Timer timer) {
        alienFire();
      },
    );
  }

  void alienMoveRight() {
    alienMissleX -= 1;
    for (var i = 0; i < alien.length; i++) {
      setState(() {
        alien[i] += 1;
      });
    }
  }

  void alienMoveLeft() {
    alienMissleX += 1;
    for (var i = 0; i < alien.length; i++) {
      setState(() {
        alien[i] -= 1;
      });
    }
  }

  List<int> player = [308, 322, 323, 324];
  // List<int> player = [308];

  List<int> alien = [
    17,
    18,
    19,
    20,
    33,
    34,
  ];

  int alienMissle = 0;
  int alienMissleX = 3;

  // int missle = 308 - 15;
  int missle = 0;
  // int missleX = 7;

  int gridWidth = 15;
  int gridHeight = 23;

  playerFireClick() async {
    // int pos = missleX;
    missle = player.last;
    for (int i = 21; i >= 0; i--) {
      await Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          // missle = 15 * i - pos;
          missle -= 15;
          // i = y, 7 = x
          // print("Missle Position X : ${pos}");
          // print("Missle Position Y : ${missle}");
          if (alien.contains(missle)) {
            alien.removeAt(alien.indexOf(missle));
            // print("alien has neen shot");
            i = 0;
            missle = 0;
            // if (alien.isEmpty) {
            //   Navigator.pop(context);
            // }
          }
        });
      });
    }
  }

  alienFire() async {
    // print("Alien has fired");
    // int pos = alienMissleX;
    alienMissle = alien.last;
    for (int i = 1; i <= 24; i++) {
      await Future.delayed(
        const Duration(milliseconds: 100),
        () {
          setState(() {
            alienMissle += 15;
            if (player.contains(alienMissle)) {
              player.removeAt(player.indexOf(alienMissle));
              // print("You has neen shot");
              i = 0;
              alienMissle = 0;
              // if (player.isEmpty) {
              //   Navigator.pop(context);
              // }
            }
          });
        },
      );
    }
  }

  playerMoveLeft() {
    if (player.first != 316 || player.last != 316) {
      for (var i = 0; i < player.length; i++) {
        setState(() {
          player[i] -= 1;
        });
      }
    } else {
      print("Player hit border");
    }
  }

  void playerMoveRight() {
    if (player.first != 330 || player.last != 330) {
      for (var i = 0; i < player.length; i++) {
        setState(() {
          player[i] += 1;
        });
      }
    } else {
      print("Player hit border");
    }
  }

  GestureDetector actionButton(Icon icon, VoidCallback voidCallback) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: 1.0, color: Colors.black),
        ),
        width: 80,
        height: 80,
        child: Center(
          child: IconButton(
            onPressed: () {
              voidCallback();
            },
            icon: icon,
            color: Colors.black,
            iconSize: 40.0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  color: Colors.black,
                  child: GridView.count(
                    crossAxisSpacing: 1,
                    mainAxisSpacing: 1,
                    crossAxisCount: gridWidth,
                    children: [
                      for (int i = 1; i <= gridWidth * gridHeight; i++)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0),
                            color: player.contains(i)
                                ? Colors.blue
                                : alien.contains(i)
                                    ? Colors.green
                                    : i == missle
                                        ? Colors.red
                                        : i == alienMissle
                                            ? Colors.lime
                                            : Colors.black,
                            // border: Border.all(color: Colors.black87, width: 1.0),
                          ),
                          child: Center(
                              // child: Text(
                              //   i.toString(),
                              // ),
                              ),
                        ),
                    ],
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: player.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            actionButton(
                              const Icon(Icons.arrow_left),
                              () => playerMoveLeft(),
                            ),
                            actionButton(
                              const Icon(Icons.arrow_upward),
                              () => playerFireClick(),
                            ),
                            actionButton(
                              const Icon(Icons.arrow_right),
                              () => playerMoveRight(),
                            ),
                          ],
                        )
                      : Container()),
            ],
          ),
        ),
      ),
    );
  }
}
