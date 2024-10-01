import 'package:flutter/material.dart';
import 'package:rowad_classes/Student/chat/chat_detail.dart';
import 'package:rowad_classes/constants/colors.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Card2(),
          Expanded(
            // Use Expanded to handle ListView height properly
            child: cardlistview(),
          ),
        ],
      ),
    );
  }
}

Widget Card2() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorRowad, width: 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 8, left: 8),
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.4), width: 1),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.list), // List icon
                      color: const Color(
                          0xffACB9B8), // Change icon color if needed
                      onPressed: () {
                        // Add functionality for this button
                      },
                    ),
                  ),
                  const SizedBox(width: 120),
                  // Name Text
                  Column(
                    children: [
                      const Text(
                        'محمد سعودي',
                        style: TextStyle(fontSize: 24, color: Colors.black),
                      ),
                      RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: 'نشط الآن ', // Text first, then icon
                              style:
                                  TextStyle(fontSize: 20, color: Colors.grey),
                            ),
                            WidgetSpan(
                              child: Icon(Icons.circle,
                                  color: Colors.green, size: 12.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(width: 8),
                  // Circle Avatar with Border
                  const CircleAvatar(
                    radius: 30, // Increase image size
                    backgroundImage: AssetImage('assets/images/man2.png'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}


Widget cardlistview() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: ColorRowad, width: 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Align(
                alignment: Alignment.topRight,
                child: Text(
                  'الرسائل',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                  labelText: 'أبحث',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              // Use Expanded to make ListView take available space
              child: ListView.builder(
                itemCount: 12,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the chat detail page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ChatDetail(),
                        ),
                      );
                    },
                    child: const ListTile(
                      leading: Text('9:41 AM'),
                      title: Align(
                        alignment: Alignment.topRight,
                        child: Text('محمد سعودي'),
                      ),
                      subtitle: Align(
                        alignment: Alignment.topRight,
                        child: Text('Hello, how are you?'),
                      ),
                      trailing: CircleAvatar(
                        radius: 28,
                        backgroundImage: AssetImage('assets/images/man.png'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
