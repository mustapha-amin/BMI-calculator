import 'dart:math';
import 'package:bmi_calculator/spacings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  String? result = '';
  String? remark = '';

  _calculateBmi() {
    setState(() {
      double? weight = double.tryParse(weightController.text);
      double? height = double.tryParse(heightController.text)! * 0.305;
      var bmi = (weight! / (pow(height, 2)));
      if (bmi < 18.5) {
        remark = "You're underweight";
      } else if (bmi <= 24.9) {
        remark = "Your body is normal";
      } else if (bmi <= 29.9) {
        remark = "You're overweight";
      } else {
        remark = "You're obese";
      }
      result = bmi.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "$result",
                      style: const TextStyle(
                        fontSize: 39,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "$remark",
                      style: const TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  TextField(
                    controller: heightController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.white,
                          style: BorderStyle.solid,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter your height(ft)",
                      hintStyle: const TextStyle(color: Colors.white),
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                  addVerticalSpace(30),
                  TextField(
                    controller: weightController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "Enter your weight(kg)",
                    ),
                    keyboardType:
                        const TextInputType.numberWithOptions(decimal: true),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.amber)),
                  onPressed: () {
                    _calculateBmi();
                  },
                  child: const Text(
                    "Calculate BMI",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
