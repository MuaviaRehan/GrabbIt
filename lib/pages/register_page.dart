import 'package:classico/components/my_button.dart';
import 'package:classico/components/my_textfield.dart';
import 'package:classico/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;

  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _pwcontroller = TextEditingController();
  final TextEditingController _confirmpwcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  void register() async {
    // fill out authentication here
    final _authService = AuthService();

// check if password match => create user
    if (_pwcontroller.text == _confirmpwcontroller.text) {
// try creating user
      try {
        await _authService.signUpWithEmailPassword(
            _emailcontroller.text, _pwcontroller.text);
      } catch (e) {
        showDialog(
          // ignore: use_build_context_synchronously
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords does not match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // logo
            Center(
               child: Lottie.asset(
                         "assets/animations/delivery.json", // put your file path
                         height: 300,
                         repeat: true, // play once
                       ),
             ),
            SizedBox(
              height: 25,
            ),
            // message app slogan
            Text(
              "Let's create an account for you",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            SizedBox(
              height: 25,
            ),
            // email textfield
            MyTextfield(
              controller: _emailcontroller,
              hintText: "Enter your Email",
              obsecureText: false,
            ),
            SizedBox(
              height: 10,
            ),
            // password textfield
            MyTextfield(
              controller: _pwcontroller,
              hintText: "Enter your Password",
              obsecureText: true,
            ),

            SizedBox(
              height: 10,
            ),

            //confirm password textfield

            MyTextfield(
              controller: _confirmpwcontroller,
              hintText: "Confirm your Password",
              obsecureText: true,
            ),
            SizedBox(
              height: 25,
            ),
            // signin button
            MyButton(text: "Sign Up", onTap: () => register()),

            SizedBox(
              height: 25,
            ),
            // Already have an account? login now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
