import 'package:dynamic_tabbar/dynamic_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:rowad_classes/screens/Student/tranning/card_not_subscribe.dart/summary_table.dart';
import 'package:rowad_classes/screens/Student/tranning/exam/exam.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';
import 'package:video_player/video_player.dart';

class ViewUnits extends StatefulWidget {
  @override
  _ViewUnitsState createState() => _ViewUnitsState();
}

class _ViewUnitsState extends State<ViewUnits> with SingleTickerProviderStateMixin {
  late VideoPlayerController _controller;
  int _currentVideoIndex = 0;
  late TabController _tabController;
  late List<TabData> tabs; // Declare tabs without initialization
  List<String> _videoUrls = [
    'assets/videos/myvideo.mp4',
    'assets/videos/myvideo.mp4',
    'assets/videos/myvideo.mp4'
  ];

  List<String> _videoTitles = [
    'العناصر الانتقالية  1',
    'العناصر الانتقالية 2',
    'العناصر الانتقالية 3',
  ];
    // Leading icon
  Widget? leading;
  // Trailing icon
  Widget? trailing;

  bool isScrollable = true;
  bool showNextIcon = true;
  bool showBackIcon = true;
  bool _isPlaylistVisible = false; // To manage playlist visibility

  @override
  void initState() {
    super.initState();
    _initializeVideoPlayer();
    _tabController = TabController(length: 4, vsync: this);
    _initializeTabs(); // Initialize tabs here
  }

  void _initializeTabs() {
    tabs = [
      TabData(
        index: 1,
        title: const Tab(
          child: Text(
            'محتوي الدرس',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        content: contentLesson(),
      ),
      TabData(
        index: 5,
        title: const Tab(
          child: Text(
            'ملخص',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        content: tableSummary(),
      ),
      TabData(
        index: 4,
        title: const Tab(
          child: Text(
            'صوتيات',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        content: tableAudio(),
      ),
      TabData(
        index: 3,
        title: const Tab(
          child: Text(
            'صور الدرس',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        content: tablePhoto(),
      ),
      TabData(
        index: 2,
        title: const Tab(
          child: Text(
            'الاختبارات',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        content: twoButtons(context), // Now 'context' can be used here
      ),
      TabData(
        index: 6,
        title: const Tab(
          child: Text(
            'الاسئلة الشائعة',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        content: const Center(child: Text('Content for Tab 2')),
      ),
      // Add more tabs as needed
    ];
  }

  @override
  void dispose() {
    _controller.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _playNextVideo() {
    setState(() {
      if (_currentVideoIndex < _videoUrls.length - 1) {
        _currentVideoIndex++;
        _initializeVideoPlayer();
      }
    });
  }

  void _playPreviousVideo() {
    setState(() {
      if (_currentVideoIndex > 0) {
        _currentVideoIndex--;
        _initializeVideoPlayer();
      }
    });
  }

  void _initializeVideoPlayer() {
    _controller = VideoPlayerController.asset(_videoUrls[_currentVideoIndex])
      ..initialize().then((_) {
        setState(() {
          // Do not play the video automatically
        });
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
          backgroundColor: ColorRowad,
          title: Text(
            'الوحدة الأولي - الدرس الأول',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Buttons above the video
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        // Action for Live button
                      },
                      icon: Icon(Icons.live_tv,color: Colors.white,),
                      label: Text('بث مباشر',style:TextStyle(color: Colors.white,fontSize: 16),),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 141, 135, 179),
                        ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // Action for Quiz button
                        Navigator.push(context, MaterialPageRoute(builder:(context) => Exam(),));
                      },
                      icon: Icon(Icons.quiz),
                      label: Text('الاختبار الخاص بالفصل',style:TextStyle(color: ColorRowad,fontSize: 16),),
                    ),
                  ],
                ),
              ),
              // Video Section
              Card(
                child: Column(
                  children: [
                    _controller.value.isInitialized
                        ? AspectRatio(
                            aspectRatio: _controller.value.aspectRatio,
                            child: VideoPlayer(_controller),
                          )
                        : CircularProgressIndicator(),
                    // Adjusting the position of the title and subtitle
                    ListTile(
                      title: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'العناصر الانتقالية',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      subtitle: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'الوحدة الأولي - الدرس الأول',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Video Controls
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.skip_previous),
                      onPressed: _playPreviousVideo,
                    ),
                    IconButton(
                      icon: Icon(
                        _controller.value.isPlaying
                            ? Icons.pause
                            : Icons.play_arrow,
                      ),
                      onPressed: () {
                        setState(() {
                          _controller.value.isPlaying
                              ? _controller.pause()
                              : _controller.play();
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.skip_next),
                      onPressed: _playNextVideo,
                    ),
                  ],
                ),
              ),

              // Toggle Playlist
              ListTile(
                title: Text('قائمة التشغيل'),
                trailing: IconButton(
                  icon: Icon(
                      _isPlaylistVisible ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      _isPlaylistVisible = !_isPlaylistVisible; // Toggle visibility
                    });
                  },
                ),
              ),

              // Playlist
              if (_isPlaylistVisible)
                Container(
                  height: 200.0, // Set a fixed height for the playlist
                  child: ListView.builder(
                    itemCount: _videoUrls.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        trailing: Image.asset(
                          'assets/images/math2.png', width: 100
                        ), // Replace with actual thumbnails
                        title: Align(
                          alignment: Alignment.topRight,
                          child: Text('فيديو ${index + 1}'),
                        ),
                        subtitle: Align(
                          alignment: Alignment.topRight,
                          child: Text(_videoTitles[index]),
                        ),
                        onTap: () {
                          setState(() {
                            _currentVideoIndex = index;
                            _initializeVideoPlayer(); // Play selected video
                          });
                        },
                      );
                    },
                  ),
                ),

              // TabBarView with fixed height
              SizedBox(
                height: 500, // Define a height for the tab content
                child: DynamicTabBarWidget(
                  dynamicTabs: tabs,
                  isScrollable: isScrollable,
                  onTabControllerUpdated: (controller) {
                    debugPrint("onTabControllerUpdated");
                  },
                  onTabChanged: (index) {
                    debugPrint("Tab changed: $index");
                  },
                  onAddTabMoveTo: MoveToTab.last,
                  showBackIcon: showBackIcon,
                  showNextIcon: showNextIcon,
                  leading: leading,
                  trailing: trailing,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
