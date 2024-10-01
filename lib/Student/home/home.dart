import 'package:flutter/material.dart';
import 'package:rowad_classes/Student/courses/CourseViewPage.dart';
import 'package:rowad_classes/constants/colors.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? selectedLecturer;
  final List<String> lecturers = ['المحاضر 1', 'المحاضر 2', 'المحاضر 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Image.asset(
            'assets/images/home.png',
            width: 500,
            height: 500,
          ),
          const Align(
            alignment: Alignment.topRight,
            child: Text(
              'منصتك التعليمية الرائدة، حيث يجتمع العلم والتميز! نقدم لك أفضل نخبة من المدرسين المختصين والمؤهلين لتقديم تجارب تعليمية ممتازة وتوجيه فردي يساعدك على تحقيق حلمك',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorYellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'سجل الآن',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
              const SizedBox(
                width: 10,
              ),
              const Text(
                'كيف نعمل',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
              const SizedBox(
                width: 6,
              ),
               Icon(Icons.play_circle,color: Color(0xFF8A7CDB),size: 40,),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Card(
            color: const Color(0xff8A7CDB),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'محاضرة في انتظارك',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'ارتق بمستواك ، واكتشف المحاضر الذي يحدث الفرق في مستقبلك',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w200),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'أبحث الان',
                        style: TextStyle(
                            color: ColorRowad,
                            fontWeight: FontWeight.w300,
                            fontSize: 20),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'ليه تختار دورات الرواد ؟',
              style: TextStyle(
                  fontSize: 24, color: ColorRowad, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.center,
            child: Card(
              color: Colors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/person.png',
                    width: 150,
                    height: 150,
                  ),
                  const Text(
                    'هتنظم وقتك',
                    style: TextStyle(
                      color: Color(0xFF403685),
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    width: 298,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'هتنظملك وقتك بامتحانات واختبارات دورية مش هتخليك تأجل مذاكرتك وتتراكم عليك.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF424242),
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Card(
              color: const Color(0xffEFD7D2),
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/person.png',
                    width: 150,
                    height: 150,
                  ),
                  const Text(
                    ' هنتابع معاكم',
                    style: TextStyle(
                      color: Color(0xFF403685),
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    width: 298,
                    child: Text(
                      'هنتابع معاك ومع ولي أمرك خطوة بخطوة',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF424242),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Align(
            alignment: Alignment.center,
            child: Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/person.png',
                    width: 150,
                    height: 150,
                  ),
                  const Text(
                    ' هنتناقش',
                    style: TextStyle(
                      color: Color(0xFF403685),
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(
                    width: 298,
                    child: Text(
                      'هنفتحلك باب النقاش في كل المعلومات والأسئلة اللي محتار فيها',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF424242),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Card(
            color: const Color(0xffB1ABD7),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      'الدورات المجانية',
                      style: TextStyle(
                          fontSize: 24,
                          color: ColorRowad,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Wrap ListView.builder in a SizedBox
                  SizedBox(
                    height: 200, // Set the height as needed
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CourseViewPage()));
                            },
                            child: Container(
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  const BoxShadow(
                                    color: Colors.black26,
                                    blurRadius: 5,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: Image.asset(
                                      'assets/images/math.png',
                                      fit: BoxFit.cover,
                                      height: 100,
                                      width: 150,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      'النظم العددية $index',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    height: 1,
                                    color: ColorYellow,
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      '''النظم العددية            Numeric Systems ''',
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ],
                              ),
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
          Row(
            children: [
              Text(
                'فرصتك لجعل',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: ColorRowad),
              ),
              const SizedBox(
                width: 6,
              ),
              Text(
                'دورات الرواد',
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: ColorYellow),
              ),
            ],
          ),
          Align(
            alignment: Alignment.topRight,
            child: Text(
              ' كل محاضرة تعليمية تجربة لا تنسي',
              style: TextStyle(
                  fontSize: 26, fontWeight: FontWeight.bold, color: ColorRowad),
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'تجربه تعليمية مصممة خصيصا لك',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              'محاضرونا هنا ليسوا مجرد مدربين ، هم اصدقائك في رحلتك التعليمية ، شركاء معك في كل خطوة نحو القمة.',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'مستعد للتعرف عليهم؟',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: ColorYellow),
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              'assets/images/group.png',
              width: 230,
              height: 230,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(builder:(context) => CourseViewPage(),));
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min, // يجعل حجم الصف مطابقاً للمحتوى
                children: [
                  Text(
                    'عرض المحاضرون',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  Icon(
                    Icons.double_arrow,
                    size: 30,
                    color: Colors.white,
                  ),
                ],
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorYellow,
                maximumSize: const Size.fromWidth(250),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Center(
                  child: Text(
                    ' ! نتائج لا تصدق في كل دورة',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: ColorRowad),
                  ),
                ),
                Text(
                  'لا داعي للقلق بشأن التقييمات ، حلمك بالتميز الأكاديمي يتحقق هنا .',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                      color: Colors.black),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Text(
                    'انضم إلينا لتشهد الفرق في تحصيلك',
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: ColorRowad),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Image.asset('assets/images/home2.png'),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .end, // يجعل النص والأيقونة في منتصف الزر
                  children: [
                    Text(
                      'خطط تدريبية',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8), // إضافة مسافة بين النص والأيقونة
                    Image.asset(
                      'assets/images/icon.png', // المسار إلى الأيقونة
                      width: 35, // تحديد عرض الأيقونة
                      height: 35, // تحديد ارتفاع الأيقونة
                    ),
                  ],
                ),
                 SizedBox(height: 8,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment
                      .end, // يجعل النص والأيقونة في منتصف الزر
                  children: [
                    Text(
                      'اختبارات تدريبية',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8), // إضافة مسافة بين النص والأيقونة
                    Image.asset(
                      'assets/images/icon1.png', // المسار إلى الأيقونة
                      width: 35, // تحديد عرض الأيقونة
                      height: 35, // تحديد ارتفاع الأيقونة
                    ),
                  ],
                ),
                 SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment
                      .end, // يجعل النص والأيقونة في منتصف الزر
                  children: [
                    Text(
                      'محاضرات تفاعلية',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8), // إضافة مسافة بين النص والأيقونة
                    Image.asset(
                      'assets/images/icon2.png', // المسار إلى الأيقونة
                      width: 35, // تحديد عرض الأيقونة
                      height: 35, // تحديد ارتفاع الأيقونة
                    ),
                  ],
                ),
                SizedBox(height: 8,),
                  Row(
                  mainAxisAlignment: MainAxisAlignment
                      .end, // يجعل النص والأيقونة في منتصف الزر
                  children: [
                    Text(
                      'مراجعة وتقييم',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8), // إضافة مسافة بين النص والأيقونة
                    Image.asset(
                      'assets/images/icon3.png', // المسار إلى الأيقونة
                      width: 35, // تحديد عرض الأيقونة
                      height: 35, // تحديد ارتفاع الأيقونة
                    ),
                  ],
                ),
                
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 6,
          ),
        ]),
      )),
    );
  }
}
