import 'package:flutter/material.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';

class ExamDetail extends StatefulWidget {
  const ExamDetail({super.key});

  @override
  State<ExamDetail> createState() => _ExamDetailState();
}

class _ExamDetailState extends State<ExamDetail> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late int _remainingTime; // Remaining time in seconds
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
    ["الإجابة 1", "الإجابة 2", "الإجابة 3", "الإجابة 4"],
    ["الإجابة 1", "الإجابة 2", "الإجابة 3", "الإجابة 4"],
    ["الإجابة 1", "الإجابة 2", "الإجابة 3", "الإجابة 4"],
  ];

  @override
  void initState() {
    super.initState();
    _currentQuestionIndex = 0; // Start with the first question
    _remainingTime = 1200; // Start timer from 1200 seconds
    _selectedAnswers = List.filled(4, false); // Initialize answer selection

    // Initialize the timer
    _controller = AnimationController(
      duration: Duration(seconds: _remainingTime),
      vsync: this,
    )..reverse(from: _remainingTime.toDouble());

    // Listen to the timer and update remaining time
    _controller.addListener(() {
      setState(() {
        _remainingTime = _controller.value.toInt();
      });
      if (_remainingTime == 0) {
        // Handle timeout if needed
        _controller.stop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _selectAnswer(int index) {
    setState(() {
      _selectedAnswers = List.filled(4, false); 
      _selectedAnswers[index] = true; 
    });
  }

  @override
  Widget build(BuildContext context) {
    String questionTitle = 'السؤال ${_currentQuestionIndex + 1}';
    String question = questions[_currentQuestionIndex];

    return GradientBackground(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: ColorRowad,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Center the title row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'العناصر الانتقالية',
                        style: TextStyle(
                            fontSize: 24,
                            color: darkYellow,
                            fontWeight: FontWeight.w600),
                      ),
                      buildDirectionalText(
                        'الإختبار الخاص بفصل : ',
                        text: 'الإختبار الخاص بفصل : ',
                        direction: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 24,
                            color: ColorRowad,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const SizedBox(width: 7),
                      buildDirectionalText(
                        '60 دقيقة',
                        text: '60 دقيقة',
                        direction: TextDirection.rtl,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.alarm, size: 18, color: darkYellow),
                      const SizedBox(width: 15),
                      Image.asset('assets/images/line.png'),
                      const SizedBox(width: 7),
                      buildDirectionalText(
                        '20 سؤال',
                        text: '20 سؤال',
                        direction: TextDirection.rtl,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 8),
                      Icon(Icons.question_answer, size: 18, color: darkYellow),
                    ],
                  ),
                  Divider(color: ColorYellow),
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
                                _formatTime(_remainingTime),
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      buildDirectionalText(
                        'الوقت المتبقي من الاختبار :',
                        text: 'الوقت المتبقي من الاختبار :',
                        direction: TextDirection.rtl,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20), // Space before question
                  // Add question number and question text
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              questionTitle,
                              style: TextStyle(fontSize: 20, color: ColorRowad, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              question,
                              style: TextStyle(fontSize: 18, color: ColorRowad, fontWeight: FontWeight.w300),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10), // Space before answers
                  // Add answer options
                  for (int i = 0; i < answers[_currentQuestionIndex].length; i++)
                    _buildAnswerOption(context, answers[_currentQuestionIndex][i], i),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  String _formatTime(int seconds) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final minutes = twoDigits(seconds ~/ 60);
    final secondsFormatted = twoDigits(seconds % 60);
    return "$minutes:$secondsFormatted"; // Removed hours for simplicity
  }

  Widget _buildAnswerOption(BuildContext context, String answerText, int index) {
    return GestureDetector(
      onTap: () {
        _selectAnswer(index);
      },
      child: Container(
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
            answerText,
            style: TextStyle(color: _selectedAnswers[index] ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
