import 'package:flutter/material.dart';
import 'package:rowad_classes/screens/Student/login/create_password.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/constants/gradientbackground.dart';

class ResetPasswordPage extends StatelessWidget {
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
                    const SizedBox(height: 25),
                    Image.asset('assets/images/forget password.png'), // Adjust image path if needed
                    _buildInputField(),
                    const SizedBox(height: 20),
                    _buildforgetPasswordButton(context), // Pass context here
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
      'نسيت كلمة المرور',
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
        _buildTextField('البريد الإلكتروني', Icons.email),
      ],
    );
  }

  Widget _buildTextField(String label, IconData icon) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, size: 24),
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildforgetPasswordButton(context) { // Accept context as a parameter
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorRowad,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
        // Navigate to the CreatePassword page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreatePassword()),
        );
      },
      child: const Align(
        alignment: Alignment.topCenter,
        child: Text(
          'إعادة تعيين كلمة المرور',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
