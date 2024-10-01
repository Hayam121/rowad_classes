import 'package:flutter/material.dart';
import 'package:rowad_classes/Student/login/login.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';

class CreatePassword extends StatelessWidget {
  const CreatePassword({super.key});

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
                    SizedBox(height: 25),
                    Image.asset('assets/images/image varification.png'),
                    SizedBox(height: 20),
                    _buildInputField(),
                    SizedBox(height: 20),
                    _buildResetPasswordButton(context),
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
      'إنشاء كلمة مرور جديدة',
      style: TextStyle(
        color: ColorRowad,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildInputField() {
    return Column(
      children: [
        _buildTextField('كلمة المرور الجديدة', Icons.lock),
        SizedBox(height: 10),
        _buildTextField('تأكيد كلمة المرور الجديدة', Icons.remove_red_eye),
      ],
    );
  }

  Widget _buildTextField(String label, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 24),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildResetPasswordButton( context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorRowad,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: EdgeInsets.all(10),
      ),
      onPressed: () {
        // Implement reset password logic here
          Navigator.push(
           context,
           MaterialPageRoute(builder: (context) => LoginPage()),
         );
      },
      child: Align(
        alignment: Alignment.topCenter,
        child: Text(
          ' تم التأكيد',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
