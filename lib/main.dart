// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calulator',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomeApp(),
    );
  }
}

class MyHomeApp extends StatefulWidget {
  const MyHomeApp({Key? key}) : super(key: key);

  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  var sum = 0;
  var n1 = 0, n2 = 0;

  final TextEditingController t1 = TextEditingController(text: '');
  final TextEditingController t2 = TextEditingController(text: '');

  void addCrow() {
    setState(() {
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      sum = n1 + n2;
    });
  }

  void subCrow() {
    setState(() {
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      sum = n1 - n2;
    });
  }

  void mulCrow() {
    setState(() {
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      sum = n1 * n2;
    });
  }

  void divCrow() {
    setState(() {
      if (t2.text == '0') {
        return;
      }
      n1 = int.parse(t1.text);
      n2 = int.parse(t2.text);
      sum = n1~/n2;
    });
  }

  void clearCrow() {
    setState(() {
      t1.text = '0';
      t2.text = '0';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Output  :   $sum',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),

            TextField(
              decoration: InputDecoration(
                hintText: 'Input a number',
              ),
              keyboardType: TextInputType.number,
              controller: t1,
            ),
//
            Padding(
              padding: EdgeInsets.all(15),
            ),
//
            TextField(
              decoration: InputDecoration(
                hintText: 'Input a number',
              ),
              keyboardType: TextInputType.number,
              controller: t2,
            ),
//
            Padding(
              padding: EdgeInsets.all(15),
            ),
//
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('+'),
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: addCrow,
                      ),
                      RaisedButton(
                        child: Text('-'),
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: subCrow,
                      ),
                    ],
                  ),
                  //
                  Padding(
                    padding: EdgeInsets.all(5),
                  ),
                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      RaisedButton(
                        child: Text('*'),
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: mulCrow,
                      ),
                      RaisedButton(
                        child: Text('/'),
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: divCrow,
                      ),
                    ],
                  ),
//
                ],
              ),
            ),
//
            RaisedButton(
              child: Text('Clear/AC'),
              color: Colors.red,
              textColor: Colors.white,
              onPressed: clearCrow,
            ),
          ],
        ),
      ),
    );
  }
}
