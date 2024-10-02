import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/profile.png'), // صورة الملف الشخصي
            ),
            SizedBox(height: 10),
            Text(
              'هيام محمود محمد',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            InfoTile(label: 'البريد الإلكتروني', value: 'hayam0971@gmail.com'),
            InfoTile(label: 'النوع', value: 'أنثى'),
            InfoTile(label: 'تاريخ الميلاد', value: '9/12/2001'),
            InfoTile(label: 'رقم الهاتف', value: '01027257234'),
            InfoTile(label: 'الديانة', value: 'مسلم'),
            InfoTile(label: 'الصف', value: 'الثالث الثانوي'),
            ElevatedButton(
              onPressed: () {},
              child: Text('تحديث'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
            SizedBox(height: 20),
            // باقي المحتوى الخاص بالدورات أو أي معلومات أخرى
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String label;
  final String value;

  const InfoTile({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
