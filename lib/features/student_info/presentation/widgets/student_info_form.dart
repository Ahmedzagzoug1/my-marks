import 'package:flutter/material.dart';
import 'package:my_marks/core/routes/routes.dart';

class StudentInfoForm extends StatefulWidget {
  const StudentInfoForm({super.key});

  @override
  State<StudentInfoForm> createState() => _StudentInfoFormState();
}

class _StudentInfoFormState extends State<StudentInfoForm> {
  String? selectedCollege;
  String? selectedDepartment;
  final TextEditingController studentIdController = TextEditingController();

  // قائمة الكليات (مثال)
  final List<String> colleges = [
    "كلية الهندسة",
    "كلية الطب",
    "كلية الاقتصاد",
  ];

  // الأقسام حسب الكلية
  final Map<String, List<String>> departments = {
    "كلية الهندسة": ["قسم المعلوماتية", "قسم الاتصالات", "قسم الكهرباء"],
    "كلية الطب": ["طب بشري", "طب أسنان", "صيدلة"],
    "كلية الاقتصاد": ["إدارة أعمال", "محاسبة", "إحصاء"],
  };

  void _saveStudentInfo() {
    if (selectedCollege == null || selectedDepartment == null || studentIdController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("الرجاء إدخال جميع البيانات")),

      );
      return;
    }

    // هنا ممكن ترسل البيانات للـ Firebase أو السيرفر
    print("College: $selectedCollege");
    print("Department: $selectedDepartment");
    print("Student ID: ${studentIdController.text}");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("تم حفظ البيانات بنجاح ✅")),
    );
    Navigator.pushNamed(context, Routes.studentMarksRoute);

  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // اختيار الكلية
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "اختر الكلية",
                border: OutlineInputBorder(),
              ),
              value: selectedCollege,
              items: colleges.map((college) {
                return DropdownMenuItem(
                  value: college,
                  child: Text(college),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedCollege = value;
                  selectedDepartment = null; // إعادة ضبط القسم
                });
              },
            ),
            const SizedBox(height: 16),

            // اختيار القسم
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "اختر القسم",
                border: OutlineInputBorder(),
              ),
              value: selectedDepartment,
              items: (departments[selectedCollege] ?? <String>[]) // هنا الأمان
                  .map<DropdownMenuItem<String>>((dept) {
                return DropdownMenuItem<String>(
                  value: dept,
                  child: Text(dept),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDepartment = value;
                });
              },
            ),
            const SizedBox(height: 16),

            // إدخال الرقم الجامعي
            TextField(
              controller: studentIdController,
              decoration: const InputDecoration(
                labelText: "الرقم الجامعي",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),

            // زر الحفظ
            ElevatedButton(
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: _saveStudentInfo,
              child: const Text("حفظ"),
            ),
          ],
        ),

    );
  }
}
