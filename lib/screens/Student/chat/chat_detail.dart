import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rowad_classes/constants/colors.dart';

class ChatDetail extends StatefulWidget {
  const ChatDetail({super.key});

  @override
  _ChatDetailState createState() => _ChatDetailState();
}

class _ChatDetailState extends State<ChatDetail> {
  bool isEmojiVisible = false; // للتحكم في ظهور لوحة الإيموجي
  final TextEditingController _controller = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  void _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      // يمكنك معالجة الصورة هنا
      print('Image Path: ${image.path}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back to the previous screen
          },
        ),
        title: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/man.png'),
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('محمد سعودي'),
                SizedBox(width: 8),
                Text(
                  'نشط الآن',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                // Example message data
                String messageText = (index % 2 == 0) ? 'Hello, how are you?' : 'I am good, thanks!';
                String messageTime = '9:${index + 50} AM'; // Dynamic time for illustration

                return Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(messageText),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 16), // Align with the message
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          messageTime,
                          style: TextStyle(color: const Color.fromARGB(255, 110, 110, 110), fontSize: 12),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: ColorRowad,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          messageText == 'Hello, how are you?' ? 'I am good, thanks!' : 'Hello, how are you?',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16, bottom: 16), // Align with the message
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          messageTime,
                          style: TextStyle(color: const Color.fromARGB(255, 110, 110, 110), fontSize: 12),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          if (isEmojiVisible)
            EmojiPicker(
              onEmojiSelected: (category, emoji) {
                _controller.text += emoji.emoji;
              },
             config: Config(),
            ),
          Card(
            color: ColorRowad,
            child: Row(
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.emoji_emotions,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      isEmojiVisible = !isEmojiVisible; // تبديل ظهور لوحة الإيموجي
                    });
                  },
                ),
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Message',
                      helperStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      hintStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.camera_alt_rounded,
                    color: Colors.white,
                  ),
                  onPressed: _pickImage, // استدعاء وظيفة الكاميرا
                ),
                IconButton(
                  icon: Icon(
                    Icons.send,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
