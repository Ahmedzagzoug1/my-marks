import 'package:flutter/material.dart';
import 'package:my_marks/core/consts/colors/colors.dart';
import 'package:my_marks/core/routes/routes.dart';

class StudentMarksPage extends StatefulWidget {
  const StudentMarksPage({super.key});

  @override
  State<StudentMarksPage> createState() => _StudentMarksPageState();
}

class _StudentMarksPageState extends State<StudentMarksPage> {
  final Map<String, Map<String, List<Map<String, dynamic>>>> mockData = const {
    "السنة الأولى": {
      "الفصل الأول": [
        {"subject": "رياضيات 1", "mark": 85},
        {"subject": "برمجة 1", "mark": 92},
        {"subject": "فيزياء", "mark": 76},
      ],
      "الفصل الثاني": [
        {"subject": "رياضيات 2", "mark": 88},
        {"subject": "برمجة 2", "mark": 90},
        {"subject": "كيمياء", "mark": 80},
      ],
    },
    "السنة الثانية": {
      "الفصل الأول": [
        {"subject": "هندسة برمجيات", "mark": 91},
        {"subject": "قواعد بيانات", "mark": 87},
        {"subject": "إحصاء", "mark": 70},
      ],
    },
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("علاماتي"),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: InkWell(
            onTap: (){
            Navigator.pushNamed(context,Routes.homeRoute);
            },
            child: Icon(Icons.home,color: AppColor.cardBackground,
            size: 30,),
          ),
        )
      ],),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: mockData.entries.map((yearEntry) {
          final year = yearEntry.key;
          final semesters = yearEntry.value;

          return ExpansionTile(
            title: Text(
              year,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            children: semesters.entries.map((semesterEntry) {
              final semester = semesterEntry.key;
              final subjects = semesterEntry.value;

              return ExpansionTile(
                title: Text(
                  semester,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                children: subjects.map((subject) {
                  return ListTile(
                    title: Text(subject["subject"]),
                    trailing: Text(
                      subject["mark"].toString(),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: subject["mark"] >= 50
                            ? Colors.green
                            : Colors.redAccent,
                      ),
                    ),
                  );
                }).toList(),
              );
            }).toList(),
          );
        }).toList(),
      ),
    );
  }
}
