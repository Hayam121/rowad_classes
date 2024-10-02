import 'package:flutter/material.dart';
import 'package:rowad_classes/screens/Student/tranning/card_not_subscribe.dart/payment.dart';
import 'package:rowad_classes/screens/Student/tranning/card_not_subscribe.dart/view_course_not_subscribe.dart';
import 'package:rowad_classes/screens/Student/tranning/card_not_subscribe.dart/view_course_subscribe.dart';
import 'package:rowad_classes/constants/colors.dart';

class CardSubscribe extends StatefulWidget {
  const CardSubscribe({super.key});

  @override
  State<CardSubscribe> createState() => _CardSubscribeState();
}

class _CardSubscribeState extends State<CardSubscribe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260, // Set a fixed width for each card
      margin: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Image taking half of the card height
             Stack(
              children: [
                // Image section
                Container(
                  height: 150, // Adjust height as needed
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/teacherimage.png'), // Replace with your image asset
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                // ElevatedButton in the top-right corner
                Positioned(
                  top: 8, // Adjust the position
                  left: 8, // Adjust the position
                  child: ElevatedButton(
                    onPressed: () {
                      // Action for the Subscribe button
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff009320), // Green color for the button
                    ),
                    child: Text(
                      'مشترك',
                      style: TextStyle(
                        color: Colors.white, 
                        fontSize: 14,
                        fontWeight: FontWeight.bold// White text color
                      ),
                    ),
                  ),
                ),
              ],
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
                        '          العناصر الانتقالية',
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
                          text: '15 فديو',
                          direction: TextDirection.rtl,
                          style: TextStyle(fontSize: 16)),
                      const SizedBox(width: 8),
                      Icon(Icons.video_collection_rounded,
                          size: 18, color: darkYellow),
                      const SizedBox(width: 15),
                      Image.asset('assets/images/line.png'),
                      const SizedBox(width: 8),
                      buildDirectionalText(
                          text: '5 فصول',
                          direction: TextDirection.rtl,
                          style: TextStyle(fontSize: 16)),
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
                        SizedBox(width: 6,),
                        Icon(Icons.alarm,size: 24,color: darkYellow,)
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  ElevatedButton(
                    onPressed: () {
                      // Action for 500.00 جنيهاً button
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 36),
                    ),
                    child: buildDirectionalText(
                      text: 'أنت مشترك في هذا المحتوي',
                      direction: TextDirection.rtl,
                      style: TextStyle(
                        color: ColorRowad,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                  
                       Navigator.push(context, MaterialPageRoute(builder:(context) => ViewCourseSubscribe(),));
                    },
                    child: buildDirectionalText(
                      text: 'عرض المحتوي',
                      direction: TextDirection.rtl,
                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
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
      ),
    );
  }

  Widget buildDirectionalText({
    required String text,
    required TextDirection direction,
    required TextStyle style,
  }) {
    return Directionality(
      textDirection: direction,
      child: Text(text, style: style),
    );
  }
}
