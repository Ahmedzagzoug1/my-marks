import 'package:flutter/material.dart';
import 'package:my_marks/core/routes/routes.dart';

class AppDrawer extends StatelessWidget {
  final VoidCallback onLogout;

  const AppDrawer({super.key, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Text(
                "علاماتي 🎓",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          // الرئيسية
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("الرئيسية"),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.homeRoute);
            },
          ),

          // عرض العلامات
          ListTile(
            leading: const Icon(Icons.assignment),
            title: const Text("عرض العلامات"),
            onTap: () {
              Navigator.pushReplacementNamed(context, Routes.studentMarksRoute);
            },
          ),

          // بيانات الطالب
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("بيانات الطالب"),
            onTap: () {
              Navigator.pushReplacementNamed(context,Routes.studentIfoRoute);
            },
          ),

          const Divider(),

          // تسجيل الخروج
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.red),
            title: const Text("تسجيل الخروج"),
            onTap: onLogout,
          ),
        ],
      ),
    );
  }
}
