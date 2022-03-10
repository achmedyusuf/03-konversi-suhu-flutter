import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:konversi_suhu/statelesswidget/convert.dart';
import 'package:konversi_suhu/statelesswidget/input.dart';
import 'package:konversi_suhu/statelesswidget/output.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _inputUser = TextEditingController();
  double _kelvin = 0;
  double _celcius = 0;
  double _reamur = 0;
  void _konversiSuhu() {
    setState(() {
      _celcius = double.parse(_inputUser.text);
      _reamur = (4 * _celcius) / 5;
      _kelvin = _celcius + 273;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Konversi Suhu',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konverter Suhu"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Input(inputUser: _inputUser),
              Result(kelvin: _kelvin, reamur: _reamur),
              newMethod(),
              Convert(
                convertHandler: _konversiSuhu,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Text newMethod() => Text('Achmed Yusuf (2031710128)');
}
