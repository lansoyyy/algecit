import 'package:algecit/screens/home_screen.dart';
import 'package:algecit/utils/colors.dart';
import 'package:algecit/widgets/button_widget.dart';
import 'package:algecit/widgets/text_widget.dart';
import 'package:algecit/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: primary,
        ),
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
              text: 'Login',
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
              label: 'Username',
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
              label: 'Login',
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TextWidget(
            //       text: "Don't have an account?",
            //       fontSize: 14,
            //     ),
            //     TextButton(
            //       onPressed: () {
            //         Navigator.of(context).push(MaterialPageRoute(
            //             builder: (context) => SignupScreen()));
            //       },
            //       child: TextWidget(
            //         text: "Register",
            //         fontSize: 14,
            //         fontFamily: 'Bold',
            //       ),
            //     )
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
}
