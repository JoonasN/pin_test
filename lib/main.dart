import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: PinCodeTest(),
    );
  }
}

class PinCodeTest extends StatefulWidget {
  @override
  _PinCodeTestState createState() => _PinCodeTestState();
}

class _PinCodeTestState extends State<PinCodeTest> {
  final _myController = TextEditingController();

  var value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 300.0,
            width: double.infinity,
            color: Colors.white,
            child: Align(
              alignment: Alignment.center,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 32.0),
                      height: 120.0,
                      width: 270.0,
                      child: new TextField(
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        onChanged: (text) {
                          setState(() {
                            value = text;
                          });
                          if (value.length >= 6) {
                            print('LOGIN');
                          }
                        },
                        controller: _myController,
                        cursorColor: Colors.transparent,
                        cursorWidth: 0.0,
                        style: TextStyle(color: Colors.transparent),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
                        ],
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InputBall(value: value, index: 0),
                        InputBall(value: value, index: 1),
                        InputBall(value: value, index: 2),
                        InputBall(value: value, index: 3),
                        InputBall(value: value, index: 4),
                        InputBall(value: value, index: 5),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class InputBall extends StatelessWidget {
  const InputBall({Key key, @required this.value, this.index})
      : super(key: key);

  final String value;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        height: value.length == index ? 50.0 : 40.0,
        width: value.length == index ? 50.0 : 40.0,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: value.length <= index
                ? Border.all(color: Colors.green, width: 2.0)
                : Border.all(color: Colors.transparent, width: 0.0)),
        child: Center(
            child: Text(
          value.length <= index ? '' : value[index],
          style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontSize: value.length >= index ? 26.0 : 52),
        )),
      ),
    );
  }
}
