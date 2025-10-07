import 'package:flutter/material.dart';
import 'package:my_marks/core/consts/colors/colors.dart';
import 'package:my_marks/features/auth/presentation/widgets/sign_in_form.dart';
class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColor.background,
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
          child: SignInForm()),
    ));
  }
}
