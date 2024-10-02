import 'package:flutter/material.dart';
import 'package:rowad_classes/screens/Student/tranning/card_not_subscribe.dart/payment.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';
import 'package:video_player/video_player.dart';

class ViewCourseNotSubscribe extends StatefulWidget {
  const ViewCourseNotSubscribe({super.key});

  @override
  State<ViewCourseNotSubscribe> createState() => _ViewCourseNotSubscribeState();
}

class _ViewCourseNotSubscribeState extends State<ViewCourseNotSubscribe> {
  late VideoPlayerController _controller;
  bool _isExpanded = false;  
  bool _isExpanded2 = false;  

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
      child: GradientBackground(
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
            // title: const Text(
            //   'المحاضرون',
            //   style: TextStyle(color: Colors.white),
            // ),
            backgroundColor: ColorRowad,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
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
                              const SizedBox(width: 7,),
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
                          Card(
                            color: Colors.white,
                              shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
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
                                const SizedBox(height: 8,),
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
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                buildDirectionalText('السبت - 2 من فبراير 2024',text:'السبت - 2 من فبراير 2024' , direction: TextDirection.rtl,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: ColorRowad))  ,
                                buildDirectionalText('تم النشر في :' ,text:'تم النشر في :' , direction: TextDirection.rtl,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: darkYellow))  ,                           
                                 const SizedBox(width: 6,),
                                 Icon(Icons.access_alarm,color: darkYellow,),      
                              ],
                            ),
                          ),
                           Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               ElevatedButton(
                                                   onPressed: () {
                                                     // Action for 500.00 جنيهاً button
                                                   },
                                                   style: ElevatedButton.styleFrom(
                                                    backgroundColor: ColorRowad,
                                                     shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
                                                     minimumSize: const Size(50, 40),
                                                     
                                                   ),
                                                   child: buildDirectionalText(
                                                    '500.00 جنيهاً',
                                                     text:'500.00 جنيهاً', 
                                                     direction: TextDirection.rtl,
                                                     style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                                     ),
                               
                                                   ),
                                                 ),
                                                  ElevatedButton(
                                onPressed: () {
                                   Navigator.push(context, MaterialPageRoute(builder:(context) => const Payment(),));
                                },
                                child: buildDirectionalText(
                                  'اشترك الان !',
                                  text: 'اشترك الان !',
                                  direction: TextDirection.rtl,
                                  style: const TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: ColorYellow,
                                   shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15), // Set rounded corners
                                  ),
                                   minimumSize: const Size(50, 40),
                                ),
                                                     ),
                             ],
                           ),
                           const SizedBox(height: 10,),
                              ],
                            ),
                          ),
                            const SizedBox(height: 10,),
                          Center(
                            child: Text('محتوي الفصل',style: TextStyle(color: ColorRowad,fontSize: 24,fontWeight: FontWeight.bold),)),
                            Center(  
                child: Column(  
                  mainAxisAlignment: MainAxisAlignment.center,  
                  children: <Widget>[  
                  Card(  
              child: Column(  
              children: <Widget>[  
            GestureDetector(  
              onTap: () {  
              setState(() {  
            _isExpanded = !_isExpanded;  
              });  
              },  
              child: ListTile(  
              leading: Icon(_isExpanded ? Icons.arrow_drop_up : Icons.arrow_drop_down,size: 30,),  
              title: buildDirectionalText('الدرس الاول :',text: 'الدرس الاول :', direction: TextDirection.rtl, style: TextStyle(fontSize: 20, color: ColorRowad)),  
              subtitle: buildDirectionalText('القوة والحركة',text: 'القوة والحركة', direction: TextDirection.rtl, style: TextStyle(fontSize: 20, color: darkYellow)),  
              trailing: Icon(Icons.file_present, size: 30, color: darkYellow),  
              ),  
            ),  
            _isExpanded  
              ? Container(  
              padding: const EdgeInsets.all(8),  
              child: const Text('Description',style: TextStyle(fontSize: 18,)),  
            )  
              : Container(),  
              ],  
              ),  
            ),
               Card(  
                  child: Column(  
                  children: <Widget>[  
                GestureDetector(  
                  onTap: () {  
                  setState(() {  
                _isExpanded2 = !_isExpanded2;  
                  });  
                  },  
                  child: ListTile(  
                  leading: Icon(_isExpanded2 ? Icons.arrow_drop_up : Icons.arrow_drop_down,size: 30,),  
                  title: buildDirectionalText('الدرس الاول :',text: 'الدرس الاول :', direction: TextDirection.rtl, style: TextStyle(fontSize: 20, color: ColorRowad)),  
                  subtitle: buildDirectionalText('القوة والحركة',text: 'القوة والحركة', direction: TextDirection.rtl, style: TextStyle(fontSize: 20, color: darkYellow)),  
                  trailing: Icon(Icons.file_present, size: 30, color: darkYellow),  
                  ),  
                ),  
                _isExpanded2  
                  ? Container(  
                  padding: const EdgeInsets.all(8),  
                  child: const Text('Description',style: TextStyle(fontSize: 18,),),  
                )  
                  : Container(),  
                  ],  
                  ),  
                ),
                  ],  
                ),  
               ),  
              ],
            ),
          ),
        ),
      ),
    );
  }
}