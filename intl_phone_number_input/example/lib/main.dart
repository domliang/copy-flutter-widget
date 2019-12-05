import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Intl Phone Number Input'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String phoneNumber = '';
  FocusNode phoneNumberFocusNode = FocusNode();
  bool valid = false;

  void onPhoneNumberChanged(String phoneNumber) {
    print(phoneNumber);
    setState(() {
      this.phoneNumber = phoneNumber;
    });
  }

  void onInputChanged(bool value) {
    print(value);
    setState(() {
      valid = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: Text(
                  'Default Constructor',
                  style: Theme.of(context)
                      .primaryTextTheme
                      .body1
                      .apply(fontSizeFactor: 1.5, color: Colors.black),
                ),
              ),
              InternationalPhoneNumberInput(
                // focusNode: phoneNumberFocusNode,
                errorMessage: 'error',
                hintText: 'hint',
                onInputChanged: (v) {
                  print('onInputChanged phone number $v');
                },
                onInputValidated: (v) {
                  print('验证--------> $v');
                },
                shouldParse: true,
                shouldValidate: true,
                initialCountry2LetterCode: 'CN',
                formatInput: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
