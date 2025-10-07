import 'package:flutter/material.dart';
import 'package:my_marks/core/consts/strings/strings.dart';
import 'package:my_marks/core/routes/routes.dart';
import 'package:my_marks/features/auth/presentation/widgets/custom_text_form_field.dart';
class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomTextFormField(controller: _emailController,
                        textInputType: TextInputType.emailAddress,
                      validator:  (value) {
                        if (value == null || value.isEmpty) {
                          return kEmailNullError;
                        } else if (!emailValidatorRegExp.hasMatch(value)) {
                          return kInvalidEmailError;
                        }
                        return null;
                      }, hintText: 'Enter Your Email'),

                  const SizedBox(height: 20),
CustomTextFormField(controller: _passwordController, textInputType: TextInputType.visiblePassword, validator: (value) {
  if (value == null || value.isEmpty) {
    return kPassNullError;
  } else if (value.length < 8) {
    return kShortPassError;
  }
  return null;
}, hintText: 'Enter Your Password',
obscureText: true,),

                  const SizedBox(height: 30),

                 SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {


Navigator.pushNamedAndRemoveUntil(context, Routes.studentIfoRoute,(route) {
  return false;
},);

                        }
                      },
                      style:Theme.of(context).elevatedButtonTheme.style,
                      child: const Text("Sign In", ),
                    ),
                  ),


                ],
              ),
            );

  }
}
