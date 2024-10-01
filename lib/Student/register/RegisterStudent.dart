import 'package:flutter/material.dart';
import 'package:rowad_classes/Student/login/login.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';

class RegisterStudent extends StatefulWidget {
  @override
  _RegisterStudentState createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  String? selectedProvince;
  String? selectedGender;
  String? selectedReligion;
  String? selectedTrainingCourse;
  String? selectedTrainingCategory;
  DateTime? selectedDate;


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
                    _buildDropdownField('حدد الجنس', selectedGender, (value) {
                      setState(() {
                        selectedGender = value;
                      });
                    }, ['ذكر', 'أنثى']),
                    _buildDropdownField('حدد الديانة', selectedReligion,
                        (value) {
                      setState(() {
                        selectedReligion = value;
                      });
                    }, ['إسلام', 'مسيحية']),
                    _buildDropdownField(
                        ' حدد الكورس ', selectedTrainingCourse,
                        (value) {
                      setState(() {
                        selectedTrainingCourse = value;
                      });
                    }, ['دورة 1', 'دورة 2', 'دورة 3']),
                    _buildDropdownField('المحافظة', selectedProvince, (value) {
                      setState(() {
                        selectedProvince = value;
                      });
                    }, ['محافظة 1', 'محافظة 2', 'محافظة 3']),
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
      ' أنشئ حساب',
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
        _buildTextField('الاسم الأول', Icons.person),
        SizedBox(height: 12),
        _buildTextField('الاسم الأوسط', Icons.person),
        SizedBox(height: 12),
        _buildTextField('اسم العائلة', Icons.person),
        SizedBox(height: 12),
        _buildTextField('اسم المستخدم', Icons.person),
        SizedBox(height: 12),
        _buildTextField('البريد الإلكتروني', Icons.email),
        SizedBox(height: 12),
        _buildPhoneField('رقم الهاتف', Icons.phone),
        SizedBox(height: 12),
        _buildPhoneField('الرقم القومي', Icons.confirmation_number),
        SizedBox(height: 12),
        _buildDateField('تاريخ الميلاد', Icons.calendar_today),
        SizedBox(height: 12),
        _buildTextField('كلمة المرور', Icons.lock, isPassword: true),
        SizedBox(height: 12),
        _buildTextField('تأكيد كلمة المرور', Icons.remove_red_eye,
            isPassword: true),
      ],
    );
  }

  Widget _buildTextField(String label, IconData icon,
      {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 24),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildPhoneField(String label, IconData icon) {
    return TextField(
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
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Widget _buildDropdownField(String label, String? selectedValue,
      Function(String?) onChanged, List<String> options) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
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
      ),
    );
  }  

  Widget _buildSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorRowad,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(10),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          'تسجيل ',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
