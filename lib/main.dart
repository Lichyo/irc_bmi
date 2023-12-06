import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(const BMI());

class BMI extends StatefulWidget {
  const BMI({super.key});

  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  Color kInactiveCardColor = const Color(0xFF0A0E21);
  Color kActiveCardColor = const Color(0xFF1D1E33);
  String selectedGender = '';
  double height = 160;
  int age = 20;
  int weight = 50;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'male';
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedGender == 'male'
                                ? kActiveCardColor
                                : kInactiveCardColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Column(
                            children: [
                              Expanded(
                                child: Icon(
                                  FontAwesomeIcons.mars,
                                  size: 80,
                                ),
                              ),
                              Text(
                                'Male',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        selectedGender = 'female';
                        setState(() {});
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: selectedGender == 'female'
                                ? kActiveCardColor
                                : kInactiveCardColor,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Column(
                            children: [
                              Expanded(
                                child: Icon(
                                  FontAwesomeIcons.venus,
                                  size: 80,
                                ),
                              ),
                              Text(
                                'Female',
                                style: TextStyle(
                                  fontSize: 30,
                                ),
                              ),
                              SizedBox(
                                height: 20.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Text(
                      'height : ${height.toInt()} cm',
                      style: const TextStyle(fontSize: 30.0),
                    ),
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Slider(
                    max: 200,
                    min: 80,
                    value: height,
                    onChanged: (value) {
                      setState(() {
                        height = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        const Text(
                          'Age',
                          style: TextStyle(fontSize: 30.0),
                        ),
                        Text(
                          age.toString(),
                          style: const TextStyle(fontSize: 50.0),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: const Icon(
                                  Icons.exposure_minus_1_outlined,
                                  size: 70.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.plus_one,
                                  size: 70.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 30.0,
                        ),
                        const Text(
                          'Weight',
                          style: TextStyle(fontSize: 30.0),
                        ),
                        Text(
                          weight.toString(),
                          style: const TextStyle(fontSize: 50.0),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: const Icon(
                                  Icons.exposure_minus_1_outlined,
                                  size: 70.0,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: const Icon(
                                  Icons.plus_one,
                                  size: 70.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: OutlinedButton(
                  onPressed: () {
                    final double bmi =
                        weight / ((height / 100) * (height / 100));
                    print('weight: $weight');
                    print('height: ${height.round()}');
                    print('BMI: ${bmi.round()}');
                  },
                  child: const SizedBox(
                    width: double.infinity,
                    child: Text(
                      'CALCULATE',
                      style: TextStyle(fontSize: 20.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
