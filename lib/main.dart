import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSS UNIT CONVERTER',
      theme: ThemeData(
        fontFamily: 'Raleway Regular',
        hintColor: Colors.blue,
        primaryColor: Colors.white,
        inputDecorationTheme: const InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
          hintStyle: TextStyle(color: Colors.blue),
        ),
      ),
      home: const MyHomePage(title: 'CSS UNIT CONVERTER'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double pixel;
  late double rem = 0.0625;
  late double em = 0.0625;
  late double mm = 0.2645833333;
  late double inch = 0.0104166667;

  final pxController = TextEditingController();
  final remController = TextEditingController();
  final emController = TextEditingController();
  final mmController = TextEditingController();
  final inController = TextEditingController();

  void _pxChanged(String text) {
    if (text.isEmpty) {
      remController.text = '';
      emController.text = '';
      mmController.text = '';
      inController.text = '';
    } else {
      double inputPx = double.parse(text);
      double outputRem = inputPx * rem;
      double outputEm = inputPx * em;
      double outputMm = inputPx * mm;
      double outputIn = inputPx * inch;

      remController.text = outputRem.toStringAsFixed(2);
      emController.text = outputEm.toStringAsFixed(2);
      mmController.text = outputMm.toStringAsFixed(2);
      inController.text = outputIn.toStringAsFixed(2);
    }
  }

  void _remChanged(String text) {
    if (text.isEmpty) {
      pxController.text = '';
      emController.text = '';
      mmController.text = '';
      inController.text = '';
    } else {
      double inputRem = double.parse(text);
      double outputPx = inputRem / rem;
      double outputEm = inputRem;
      double outputMm = outputPx * mm;
      double outputIn = outputPx * inch;

      pxController.text = outputPx.toStringAsFixed(2);
      emController.text = outputEm.toStringAsFixed(2);
      mmController.text = outputMm.toStringAsFixed(2);
      inController.text = outputIn.toStringAsFixed(2);
    }
  }

  void _emChanged(String text) {
    if (text.isEmpty) {
      pxController.text = '';
      remController.text = '';
      mmController.text = '';
      inController.text = '';
    } else {
      double inputEm = double.parse(text);
      double outputPx = inputEm / em;
      double outputRem = inputEm;
      double outputMm = outputPx * mm;
      double outputIn = outputPx * inch;

      pxController.text = outputPx.toStringAsFixed(2);
      remController.text = outputRem.toStringAsFixed(2);
      mmController.text = outputMm.toStringAsFixed(2);
      inController.text = outputIn.toStringAsFixed(2);
    }
  }

  void _mmChanged(String text) {
    if (text.isEmpty) {
      pxController.text = '';
      remController.text = '';
      emController.text = '';
      inController.text = '';
    } else {
      double inputMm = double.parse(text);
      double outputPx = inputMm / mm;
      double outputRem = outputPx * rem;
      double outputEm = outputRem;
      double outputIn = outputPx * inch;

      pxController.text = outputPx.toStringAsFixed(2);
      remController.text = outputRem.toStringAsFixed(2);
      emController.text = outputEm.toStringAsFixed(2);
      inController.text = outputIn.toStringAsFixed(2);
    }
  }

  void _inChanged(String text) {
    if (text.isEmpty) {
      pxController.text = '';
      remController.text = '';
      emController.text = '';
      mmController.text = '';
    } else {
      double inputIn = double.parse(text);
      double outputPx = inputIn / inch;
      double outputRem = outputPx * rem;
      double outputEm = outputRem;
      double outputMm = outputPx * mm;

      pxController.text = outputPx.toStringAsFixed(2);
      remController.text = outputRem.toStringAsFixed(2);
      emController.text = outputEm.toStringAsFixed(2);
      mmController.text = outputMm.toStringAsFixed(2);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.title),
      //   centerTitle: true,
      // ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.code,
              size: 150.0,
              color: Colors.blue,
            ),
            const Center(
              child: Text(
                'CSS UNIT CONVERTER',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Raleway Bold',
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
              child: Divider(
                color: Colors.transparent,
              ),
            ),
            buildTextField('Pixel', 'px ', pxController, _pxChanged),
            const Divider(color: Colors.transparent),
            buildTextField(
                'Root element font-size', 'rem ', remController, _remChanged),
            const Divider(color: Colors.transparent),
            buildTextField(
                'Element font-size', 'em ', emController, _emChanged),
            const Divider(color: Colors.transparent),
            buildTextField('Millimeter', 'mm ', mmController, _mmChanged),
            const Divider(color: Colors.transparent),
            buildTextField('Inches', 'in ', inController, _inChanged),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(String label, String prefix,
    TextEditingController fieldController, Function(String) func) {
  return TextField(
    controller: fieldController,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.blue,
      ),
      prefixText: prefix,
      prefixStyle: const TextStyle(color: Colors.blue),
    ),
    style: const TextStyle(
      color: Colors.blue,
      fontSize: 20.0,
    ),
    keyboardType: TextInputType.number,
    onChanged: func,
  );
}



//  TextField(
//               decoration: InputDecoration(
//                 labelText: 'Pixel',
//                 labelStyle: TextStyle(
//                   color: Colors.blue,
//                 ),
//                 prefixText: 'px ',
//                 prefixStyle: TextStyle(color: Colors.blue),
//               ),
//               style: TextStyle(
//                 color: Colors.blue,
//                 fontSize: 20.0,
//               ),
//               keyboardType: TextInputType.number,
//             ),