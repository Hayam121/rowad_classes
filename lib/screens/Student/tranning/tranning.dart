import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:rowad_classes/screens/Student/courses/courses.dart';
import 'package:rowad_classes/screens/Student/login/login.dart';
import 'package:rowad_classes/screens/Student/tranning/teacher_detail.dart';
import 'package:rowad_classes/constants/colors.dart';

class Tranning extends StatefulWidget {
  const Tranning({super.key});

  @override
  State<Tranning> createState() => _TranningState();
}

class _TranningState extends State<Tranning> {
  String? selectedCategory;
  String? selectedLecturer;
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          // Allow the entire page to be scrollable
          child: Column(
            children: [
              // Buttons with icons and dropdown functionality
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: _buildDropdownField('الدورات', selectedCategory,
                          (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      }, ['الرياضيات', 'العلوم', 'اللغة العربية']),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildDropdownField(
                          'الفئات التدريبية', selectedLecturer, (value) {
                        setState(() {
                          selectedLecturer = value;
                        });
                      }, ['الفئة 1', 'الفئة 2', 'الفئة 3']),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16), // Space between buttons and card grid

              // Grid of course cards
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                  crossAxisSpacing: 0.0, // Space between cards horizontally
                  mainAxisSpacing: 0, // Space between cards vertically
                  childAspectRatio: 0.6, // Aspect ratio of each card
                ),
                itemCount: 10, // Total number of items
                shrinkWrap:
                    true, // Prevent GridView from taking unlimited height
                physics:
                    NeverScrollableScrollPhysics(), // Disable GridView scrolling
                itemBuilder: (context, index) {
                  return _buildCourseCard(); // Reuse the same course card method
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Card widget with image, text, and button
  Widget _buildCourseCard() {
    return GestureDetector(
      onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TeacherDetail(), // Navigate to TeacherDetailPage
        ),
      );
    },
      child: Container(
        margin: EdgeInsets.all(4.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Make card height flexible
            children: [
              // Image taking half of the card height
              Expanded(
                child: Container(
                  height: 110, // Adjust height as needed
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/teacherimage.png'), // Replace with your image asset
                      fit: BoxFit.fill,
                      // Use BoxFit.cover for better image coverage
                    ),
                  ),
                ),
              ),
              // Text section at the bottom of the card
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'محمد السعودي',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(height: 6),
                  // Divider to separate subject name and grade
                  Container(
                    height: 1,
                    color: ColorYellow,
                    // margin: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Text(
                    'الرياضيات-2 (الصف الثاني اللابتدائي)',
                    style: TextStyle(
                      fontSize: 14,
                      color: ColorRowad,
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Description',
                          style: TextStyle(
                              color: ColorRowad,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        )),
                  ),
                  Row(
                    children: [
                      Text(
                        rating.toStringAsFixed(
                            1), // Display the rating with one decimal
                        style: TextStyle(
                            fontSize: 18,
                            color:
                                Color(0xffFF922E)), // Customize your text style
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        ': تقييم المعلم',
                        style: TextStyle(color: ColorRowad, fontSize: 16),
                      ),
                    ],
                  ),
                  PannableRatingBar(
                    rate: rating,
                    items: List.generate(
                        5,
                        (index) => const RatingWidget(
                              selectedColor: Color(0xffFFC200),
                              unSelectedColor: Colors.grey,
                              child: Icon(
                                Icons.star,
                                size: 18,
                              ),
                            )),
                    onHover: (value) {
                      // the rating value is updated every time the cursor moves over a new item.
                      setState(() {
                        rating = value;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Dropdown field widget with label
  Widget _buildDropdownField(String label, String? selectedValue,
      Function(String?) onChanged, List<String> options) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
      value: selectedValue,
      items: options.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (String? newValue) {
        onChanged(newValue);
      },
    );
  }
}
