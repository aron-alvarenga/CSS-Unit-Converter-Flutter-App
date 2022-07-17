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
            buildTextField('Pixel', 'px '),
            const Divider(color: Colors.transparent),
            buildTextField('Root element font-size', 'rem '),
            const Divider(color: Colors.transparent),
            buildTextField('Element font-size', 'em '),
            const Divider(color: Colors.transparent),
            buildTextField('Millimeter', 'mm '),
            const Divider(color: Colors.transparent),
            buildTextField('Inches', 'inches '),
            const Divider(color: Colors.transparent),
            buildTextField('Dots per inch', 'dpi '),
            const Divider(color: Colors.transparent),
            buildTextField('Viewport height', 'vh '),
          ],
        ),
      ),
    );
  }
}

Widget buildTextField(String label, String prefix) {
  return TextField(
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