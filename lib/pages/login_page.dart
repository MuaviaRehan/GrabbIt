import 'package:classico/components/my_button.dart';
import 'package:classico/components/my_textfield.dart';
import 'package:classico/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;

  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _pwcontroller = TextEditingController();

  final TextEditingController _emailcontroller = TextEditingController();

// login method
 void login() async {
    // fill out authentication here
    final _authService = AuthService();

   
// try signing in
      try {
        await _authService.signInWithEmailPassword(
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
   
  }

  // forgot password 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // animation
             Center(
               child: Lottie.asset(
                         "assets/animations/delivery.json", // put your file path
                         height: 300,
                         repeat: true, // play once
                       ),
             ),
              SizedBox(
                height: 15,
              ),
              // message app slogan
              Text(
                "GrabbIt",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
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
                height: 25,
              ),  
              // signin button
              MyButton(text: "Sign In", onTap: login),
        
              SizedBox(
                height: 25,
              ),
              // not a member? register now
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not a member?",
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
                      "Register now",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                   SizedBox(
                    height: 100,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
