import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rowad_classes/cubit/auth_cubit.dart';
import 'package:rowad_classes/data/api_client.dart';
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
Map<String, dynamic>? selectedTrainingCourse; // Change to dynamic
  DateTime? selectedDate;
String? selectedTrainingCourseName; // To hold the selected course name

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
  context.read<AuthCubit>().fetchAllCourses();
}
@override
void dispose() {
  fnameController.dispose();
  lnameController.dispose();
  mnameController.dispose();
  usernameController.dispose();
  emailController.dispose();
  phoneController.dispose();
  nationalIdController.dispose();
  passwordController.dispose();
  confirmPasswordController.dispose();
  super.dispose();
}  

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, '/login');
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      }, builder: (BuildContext context, AuthState state) { 
        return  Scaffold(
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
      
                  _buildDropdownField(
        'المحافظة',
        selectedProvince,
        (value) {
      setState(() {
        selectedProvince = governments.firstWhere((gov) => gov["govName"] == value)["govCode"];
        print('selectedProvince: $selectedProvince');
      });
        },
        governments.map((gov) => gov["govName"]!).toList(),
      ),
      
      
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
       },
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
    value: selectedValue != null && items.contains(selectedValue) ? selectedValue : null, // Ensure the selected value is valid
    onChanged: onChanged,
    items: items.map((String item) {
      return DropdownMenuItem<String>(
        value: item,
        child: Text(item),
      );
    }).toList(),
  );
}


Widget _buildCourseDropdownField() {
  return BlocBuilder<AuthCubit, AuthState>(
    builder: (context, state) {
      print('Current state: $state'); // طباعة الحالة الحالية

      if (state is AuthLoading) {
        return Center(child: CircularProgressIndicator());
      } else if (state is CoursesLoaded) {
        return GestureDetector(
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  padding: EdgeInsets.all(16.0),
                  child: ListView.builder(
                    itemCount: state.courses.length,
                    itemBuilder: (context, index) {
                      final course = state.courses[index];
                      return ListTile(
                        title: Text(course['name'] ?? 'Unknown Course'),
                        onTap: () {
                          setState(() {
                            // Set the selected course ID
                            selectedTrainingCourse = {
                              'id': course['id'],
                            } as Map<String, dynamic>; // Ensure correct type
                            selectedTrainingCourseName = course['name']; // Store the name for display
                          });
                          print('Selected course ID: ${course['id']}'); // Print selected course ID
                          Navigator.pop(context); // Close the modal
                        },
                      );
                    },
                  ),
                );
              },
            );
          },
          child: InputDecorator(
            decoration: InputDecoration(
              labelText: 'حدد الكورس',
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.school),
            ),
            // Display the selected course name or a placeholder
            child: Text(selectedTrainingCourseName ?? 'اختر دورة'),
          ),
        );
      } else if (state is CoursesError) {
        return Center(child: Text(state.error ?? 'حدث خطأ غير محدد'));
      } else {
        return Container(child: Text('حدث خطأ غير محدد'));
      }
    },
  );
}


   Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _submit,
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorRowad,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text('تسجيل', style: TextStyle(fontSize: 20, color: Colors.white)),
    );
  }

  void _submit() async {
    if (_validateFields()) {
      try {
        final result = await context.read<AuthCubit>().register(
          fname: fnameController.text,
          mname: mnameController.text,
          lname: lnameController.text,
          username: usernameController.text,
          email: emailController.text,
          phone: phoneController.text,
          nationalId: nationalIdController.text,
          password: passwordController.text,
          confirmPassword: confirmPasswordController.text,
          gender: selectedGender ?? '',
          religion: selectedReligion ?? '',
          province: selectedProvince ?? '',
          dateOfBirth: selectedDate,
          trainingCourse: selectedTrainingCourse?['id'] ?? '',
        );
        // Handle successful registration (e.g., navigate to login)
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => LoginPage()),
        // );
      } catch (error) {
        // Handle registration error (e.g., show snackbar)
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration failed: $error')));
      }
    }
  }

  bool _validateFields() {
    if (fnameController.text.isEmpty || lnameController.text.isEmpty || usernameController.text.isEmpty ||
        emailController.text.isEmpty || phoneController.text.isEmpty || nationalIdController.text.isEmpty ||
        passwordController.text.isEmpty || confirmPasswordController.text.isEmpty || selectedTrainingCourse == null ||
        selectedGender == null || selectedReligion == null || selectedProvince == null || selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('الرجاء ملء جميع الحقول')));
      return false;
    }
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('كلمة المرور غير متطابقة')));
      return false;
    }
    return true;
  }
}



