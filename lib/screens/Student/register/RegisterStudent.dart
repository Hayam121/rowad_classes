import 'package:flutter/material.dart';
import 'package:rowad_classes/cubit/auth_cubit.dart';
import 'package:rowad_classes/data/endpoints.dart';
import 'package:rowad_classes/screens/Student/login/login.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

class RegisterStudent extends StatefulWidget {
  @override
  _RegisterStudentState createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  String? selectedProvince;
  String? selectedGender;
  String? selectedReligion;
  Map<String, String>? selectedTrainingCourse;
  DateTime? selectedDate;
  List<Map<String, String>> trainingCourses = []; // قائمة الدورات
  // قائمة المحافظات
  final List<Map<String, String>> governments = [
    {"govName": "القاهرة", "govCode": "01"},
    {"govName": "الإسكندرية", "govCode": "02"},
    {"govName": "بورسعيد", "govCode": "03"},
    {"govName": "السويس", "govCode": "04"},
    {"govName": "دمياط", "govCode": "11"},
    {"govName": "الدقهلية", "govCode": "12"},
    {"govName": "الشرقية", "govCode": "13"},
    {"govName": "القليوبية", "govCode": "14"},
    {"govName": "كفر الشيخ", "govCode": "15"},
    {"govName": "الغربية", "govCode": "16"},
    {"govName": "المنوفية", "govCode": "17"},
    {"govName": "البحيرة", "govCode": "18"},
    {"govName": "الإسماعيلية", "govCode": "19"},
    {"govName": "الجيزة", "govCode": "21"},
    {"govName": "بني سويف", "govCode": "22"},
    {"govName": "الفيوم", "govCode": "23"},
    {"govName": "المنيا", "govCode": "24"},
    {"govName": "أسيوط", "govCode": "25"},
    {"govName": "سوهاج", "govCode": "26"},
    {"govName": "قنا", "govCode": "27"},
    {"govName": "أسوان", "govCode": "28"},
    {"govName": "الأقصر", "govCode": "29"},
    {"govName": "البحر الأحمر", "govCode": "31"},
    {"govName": "الوادي الجديد", "govCode": "32"},
    {"govName": "مطروح", "govCode": "33"},
    {"govName": "شمال سيناء", "govCode": "34"},
    {"govName": "جنوب سيناء", "govCode": "35"},
    {"govName": "وافد اجنبي", "govCode": "88"},
  ];

  // Controllers for the text fields
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController mnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController nationalIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchTrainingCourses(); // جلب الدورات عند بدء الصفحة
  }

 // Fetch training courses from the API
  Future<void> _fetchTrainingCourses() async {
    try {
      final response = await Dio().get(Endpoints.getAllCourses);
      if (response.statusCode == 200) {
        List<Map<String, String>> fetchedCourses = List<Map<String, String>>.from(
          response.data.map((course) => {
            'id': course['id'].toString(),
            'name': course['courseName'],
          }),
        );
        setState(() {
          trainingCourses = fetchedCourses;
        });
      } else {
        print('Failed to load courses: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching training courses: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Card(
              color: Colors.white,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTitle(),
                    SizedBox(height: 25,),
                    _buildInputFields(),
                                        SizedBox(height: 10,),

                    _buildDropdownField('حدد الجنس', selectedGender, (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    }, ['ذكر', 'أنثى']),
                    SizedBox(height: 10,),
                    _buildDropdownField('حدد الديانة', selectedReligion, (value) {
                      setState(() {
                        selectedReligion = value;
                      });
                    }, ['مسلم', 'مسيحي']),
                                        SizedBox(height: 10,),

                                       _buildCourseDropdownField(), // Dropdown for courses

                      // استخدام الدورات المستردة من API
                    SizedBox(height: 10,),

                    _buildDropdownField('المحافظة', selectedProvince, (value) {
                      setState(() {
                        selectedProvince = value; // تأكد من أن القيمة هنا هي govCode
                      });
                    }, governments.map((gov) => gov["govName"]!).toList()), // عرض أسماء المحافظات
                    SizedBox(height: 10,),
                    _buildSubmitButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      'أنشئ حساب',
      style: TextStyle(
        color: ColorRowad,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInputFields() {
    return Column(
      children: [
        _buildTextField('الاسم الأول', Icons.person, controller: fnameController),
        SizedBox(height: 12),
        _buildTextField('الاسم الأوسط', Icons.person, controller: mnameController),
        SizedBox(height: 12),
        _buildTextField('اسم العائلة', Icons.person, controller: lnameController),
        SizedBox(height: 12),
        _buildTextField('اسم المستخدم', Icons.person, controller: usernameController),
        SizedBox(height: 12),
        _buildTextField('البريد الإلكتروني', Icons.email, controller: emailController),
        SizedBox(height: 12),
        _buildPhoneField('رقم الهاتف', Icons.phone, controller: phoneController),
        SizedBox(height: 12),
        _buildPhoneField('الرقم القومي', Icons.confirmation_number, controller: nationalIdController),
        SizedBox(height: 12),
        _buildDateField('تاريخ الميلاد', Icons.calendar_today),
        SizedBox(height: 12),
        _buildTextField('كلمة المرور', Icons.lock, isPassword: true, controller: passwordController),
        SizedBox(height: 12),
        _buildTextField('تأكيد كلمة المرور', Icons.remove_red_eye, isPassword: true, controller: confirmPasswordController),
      ],
    );
  }

  Widget _buildTextField(String label, IconData icon, {bool isPassword = false, required TextEditingController controller}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 24),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPhoneField(String label, IconData icon, {required TextEditingController controller}) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 24),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDateField(String label, IconData icon) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, size: 24),
          border: OutlineInputBorder(),
        ),
        child: Text(
          selectedDate != null
              ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
              : 'اختر تاريخ',
          style: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

    Widget _buildDropdownField(String label, String? selectedValue, Function(String?)? onChanged, List<String> items) {
      return DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        value: selectedValue,
        onChanged: onChanged,
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item), // تأكد من أن لديك نص هنا
          );
        }).toList(),
      );
    }

Widget _buildCourseDropdownField() {
    return DropdownButtonFormField<Map<String, String>>(
      decoration: InputDecoration(
        labelText: 'حدد الكورس',
        border: OutlineInputBorder(),
      ),
      value: selectedTrainingCourse,
      onChanged: (Map<String, String>? value) {
        setState(() {
          selectedTrainingCourse = value;
          if (value != null) {
            print('Selected course: ${value['name']} (${value['id']})');
          }
        });
      },
      items: trainingCourses.map((course) {
        return DropdownMenuItem<Map<String, String>>(
          value: course,
          child: Text(course['name'] ?? ''),
        );
      }).toList(),
    );
  }




  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: () {
        // التحقق من صحة البيانات هنا
        if (_validateFields()) {
          _registerStudent();
        } else {
          // عرض رسالة خطأ في حالة عدم صحة البيانات
          print('يرجى ملء جميع الحقول بشكل صحيح.');
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorRowad,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
      ),
      child: Text('تسجيل',
                style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  bool _validateFields() {
    return fnameController.text.isNotEmpty &&
           lnameController.text.isNotEmpty &&
           mnameController.text.isNotEmpty &&
           usernameController.text.isNotEmpty &&
           emailController.text.isNotEmpty &&
           phoneController.text.isNotEmpty &&
           nationalIdController.text.isNotEmpty &&
           passwordController.text.isNotEmpty &&
           confirmPasswordController.text.isNotEmpty &&
           selectedGender != null &&
           selectedReligion != null &&
           selectedProvince != null &&
           selectedTrainingCourse != null &&
           selectedDate != null;
  }

  Future<void> _registerStudent() async {
    // Collect data
    final data = {
      'fname': fnameController.text,
      'mname': mnameController.text,
      'lname': lnameController.text,
      'username': usernameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'nationalId': nationalIdController.text,
      'dateOfBirth': "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
      'password': passwordController.text,
      'confirmPassword': confirmPasswordController.text,
      'gender': selectedGender,
      'religion': selectedReligion,
      'government': selectedProvince,
      'courseId': selectedTrainingCourse?['id'], // Get the course ID from the selected course
    };
  }

  
}

// import 'package:flutter/material.dart';
// import 'package:rowad_classes/screens/Student/login/login.dart';
// import 'package:rowad_classes/constants/colors.dart';
// import 'package:rowad_classes/constants/gradientbackground.dart';

// class RegisterStudent extends StatefulWidget {
//   @override
//   _RegisterStudentState createState() => _RegisterStudentState();
// }

// class _RegisterStudentState extends State<RegisterStudent> {
//   String? selectedProvince;
//   String? selectedGender;
//   String? selectedReligion;
//   String? selectedTrainingCourse;
//   String? selectedTrainingCategory;
//   DateTime? selectedDate;
//   // قائمة المحافظات
//   final List<Map<String, String>> governments = [
//     {"govName": "القاهرة", "govCode": "01"},
//     {"govName": "الإسكندرية", "govCode": "02"},
//     {"govName": "بورسعيد", "govCode": "03"},
//     {"govName": "السويس", "govCode": "04"},
//     {"govName": "دمياط", "govCode": "11"},
//     {"govName": "الدقهلية", "govCode": "12"},
//     {"govName": "الشرقية", "govCode": "13"},
//     {"govName": "القليوبية", "govCode": "14"},
//     {"govName": "كفر الشيخ", "govCode": "15"},
//     {"govName": "الغربية", "govCode": "16"},
//     {"govName": "المنوفية", "govCode": "17"},
//     {"govName": "البحيرة", "govCode": "18"},
//     {"govName": "الإسماعيلية", "govCode": "19"},
//     {"govName": "الجيزة", "govCode": "21"},
//     {"govName": "بني سويف", "govCode": "22"},
//     {"govName": "الفيوم", "govCode": "23"},
//     {"govName": "المنيا", "govCode": "24"},
//     {"govName": "أسيوط", "govCode": "25"},
//     {"govName": "سوهاج", "govCode": "26"},
//     {"govName": "قنا", "govCode": "27"},
//     {"govName": "أسوان", "govCode": "28"},
//     {"govName": "الأقصر", "govCode": "29"},
//     {"govName": "البحر الأحمر", "govCode": "31"},
//     {"govName": "الوادي الجديد", "govCode": "32"},
//     {"govName": "مطروح", "govCode": "33"},
//     {"govName": "شمال سيناء", "govCode": "34"},
//     {"govName": "جنوب سيناء", "govCode": "35"},
//     {"govName": "وافد اجنبي", "govCode": "88"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GradientBackground(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20.0),
//           child: Center(
//             child: Card(
//               color: Colors.white,
//               elevation: 8,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     _buildTitle(),
//                     SizedBox(height: 25,),
//                     _buildInputFields(),
//                     _buildDropdownField('حدد الجنس', selectedGender, (value) {
//                       setState(() {
//                         selectedGender = value;
//                       });
//                     }, ['ذكر', 'أنثى']),
//                     _buildDropdownField('حدد الديانة', selectedReligion,
//                         (value) {
//                       setState(() {
//                         selectedReligion = value;
//                       });
//                     }, ['مسلم', 'مسيحي']),
//                     _buildDropdownField(
//                         ' حدد الكورس ', selectedTrainingCourse,
//                         (value) {
//                       setState(() {
//                         selectedTrainingCourse = value;
//                       });
//                     }, ['دورة 1', 'دورة 2', 'دورة 3']),
//                       SizedBox(height: 10),
//                        _buildDropdownField('المحافظة', selectedProvince, (value) {
//                       setState(() {
//                         selectedProvince = value; // تأكد من أن القيمة هنا هي govCode
//                       });
//                     }, governments.map((gov) => gov["govName"]!).toList()), // عرض أسماء المحافظات

//                     SizedBox(height: 10),
//                     _buildSubmitButton(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTitle() {
//     return Text(
//       ' أنشئ حساب',
//       style: TextStyle(
//         color: ColorRowad,
//         fontSize: 30,
//         fontWeight: FontWeight.bold,
//       ),
//     );
//   }

//   Widget _buildInputFields() {
//     return Column(
//       children: [
//         _buildTextField('الاسم الأول', Icons.person),
//         SizedBox(height: 12),
//         _buildTextField('الاسم الأوسط', Icons.person),
//         SizedBox(height: 12),
//         _buildTextField('اسم العائلة', Icons.person),
//         SizedBox(height: 12),
//         _buildTextField('اسم المستخدم', Icons.person),
//         SizedBox(height: 12),
//         _buildTextField('البريد الإلكتروني', Icons.email),
//         SizedBox(height: 12),
//         _buildPhoneField('رقم الهاتف', Icons.phone),
//         SizedBox(height: 12),
//         _buildPhoneField('الرقم القومي', Icons.confirmation_number),
//         SizedBox(height: 12),
//         _buildDateField('تاريخ الميلاد', Icons.calendar_today),
//         SizedBox(height: 12),
//         _buildTextField('كلمة المرور', Icons.lock, isPassword: true),
//         SizedBox(height: 12),
//         _buildTextField('تأكيد كلمة المرور', Icons.remove_red_eye,
//             isPassword: true),
//       ],
//     );
//   }

//   Widget _buildTextField(String label, IconData icon,
//       {bool isPassword = false}) {
//     return TextField(
//       obscureText: isPassword,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, size: 24),
//         border: OutlineInputBorder(),
//       ),
//     );
//   }

//   Widget _buildPhoneField(String label, IconData icon) {
//     return TextField(
//       keyboardType: TextInputType.phone,
//       decoration: InputDecoration(
//         labelText: label,
//         prefixIcon: Icon(icon, size: 24),
//         border: OutlineInputBorder(),
//       ),
//     );
//   }

//   Widget _buildDateField(String label, IconData icon) {
//     return GestureDetector(
//       onTap: () => _selectDate(context),
//       child: InputDecorator(
//         decoration: InputDecoration(
//           labelText: label,
//           prefixIcon: Icon(icon, size: 24),
//           border: OutlineInputBorder(),
//         ),
//         child: Text(
//           selectedDate != null
//               ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
//               : 'اختر تاريخ',
//           style: TextStyle(color: Colors.grey),
//         ),
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate ?? DateTime.now(),
//       firstDate: DateTime(1900),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null && picked != selectedDate) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//      Widget _buildDropdownField(String label, String? selectedValue, Function(String?)? onChanged, List<String> items) {
//       return DropdownButtonFormField<String>(
//         decoration: InputDecoration(
//           labelText: label,
//           border: OutlineInputBorder(),
//         ),
//         value: selectedValue,
//         onChanged: onChanged,
//         items: items.map((String item) {
//           return DropdownMenuItem<String>(
//             value: item,
//             child: Text(item), // تأكد من أن لديك نص هنا
//           );
//         }).toList(),
//       );
//     }

//   Widget _buildSubmitButton() {
//     return ElevatedButton(
//       style: ElevatedButton.styleFrom(
//         backgroundColor: ColorRowad,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(15),
//         ),
//         padding: EdgeInsets.all(10),
//       ),
//       onPressed: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => LoginPage()),
//         );
//       },
//       child: Align(
//         alignment: Alignment.topCenter,
//         child: Text(
//           'تسجيل ',
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//       ),
//     );
//   }
  
// }
