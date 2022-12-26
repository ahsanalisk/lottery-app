import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Random random = Random();
  int x = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff764abc),
          title: Center(
            child: Text("Lottery App"),
          )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            "Your Lottery Number is 4",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 250,
            width: 300,
            decoration: BoxDecoration(
                color: x == 4
                    ? Color(0xff764abc).withOpacity(.5)
                    : Color(0xff764abc).withOpacity(.2),
                borderRadius: BorderRadius.circular(15)),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: x == 4
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.thumb_up_rounded,
                          color: Colors.green,
                          size: 25,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Congratulation You Won The Lottery Your Number is $x\n ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        )
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 35,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Better Luck Next Time\n Try Again",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
            ),
          ),
          SizedBox(height: 20),
          ExpansionTile(
            title: Center(
                child:
                    Text("Rules of the Game", style: TextStyle(fontSize: 18))),
            children: [
              ListTile(
                title: Text(
                    "1. Press the refresh button to generate a new lottery number"),
              ),
              ListTile(
                title: Text("2. If the number is 4, you win the lottery!"),
              ),
              ListTile(
                title: Text("3. If the number is not 4, try again"),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff764abc),
        onPressed: () {
          x = random.nextInt(5);
          print(x);
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    ));
  }
}
