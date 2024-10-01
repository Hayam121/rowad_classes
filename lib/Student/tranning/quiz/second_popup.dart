import 'dart:async';
import 'package:flutter/material.dart';
import 'package:rowad_classes/constants/colors.dart';

class SecondPopup extends StatefulWidget {
  final int remainingTime;
  final int questionIndex;

  SecondPopup({required this.remainingTime, required this.questionIndex});

  static void showPopup(BuildContext context, int remainingTime, int questionIndex) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SecondPopup(remainingTime: remainingTime, questionIndex: questionIndex);
      },
    );
  }

  @override
  State<SecondPopup> createState() => _SecondPopupState();
}

class _SecondPopupState extends State<SecondPopup> {
  late Timer _timer;
  late int _start; 
  late List<bool> _selectedAnswers; 
  late int _currentQuestionIndex;

  final List<String> questions = [
    "ما هو السؤال 1؟",
    "ما هو السؤال 2؟",
    "ما هو السؤال 3؟",
    "ما هو السؤال 4؟",
    "ما هو السؤال 5؟",
  ];
  
  final List<List<String>> answers = [
    ["الإجابة 1", "الإجابة 2", "الإجابة 3", "الإجابة 4"],
    ["الإجابة 1", "الإجابة 2", "الإجابة 3", "الإجابة 4"],
    ["الإجابة 1", "الإجابة 2", "الإابة 3", "الإجابة 4"],
    ["الإجابة 1", "الإجابة 2", "الإجابة 3", "الإجابة 4"],
    ["الإجابة 1", "الإجابة 2", "الإجابة 3", "الإجابة 4"],
  ];

  int totalQuestions = 5;
late int _initialTime;

  @override
  void initState() {
    super.initState();
    _start = widget.remainingTime; 
    _currentQuestionIndex = widget.questionIndex; 
    _selectedAnswers = List.filled(4, false); 
      _initialTime = 60;  // Or any other value depending on the logic

    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_start == 0) {
        _timer.cancel();
        Navigator.of(context).pop();
      } else {
        setState(() {
          _start--;
        });
      }
    });
  }

  String _formatTime(int seconds) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(seconds ~/ 3600);
    final minutes = twoDigits((seconds ~/ 60) % 60);
    final secondsFormatted = twoDigits(seconds % 60);
    return "$hours:$minutes:$secondsFormatted";
  }

  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswers = List.filled(4, false); 
      _selectedAnswers[index] = true; 
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < totalQuestions - 1) {
      Navigator.of(context).pop(); 
      SecondPopup.showPopup(context, _start, _currentQuestionIndex + 1); 
    } else {
      // فتح بوباب التأكيد عند تقديم الإجابة
      _showConfirmationPopup();
    }
  }
void _showConfirmationPopup() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        content: Container(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20),
              Image.asset('assets/images/question.png'), // استبدل هذا بمسار الصورة الفعلي
              SizedBox(height: 15),
              Text("هل أنت متأكد من تقديم الإجابة؟",
                  style: TextStyle(fontSize: 20, color: ColorRowad, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
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
                      // Close the confirmation popup
                      Navigator.of(context).pop();
                      
                      // Show the desired dialog after pressing 'Yes'
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            backgroundColor: Color.fromARGB(255, 238, 224, 210),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Card(
                                        color: Color(0xff009320),
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
                                      IconButton(
                                        icon: Icon(Icons.cancel, color: Colors.red, size: 30),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  ),
                                  Image.asset('assets/images/true.png',width: 320,height: 320,),
                                  Text(
                                    'أحسنت!',
                                    style: TextStyle(
                                      color: ColorRowad,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'لقد تخطيت الاختبار بنسبة 90%',
                                    style: TextStyle(
                                      color: ColorRowad,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    'لقد أظهرت فهمًا رائعًا للفصل.',
                                    style: TextStyle(
                                      color: ColorRowad,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 14),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      OutlinedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          'مراجعة الاختبار',
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
                                          'العودة للدرس',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(backgroundColor: ColorYellow),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Text(
                      'نعم',
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                    style: ElevatedButton.styleFrom(backgroundColor: ColorYellow),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}


  void _previousQuestion() {
    if (_currentQuestionIndex > 0) {
      Navigator.of(context).pop(); 
      SecondPopup.showPopup(context, _start, _currentQuestionIndex - 1); 
    } 
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    String questionTitle = 'السؤال ${_currentQuestionIndex + 1}';
    String question = questions[_currentQuestionIndex];

    return Center(
      child: Dialog(
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          width: 400,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Card(
                      color: Color(0xff009320),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Row(
                          children: [
                            Icon(Icons.alarm, size: 20, color: Colors.white),
                            SizedBox(width: 8),
                            Text(
                              _formatTime(_start),
                              style: TextStyle(fontSize: 16, color: Colors.white),
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
                SizedBox(height: 10),
                Text(
                  questionTitle,
                  style: TextStyle(fontSize: 20, color: ColorRowad, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Text(
                  question,
                  style: TextStyle(fontSize: 18, color: ColorRowad, fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: List.generate(answers[_currentQuestionIndex].length, (index) {
                      return Container(
                        width: double.infinity,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: _selectedAnswers[index] ? ColorRowad : const Color.fromARGB(255, 216, 216, 216),
                          ),
                          onPressed: () {
                            _selectAnswer(index);
                          },
                          child: Text(
                            answers[_currentQuestionIndex][index],
                            style: TextStyle(color: _selectedAnswers[index] ? Colors.white : Colors.black),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 20),
                Text("${_currentQuestionIndex + 1}/$totalQuestions", style: TextStyle(fontSize: 16, color: ColorRowad)),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: _previousQuestion,
                      child: Text(
                        'الرجوع للسابق',
                        style: TextStyle(color: ColorRowad),
                      ),
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: darkYellow, width: 2),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _nextQuestion,
                      child: Text(
                        _currentQuestionIndex == totalQuestions - 1 ? 'تقديم الإجابة' : 'التالي',
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
      ),
    );
  }
}
 