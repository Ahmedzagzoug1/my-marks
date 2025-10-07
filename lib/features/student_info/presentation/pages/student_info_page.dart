import 'package:flutter/material.dart';
import 'package:my_marks/features/student_info/presentation/widgets/student_info_form.dart';
class StudentInfoPage extends StatelessWidget {
  const StudentInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("بيانات الطالب"),
          centerTitle: true,
        ),
        body:
        StudentInfoForm());
  }
}

