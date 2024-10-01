import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rowad_classes/Student/tranning/quiz/second_popup.dart';
import 'package:rowad_classes/constants/colors.dart';

class PopupQuiz extends StatefulWidget {
  @override
  _PopupQuizState createState() => _PopupQuizState();

  static void showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return PopupQuiz(); 
      },
    );
  }
}

class _PopupQuizState extends State<PopupQuiz> {
  final int _initialTime = 1557; // Start timer from 1557 seconds

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Dialog(
        backgroundColor: Color.fromARGB(255, 238, 224, 210),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                    color: Color(0xff009320),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.alarm, size: 20, color: Colors.white),
                          SizedBox(width: 8),
                          Text(
                            _formatTime(_initialTime),
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.cancel, color: Colors.red, size: 30),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Image.asset('assets/images/quiz.png'),
              SizedBox(height: 10),
              Text(
                'هل أنت مستعد للبدئ في اختبار الدرس؟',
                style: TextStyle(
                  color: ColorRowad,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'لا',
                      style: TextStyle(
                        color: ColorRowad,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: darkYellow, width: 2),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(); 
                      SecondPopup.showPopup(context, _initialTime, 0); 
                    },
                    child: Text(
                      'نعم',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(backgroundColor: ColorYellow),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(seconds ~/ 3600);
    final minutes = twoDigits((seconds ~/ 60) % 60);
    final secondsFormatted = twoDigits(seconds % 60);
    return "$hours:$minutes:$secondsFormatted";
  }
}
