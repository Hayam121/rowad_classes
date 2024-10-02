import 'package:flutter/material.dart';
import 'package:rowad_classes/screens/Student/tranning/card_not_subscribe.dart/view_units.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';

class ViewCourseSubscribe extends StatelessWidget {
  const ViewCourseSubscribe({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    '           العناصر الانتقالية',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorYellow,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    ' :الفصل الثالث',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: ColorRowad,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const SizedBox(width: 7),
                  buildDirectionalText(
                    '20 ملف',
                      text: '20 ملف',
                      direction: TextDirection.rtl,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Icon(Icons.video_collection_rounded,
                      size: 18, color: darkYellow),
                  const SizedBox(width: 15),
                  Image.asset('assets/images/line.png'),
                  const SizedBox(width: 7),
                  buildDirectionalText(
                    '20 امتحان',
                      text: '20 امتحان',
                      direction: TextDirection.rtl,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Icon(Icons.file_present, size: 18, color: darkYellow),
                  const SizedBox(width: 15),
                  Image.asset('assets/images/line.png'),
                  const SizedBox(width: 7),
                  buildDirectionalText(
                    '15 فيديو',
                      text: '15 فيديو',
                      direction: TextDirection.rtl,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Icon(Icons.file_present, size: 18, color: darkYellow),
                  const SizedBox(width: 15),
                  Image.asset('assets/images/line.png'),
                  const SizedBox(width: 7),
                  buildDirectionalText(
                    '5 فصول',
                      text: '5 فصول',
                      direction: TextDirection.rtl,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Icon(Icons.file_present, size: 18, color: darkYellow),
                ],
              ),
              Divider(color: ColorYellow),
              const SizedBox(height: 25),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                  childAspectRatio: 0.6, // Aspect ratio of each card
                ),
                itemCount: 10, // Total number of items
                shrinkWrap:
                    true, // Prevent GridView from taking unlimited height
                physics:
                    const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                itemBuilder: (context, index) {
                  return card(context); // Pass context to the card function
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget card(BuildContext context) {
  return Card(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Image taking half of the card height
        Container(
          height: 150, // Adjust height as needed
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              topRight: Radius.circular(12),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/teacher3.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        // Text section at the bottom of the card
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'العناصر الانتقالية',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorYellow,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    ':الفصل الثالث',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: ColorRowad,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  buildDirectionalText(
                    '15 فديو',
                      text: '15 فديو',
                      direction: TextDirection.rtl,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Icon(Icons.video_collection_rounded,
                      size: 18, color: darkYellow),
                  const SizedBox(width: 15),
                  Image.asset('assets/images/line.png'),
                  const SizedBox(width: 8),
                  buildDirectionalText(
                    '5 فصول',
                      text: '5 فصول',
                      direction: TextDirection.rtl,
                      style: const TextStyle(fontSize: 16)),
                  const SizedBox(width: 8),
                  Icon(Icons.file_present, size: 18, color: darkYellow),
                ],
              ),
              Divider(color: ColorYellow),
              Center(
                child: Row(
                  children: [
                    Text(
                      'السبت - 2 من فبراير 2024',
                      style: TextStyle(fontSize: 16, color: ColorRowad),
                    ),
                    Icon(Icons.alarm, size: 20, color: darkYellow)
                  ],
                ),
              ),
              const SizedBox(height: 6),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ViewUnits(),
                    ),
                  );
                },
                child: buildDirectionalText(
                  'تابع الفصل',
                  text: 'تابع الفصل',
                  direction: TextDirection.rtl,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorYellow,
                  minimumSize: const Size(double.infinity, 36),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
