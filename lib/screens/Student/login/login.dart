import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rowad_classes/constants/colors.dart';
import 'package:rowad_classes/cubit/auth_cubit.dart';
import 'package:rowad_classes/screens/Student/NavBar/navBar.dart';
import 'package:rowad_classes/screens/Student/login/forgetpassword.dart';

class LoginPage extends StatefulWidget {  // اجعلها StatefulWidget
  LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true; // لتغيير رؤية كلمة المرور

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, '/home');
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        return Scaffold(
          body: Center(
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
                      _buildEmailField(), // استخدم دالة لإنشاء حقل البريد الإلكتروني
                      const SizedBox(height: 15),
                      _buildPasswordField(), // استخدم دالة لإنشاء حقل كلمة المرور
                      _buildForgotPasswordButton2(context),
                      _buildLoginButton(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }
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

  Widget _buildEmailField() {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'البريد الالكتروني /اسم المستخدم/رقم بطاقتك',
        prefixIcon: Icon(Icons.email), // أيقونة البريد الإلكتروني
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      controller: passwordController,
      decoration: InputDecoration(
        labelText: 'كلمة المرور',
        prefixIcon: const Icon(Icons.lock), // أيقونة القفل
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText; // تغيير الحالة عند الضغط
            });
          },
        ),
      ),
      obscureText: _obscureText, // استخدام المتغير لتحديد إذا كانت كلمة المرور مخفية
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
          style: TextStyle(
            color: ColorRowad,
          ),
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
        padding: const EdgeInsets.all(10),
      ),
      onPressed: () {
       //  Navigator.push(context, MaterialPageRoute(builder: (context)=>NavBar()));
       onPressed: () async {
  final email = emailController.text;
  final password = passwordController.text;

  try {
    // Attempt to log in
    await BlocProvider.of<AuthCubit>(context).login(email, password);
    
    // If login is successful, navigate to the home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => NavBar()),
    );
  } catch (error) {
    // If there is an error, show a snackbar with the error message
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login failed: $error')),
    );
  }
};

      },
      child: const Align(
        alignment: Alignment.center,
        child: Text(
          'تسجيل دخول',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}
