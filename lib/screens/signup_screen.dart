import 'package:algecit/screens/login_screen.dart';
import 'package:algecit/utils/colors.dart';
import 'package:algecit/widgets/button_widget.dart';
import 'package:algecit/widgets/text_widget.dart';
import 'package:algecit/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primary,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 300,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextWidget(
                  text: 'Registration',
                  fontSize: 18,
                  fontFamily: 'Bold',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  height: 45,
                  color: Colors.white,
                  borderColor: Colors.white,
                  label: 'Name',
                  controller: name,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  height: 45,
                  color: Colors.white,
                  borderColor: Colors.white,
                  label: 'ID Number',
                  controller: idnumber,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  height: 45,
                  color: Colors.white,
                  borderColor: Colors.white,
                  label: 'Email',
                  controller: email,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  height: 45,
                  color: Colors.white,
                  borderColor: Colors.white,
                  label: 'Password',
                  controller: password,
                  isObscure: true,
                  showEye: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                ButtonWidget(
                  color: Colors.amber,
                  width: 150,
                  radius: 10,
                  label: 'Register',
                  onPressed: () async {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextWidget(
                      text: "Already have an account?",
                      fontSize: 14,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                      child: TextWidget(
                        text: "Login",
                        fontSize: 14,
                        fontFamily: 'Bold',
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController idnumber = TextEditingController();
}
