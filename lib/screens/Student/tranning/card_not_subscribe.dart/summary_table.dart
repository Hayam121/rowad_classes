import 'package:flutter/material.dart';
import 'package:rowad_classes/screens/Student/tranning/quiz/quiz.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/screens/Student/tranning/quiz/quiz.dart';

Widget tableSummary() {
  return Table(
    border: TableBorder.all(
      color: ColorRowad, // Border color for the table
      width: 2.0, // Width of the border
    ),
    columnWidths: const {
      0: FlexColumnWidth(2), // Column 1 width ratio
      1: FlexColumnWidth(2), // Column 2 width ratio
      2: FlexColumnWidth(1), // Column 3 width ratio
    },
    children: [
      TableRow(
        decoration: BoxDecoration(
          color: ColorRowad, // Row color for the header row
        ),
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'الملف PDF',
                style:
                    TextStyle(fontSize: 20, color: Colors.white), // White text
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'اسم الملخص',
                style:
                    TextStyle(fontSize: 20, color: Colors.white), // White text
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'رقم',
                style:
                    TextStyle(fontSize: 20, color: Colors.white), // White text
              ),
            ),
          ),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the second row
        ),
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.picture_as_pdf,
                    color: darkYellow,
                  ),
                  const Text(
                    'about-ado.pdf',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black), // Black text
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'ملخص الدرس الأول',
                style:
                    TextStyle(fontSize: 16, color: Colors.black), // Black text
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '1',
                style:
                    TextStyle(fontSize: 16, color: Colors.black), // Black text
              ),
            ),
          ),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the second row
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.picture_as_pdf,
                    color: darkYellow,
                  ),
                  const Text(
                    'about-ado.pdf',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black), // Black text
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'ملخص الدرس الأول',
                style:
                    TextStyle(fontSize: 16, color: Colors.black), // Black text
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '1',
                style:
                    TextStyle(fontSize: 16, color: Colors.black), // Black text
              ),
            ),
          ),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the second row
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.picture_as_pdf,
                    color: darkYellow,
                  ),
                  const Text(
                    'about-ado.pdf',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black), // Black text
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'ملخص الدرس الأول',
                style:
                    TextStyle(fontSize: 16, color: Colors.black), // Black text
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '1',
                style:
                    TextStyle(fontSize: 16, color: Colors.black), // Black text
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget tableAudio() {
  return Table(
    border: TableBorder.all(
      color: ColorRowad, // Border color for the table
      width: 2.0, // Width of the border
    ),
    columnWidths: const {
      0: FlexColumnWidth(2), // Column 1 width ratio
      1: FlexColumnWidth(1), // Column 2 width ratio
    },
    children: [
      TableRow(
        decoration: BoxDecoration(
          color: ColorRowad, // Row color for the header row
        ),
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'صوتيات',
                style:
                    TextStyle(fontSize: 20, color: Colors.white), // White text
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'رقم',
                style:
                    TextStyle(fontSize: 20, color: Colors.white), // White text
              ),
            ),
          ),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the second row
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.music_note_rounded,
                    color: darkYellow,
                  ),
                  const Text(
                    'Lesson 1 .Mp3',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black), // Black text
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '1',
                style:
                    TextStyle(fontSize: 16, color: Colors.black), // Black text
              ),
            ),
          ),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the second row
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.music_note_rounded,
                    color: darkYellow,
                  ),
                  const Text(
                    'Lesson 1 .Mp3',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black), // Black text
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '1',
                style:
                    TextStyle(fontSize: 16, color: Colors.black), // Black text
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget tablePhoto() {
  return Table(
    border: TableBorder.all(
      color: ColorRowad, // Border color for the table
      width: 2.0, // Width of the border
    ),
    columnWidths: const {
      0: FlexColumnWidth(2), // Column 1 width ratio
      1: FlexColumnWidth(1), // Column 2 width ratio
    },
    children: [
      TableRow(
        decoration: BoxDecoration(
          color: ColorRowad, // Row color for the header row
        ),
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'صور الدرس',
                style:
                    TextStyle(fontSize: 20, color: Colors.white), // White text
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'رقم',
                style:
                    TextStyle(fontSize: 20, color: Colors.white), // White text
              ),
            ),
          ),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the second row
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.photo,
                    color: darkYellow,
                  ),
                  const Text(
                    'Lesson 1 .png',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black), // Black text
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '1',
                style:
                    TextStyle(fontSize: 16, color: Colors.black), // Black text
              ),
            ),
          ),
        ],
      ),
      TableRow(
        decoration: BoxDecoration(
          color: Colors.white, // Background color for the second row
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Row(
                children: [
                  Icon(
                    Icons.photo,
                    color: darkYellow,
                  ),
                  const Text(
                    'Lesson 1 .png',
                    style: TextStyle(
                        fontSize: 16, color: Colors.black), // Black text
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                '1',
                style:
                    TextStyle(fontSize: 16, color: Colors.black), // Black text
              ),
            ),
          ),
        ],
      ),
    ],
  );
}

Widget twoButtons(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        SizedBox(height: 40,),
        ElevatedButton(
          onPressed: () {
            // Push the PopupQuiz screen when the 'الاختبارات' button is pressed
             PopupQuiz.showPopup(context); //
          },
          child: Text(
            'أبدأ الان',
            style: TextStyle(
              color: Colors.white, 
              fontSize: 18, 
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: ColorRowad,  // Replace with your color variable
            minimumSize: const Size(double.infinity, 36), // Full width button
          ),
        ),
      ],
    ),
  );
}


Widget contentLesson() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: buildDirectionalText(
            'اكتشف ثراء محررنا ✨',
            text: 'اكتشف ثراء محررنا ✨',
            direction: TextDirection.rtl,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'يمكن تخصيص CKEditor. يمكنك ضبط مجموعة الإضافات المفعّلة وأزرار شريط الأدوات المتاحة وسلوك الميزات. يدعم المحرر @mentions. ابدأ بكتابة @An لرؤية الاقتراحات المتاحة. يمكنك لصق المحتوى من Word أو Google Docs مع الاحتفاظ بالهيكل الأصلي للمستند وتنسيقه. بفضل استيراد من Word، يمكنك تحويل مستند DOCX إلى HTML وتحريره في CKEditor 5. يمكنك تصدير مستندك إلى PDF أو Word بنقرة واحدة..',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    ),
  );
}
