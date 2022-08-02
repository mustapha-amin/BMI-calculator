import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController _resultController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: const Text(
          "BMI Calculator",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              controller: _resultController,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Divider(),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text("What's your age?"),
                TextField(
                  controller: _ageController,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Text("What's your height(Ft)"),
                    TextField(controller: _heightController),
                  ],
                ),
                Column(
                  children: [
                    Text("What's your weight(Kg)"),
                    TextField(
                      controller: _weightController,
                    ),
                  ],
                )
              ],
            ),
          ),
          const ElevatedButton(
            // style: ElevatedButton.styleFrom()
            onPressed: null,
            child: Text("Calculate Your BMI"),
          )
        ],
      ),
    );
  }
}
