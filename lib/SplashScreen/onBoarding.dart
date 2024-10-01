import 'package:flutter/material.dart';
import 'package:rowad_classes/Teacher/Register/register.dart';
import 'package:rowad_classes/constants/colors.dart';

class OnboardingPage extends StatefulWidget {
  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Add the Skip button at the top right
          Padding(
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => RegisterTeacher()),
                  );
                },
                child: Text(
                  'تخطي',
                  style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                ),
              ),
            ),
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              children: [
                // First onboarding page
                buildOnboardingPage(
                  imagePath: 'assets/images/onboarding1.png',
                  title: 'المحاضرة المجانية',
                  description: 'اشترك في المنصة الآن واستمتع بفرصة المحاضرة المجانية',
                ),
                // Second onboarding page
                buildOnboardingPage(
                  imagePath: 'assets/images/onboarding2.png',
                  title: 'لماذا تجربتنا فريدة تمامًا؟',
                  description: 'تعلم في أي مكان، وفي أي وقت، سواء كنت في المنزل أو بالخارج ، تحت إشراف محاضرين محترفين.',
                ),
                // Third onboarding page
                buildOnboardingPage(
                  imagePath: 'assets/images/onboarding3.png',
                  title: 'ما هو هدفك هذا العام؟',
                  description: 'انضم لأكثر من 50 الف طالب! واحصل على دوراتك بأسهل وأسرع طريقة ممكنة.',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Dots indicator on the left
                Row(
                  children: List.generate(3, (index) => buildDot(index)),
                ),
                // Next button on the right
                ElevatedButton(
                  onPressed: () {
                    if (currentPage < 2) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => RegisterTeacher()),
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    backgroundColor: ColorRowad,
                    padding: EdgeInsets.all(20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOnboardingPage({String? imagePath, String? title, String? description}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image of the onboarding page
          Image.asset(imagePath!),
          SizedBox(height: 20),
          // Title of the onboarding page
          Text(
            title!,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.deepPurple),
          ),
          SizedBox(height: 10),
          // Description of the onboarding page
          Text(
            description!,
            style: TextStyle(fontSize: 24, color: Colors.orangeAccent),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Dot widget for page indicator
  Widget buildDot(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4.0),
      height: 10,
      width: currentPage == index ? 12 : 8,
      decoration: BoxDecoration(
        color: currentPage == index ? Colors.deepPurple : Colors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
