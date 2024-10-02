import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rowad_classes/screens/Student/chat/chat.dart';
import 'package:rowad_classes/screens/Student/courses/CourseViewPage.dart';
import 'package:rowad_classes/screens/Student/courses/courses.dart';
import 'package:rowad_classes/screens/Student/home/home.dart';
import 'package:rowad_classes/screens/Student/profile/profile.dart';
import 'package:rowad_classes/screens/Student/tranning/tranning.dart';
import 'package:rowad_classes/constants/colors.dart';

class NavBar extends StatefulWidget {
   const NavBar({super.key});

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final items = [

       _NavBarItem(icon: Icons.chat_outlined, label: 'شات'),

        _NavBarItem(icon: Icons.people, label: 'المحاضرون'),
    
        _NavBarItem(icon: Icons.home, label: 'الصفحة الرئيسية'),

       _NavBarItem(icon: Icons.science, label: 'الدورات'),

       _NavBarItem(icon: Icons.person, label: 'الملف الشخصي'),


  ];

  int index = 2; // Default index to Home

  @override
  Widget build(BuildContext context) {
    // Titles for different screens based on index
    final List<String> appBarTitles = [
      'الشات',
      'المحاضرون',
      'الصفحة الرئيسية',
      'الدورات',
      'الملف الشخصي'
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitles[index], style: TextStyle(color: Colors.white)),
        backgroundColor: ColorRowad,
        iconTheme: IconThemeData(color: Colors.white),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        height: 75,
        color: ColorRowad,
        backgroundColor: Colors.white,
        items: items.map((item) => _buildNavBarItem(item)).toList(),
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
      ),
      body: getSelectedWidget(index: index),
    );
  }

 Widget _buildNavBarItem(_NavBarItem item) {
    bool isSelected = items.indexOf(item) == index; // Check if selected
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(item.icon, color: Colors.white, size: isSelected ? 35 : 28),
        if (!isSelected)
          Text(item.label!, style: TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }


  Widget getSelectedWidget({required int index}) {
    switch (index) {
      case 0: return  Chat();
      case 1: return  Tranning();
      case 2: return  Home();
      case 3: return  Courses();
      case 4: return  Profile(); // Updated to show CoursesScreen with horizontal list
      default: return  Home();
    }
  }
}

class _NavBarItem {
  final IconData icon;
  final String? label;
  const _NavBarItem({required this.icon, this.label});
}
