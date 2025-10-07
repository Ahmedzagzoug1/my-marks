/*import 'package:equatable/equatable.dart';

part 'student_info_state.dart';

class StudentInfoCubit extends Cubit<StudentInfoState> {
  StudentInfoCubit() : super(StudentInfoInitial());

  void saveStudentInfo({
    required String college,
    required String department,
    required String studentId,
  }) {
    // هنا ممكن تبعت للـ Repository يحفظ في Firebase
    emit(StudentInfoSaved(
      college: college,
      department: department,
      studentId: studentId,
    ));
  }
}
*/