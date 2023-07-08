import 'package:flutter/material.dart';
import '../services.dart/chartsBuilder.dart';

class Habitpage extends StatefulWidget {
  const Habitpage({super.key});

  @override
  State<Habitpage> createState() => _HabitpageState();
}

class _HabitpageState extends State<Habitpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Stack(
                children: [
                  Image.asset('assets/HabitsPageBackground.png'),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20,140,0,20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: const[
                          Text('Your Habits',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Use this to get inspired!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 584,
            child: ListView(
              padding: EdgeInsets.fromLTRB(10,0,10,0),
              children: [
                SizedBox(
                  height: 200,
                  child: LineChartSample1(),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: LineChartSample2(),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: LineChartSample3(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


