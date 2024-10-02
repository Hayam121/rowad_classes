import 'package:flutter/material.dart';
import 'package:rowad_classes/screens/Student/courses/CourseViewPage.dart';
import 'package:rowad_classes/constants/colors.dart';

class Courses extends StatefulWidget {
  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  String? selectedCategory;
  String? selectedLecturer;

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
                      child: _buildDropdownField('الفئة', selectedCategory,
                          (value) {
                        setState(() {
                          selectedCategory = value;
                        });
                      }, ['الرياضيات', 'العلوم', 'اللغة العربية']),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildDropdownField('المحاضرون', selectedLecturer,
                          (value) {
                        setState(() {
                          selectedLecturer = value;
                        });
                      }, ['المحاضر 1', 'المحاضر 2', 'المحاضر 3']),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 16), // Space between buttons and card grid

              // Grid of course cards
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                  crossAxisSpacing: 8.0, // Space between cards horizontally
                  mainAxisSpacing: 8.0, // Space between cards vertically
                  childAspectRatio: 0.7, // Aspect ratio of each card
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
    return Container(
      margin: EdgeInsets.all(8.0),
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
                        'assets/images/science.png'), // Replace with your image asset
                    fit: BoxFit
                        .fill,
                         // Use BoxFit.cover for better image coverage
                  ),
                ),
              ),
            ),
            // Text section at the bottom of the card
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'الرياضيات -2 ',
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
                    margin: EdgeInsets.symmetric(vertical: 4.0),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'الرياضيات-2 الصف الثاني اللابتدائي',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => CourseViewPage(),));
                      // Action for عرض المحتوى button
                    },
                    child: Text(
                      'عرض المحتوى',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorYellow,
                      minimumSize:
                          Size(double.infinity, 36), // Full width button
                    ),
                  ),
                ],
              ),
            ),
          ],
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
