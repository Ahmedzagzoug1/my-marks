/*part of 'student_info_cubit.dart';


abstract class StudentInfoState extends Equatable {
  const StudentInfoState();

  @override
  List<Object?> get props => [];
}

class StudentInfoInitial extends StudentInfoState {}

class StudentInfoSaved extends StudentInfoState {
  final String college;
  final String department;
  final String studentId;

  const StudentInfoSaved({
    required this.college,
    required this.department,
    required this.studentId,
  });

  @override
  List<Object?> get props => [college, department, studentId];
}
*/