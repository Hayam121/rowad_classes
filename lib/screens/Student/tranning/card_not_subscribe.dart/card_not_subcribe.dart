import 'package:flutter/material.dart';
import 'package:rowad_classes/screens/Student/tranning/card_not_subscribe.dart/payment.dart';
import 'package:rowad_classes/screens/Student/tranning/card_not_subscribe.dart/view_course_not_subscribe.dart';
import 'package:rowad_classes/constants/colors.dart';

class CardNotSubscribe extends StatefulWidget {
  const CardNotSubscribe({super.key});

  @override
  State<CardNotSubscribe> createState() => _CardNotSubscribeState();
}

class _CardNotSubscribeState extends State<CardNotSubscribe> {
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
                      backgroundColor: Color(0xff930000), // Green color for the button
                    ),
                    child: Text(
                      'غير مشترك ',
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
                    child: Text(
                      'السبت - 2 من فبراير 2024',
                      style: TextStyle(fontSize: 14, color: ColorRowad),
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
                      text: '500.00 جنيهاً',
                      direction: TextDirection.rtl,
                      style: TextStyle(
                        color: ColorRowad,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {

                           Navigator.push(context, MaterialPageRoute(builder:(context) => Payment(),));
                        },
                        child: buildDirectionalText(
                          text: 'اشترك الان !',
                          direction: TextDirection.rtl,
                          style: TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorYellow,
                          minimumSize: const Size(50, 33),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder:(context) => ViewCourseNotSubscribe(),));

                        },
                        child: Text(
                          'عرض المحتوي',
                          style: TextStyle(
                              color: ColorRowad, fontWeight: FontWeight.w600),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: const Size(50, 33),
                        ),
                      ),
                    ],
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
