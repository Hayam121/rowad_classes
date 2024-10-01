import 'package:flutter/material.dart';
import 'package:rowad_classes/Student/NavBar/navBar.dart';
import 'package:rowad_classes/Student/home/home.dart';
import 'package:rowad_classes/Student/login/forgetpassword.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
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
                    _buildForgotPasswordButton2(context),
                    _buildLoginButton(context),
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
      'تسجيل دخول',
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
        _buildTextField(
            'البريد الالكتروني /اسم المستخدم/رقم بطاقتك', Icons.email),
        SizedBox(height: 12),
        _buildTextField('كلمة المرور', Icons.lock, isPassword: true),
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

  Widget _buildForgotPasswordButton2(context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ResetPasswordPage()),
        );
      },
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          'نسيت كلمة المرور؟',
          style: TextStyle(color: ColorRowad),
        ),
      ),
    );
  }

  Widget _buildLoginButton(context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorRowad,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(10),
      ),
      onPressed: () {
        // Implement login logic here
        Navigator.push(context, MaterialPageRoute(builder:(context) => NavBar(),));
      },
      child: Align(
        alignment: Alignment.center,
        child: Text(
          'تسجيل دخول',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
