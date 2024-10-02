import 'package:flutter/material.dart';
import 'package:rowad_classes/screens/Student/tranning/exam/exam_detail.dart';
import 'package:rowad_classes/constants/colors.dart';

class Exam extends StatelessWidget {
  const Exam({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
        
                Text('  العناصر الانتقالية',style: TextStyle(fontSize: 24,color: darkYellow,fontWeight: FontWeight.w600),),
                buildDirectionalText('الإختبار الخاص بفصل : ',text: 'الإختبار الخاص بفصل : ',direction: TextDirection.rtl,style: TextStyle(fontSize: 24,color: ColorRowad,fontWeight: FontWeight.w600),)
                ]),
            SizedBox(height: 40,),
              Image.asset('assets/images/bro.png'),
            SizedBox(height: 40,),
            Text('انت علي وشك البداية في الاختبار الخاص بالفصل الثالث ',style: TextStyle(fontSize: 18,color: ColorRowad,fontWeight: FontWeight.w700),),
            SizedBox(height: 40,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> ExamDetail()));
                  },
                  child: Text(
                    'البدئ في الاختبار',
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500,fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorYellow,
                  minimumSize: const Size(double.infinity, 36),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                  
                ),
                    ]
            ),
      ),
    );
  }
}