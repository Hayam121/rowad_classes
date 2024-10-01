import 'package:flutter/material.dart';
import 'package:flutter_pannable_rating_bar/flutter_pannable_rating_bar.dart';
import 'package:rowad_classes/Student/tranning/card_not_subscribe.dart/card_not_subcribe.dart';
import 'package:rowad_classes/Student/tranning/card_not_subscribe.dart/card_subscribe.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';
import 'package:video_player/video_player.dart';

class TeacherDetail extends StatefulWidget {
  const TeacherDetail({super.key});

  @override
  State<TeacherDetail> createState() => _TeacherDetailState();
}

class _TeacherDetailState extends State<TeacherDetail> {
    double rating = 0.0;
      String? selectedCategory;
  String? selectedLecturer;
  late VideoPlayerController _controller;

 @override
void initState() {
  super.initState();
  _controller = VideoPlayerController.asset('assets/videos/myvideo.mp4')
    ..initialize().then((_) {
      // Ensure the first frame is shown after the video is initialized.
      if (mounted) {
        setState(() {});
      }
    }).catchError((error) {
      print('Error initializing video player: $error');
    });
}

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
          title: const Text(
            'المحاضرون',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: ColorRowad,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // Make card height flexible
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: CardDefineTeacher(),
              ),
              Text('عرض  توضيحي',style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600,color: ColorRowad),),
              const SizedBox(height: 15,),
               Padding(
                padding: const EdgeInsets.all(14.0),
                child: Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                     Center(
                              child: _controller.value.isInitialized
                                  ? Container(
                                      height: 200, // Set a fixed height for the video player
                                      child: AspectRatio(
                                        aspectRatio: _controller.value.aspectRatio,
                                        child: VideoPlayer(_controller),
                                      ),
                                    )
                                  : Container(),
                            ),
                            SizedBox(height: 8,),
                            // Play/Pause Button
                            Center(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: ColorRowad, // Background color
                                  shape: BoxShape.circle, // Make it circular
                                ),
                                child: IconButton(
                                  icon: Icon(
                                    _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: Colors.white, // Change icon color to white for contrast
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _controller.value.isPlaying ? _controller.pause() : _controller.play();
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 8,),
              
            ],
          ),
                ),
              ),
               Card(
                color: Colors.white,
                 child: Column(
           children: [
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
                            const SizedBox(width: 10),
                            Expanded(
                              child: _buildDropdownField(
                                  'الأقسام', selectedLecturer, (value) {
                                setState(() {
                                  selectedLecturer = value;
                                });
                              }, ['الفئة 1', 'الفئة 2', 'الفئة 3']),
                            ),
                          ],
                        ),
                      ),
                        SizedBox(
                          height: 400,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal, // Horizontal scrolling
                              itemCount: 5,
                              itemBuilder: (context, index) {
                                return CardSubscribe();
                              },
                            ),
                        ),
                        

                            ],
                 ),
                  
               ),
              ]),
        ),),
        );    
  }

  Card CardDefineTeacher() {
    return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Column(
                            children: [
                              Text(
                                'حازم عبدالله',
                                style: TextStyle(
                                    fontSize: 24,
                                    color: ColorRowad,
                                    fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                'Math teacher',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xff434343),
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Image.asset('assets/images/teacher2.png',
                              width: 250, height: 250),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(bottom: 10, right: 8, left: 8),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'نبذه عن المحاضر',
                              style: TextStyle(
                                  color: ColorRowad,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'وصف عن المحاضر',
                              style: TextStyle(
                                  color: ColorRowad,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w200),
                            ),
                          ),
                          const SizedBox(height: 15,),
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 4,
                                    ),

                                    buildDirectionalText(
                                      '5 سنين',
                                      text: '5 سنين', // Add the missing argument
                                      direction: TextDirection.rtl,
                                      style: TextStyle(color: ColorRowad,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300),),

                                    Text(
                                      '                                                   :الخبرات',
                                      style: TextStyle(
                                          color: ColorRowad,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w200),
                                    ),
                                  ],
                                ),
                            Row(
                    children: [
                      Text(
                        rating.toStringAsFixed(
                            1), // Display the rating with one decimal
                        style: const TextStyle(
                            fontSize: 18,
                            color:
                                Color(0xffFF922E)), // Customize your text style
                      ),
                      const SizedBox(
                        width: 6,
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
                   Text(
                        '                                 : تقييم المعلم',
                        style: TextStyle(color: ColorRowad, fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6,),
                      Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              'الفئات التدريبية',
                              style: TextStyle(
                                  color: ColorRowad,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                           Row(
                            children: [
                              Text('(الاتصالات وتكنولوجيا المعلومات -1)',style: TextStyle(fontSize: 14,color: darkYellow),),
                              const Text(' الصف الثالث الثانوي',style: TextStyle(fontSize: 18,color: Colors.black),),
                              Icon(Icons.file_present, color: ColorYellow,size: 24,),
                            ],
                           ) ,
                           Row(
                            children: [
                              Text('(الاتصالات وتكنولوجيا المعلومات -1)',style: TextStyle(fontSize: 14,color: darkYellow),),
                              const Text(' الصف الثالث الثانوي',style: TextStyle(fontSize: 18,color: Colors.black),),
                              Icon(Icons.file_present, color: ColorYellow,size: 24,),
                            ],
                           ) 
                        ],
                      ),
                    ),
                  ],
                ),
              );
  }
    @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  // Card widget with image, text, and button
  // Widget _buildCourseCard() {
  //   return GestureDetector(
  //   //   onTap: () {
  //   //   Navigator.push(
  //   //     context,
  //   //     MaterialPageRoute(
  //   //       builder: (context) => (), // Navigate to TeacherDetailPage
  //   //     ),
  //   //   );
  //   // },
  //     child: CardNotSubcribe(),
  //   );
  // }

  
    // Dropdown field widget with label
  Widget _buildDropdownField(String label, String? selectedValue,
      Function(String?) onChanged, List<String> options) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
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

