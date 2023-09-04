import 'dart:developer';

import 'package:boxing/classes/custom_textfield.dart';
import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/models/login_model.dart';
import 'package:boxing/screens/credential/signup.dart';
import 'package:boxing/terms.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool showPassword = true;
  final _formKey = GlobalKey<FormState>();
  ToastMessage toastMessage = ToastMessage();

  Future<void> signIn(context) async {
    AuthWithUser userAuth = AuthWithUser(
        email: emailController.text, password: passController.text);

    try {
      if (emailController.text.isNotEmpty && passController.text.isNotEmpty) {
        // showDialog(
        //    context: context,
        //    barrierDismissible: false,
        //    builder: (context) => const Center(
        //      child: CircularProgressIndicator(),
        //    ));

        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: userAuth.email,
          password: userAuth.password,
        );

        if (userCredential.user != null) {
          toastMessage.showToastMessage("Login Successfully");
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TermsandConditions()),
          );
        } else {
          // Navigator.pop(context);
          toastMessage.showToastMessage("Something went wrong");

        }
      }
    } on FirebaseAuthException catch (e) {
      //   Navigator.pop(context);
      toastMessage.showToastMessage(e.code);
      // showDialog(
      //   context: context,
      //   builder: (context) => AlertDialog(
      //     title: Text(
      //       "user are not exits",
      //       textAlign: TextAlign.center,
      //     ),
      //     actions: [
      //       Center(
      //         child: ElevatedButton(
      //           onPressed: () => Navigator.pop(context),
      //           style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.black)),
      //           child: const Text("Close"),
      //         ),
      //       )
      //     ],
      //   ),
      // );

      log('user error $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 00, right: 0, bottom: 40, top: 60),
                child: SizedBox(
                    height: 100,
                    width: 342,
                    child: Image.asset(
                      "images/logo.png",
                    )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Real Time Sport Content",
                    style: TextStyle(
                      color: themecolordark,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Sign in with email & password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                child: CustomTextFormField(
                  controller: emailController,
                  hint: 'Email',
                  validator: (String? input) =>
                      input!.isValidEmail() ? null : "Invalid Email",
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 0),
                child: CustomTextFormField(
                  controller: passController,
                  hint: 'Password',
                  validator: (String? value) {
                    if (value!.length < 6) {
                      return 'Please enter min 6 digit password';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 30, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {}, child: const Text("Forget Password?"))
                  ],
                ),
              ),
              MaterialButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    signIn(context);
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: AppAssets.primaryColor,
                      // color: phoneController.text.isEmpty
                      //     ? themecolordark.withOpacity(0.6)
                      //     : passController.text.isEmpty
                      //         ? themecolordark.withOpacity(0.6)
                      //         : themecolordark,
                      borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  height: 52,
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "or",
                style: TextStyle(
                    color: Color(0xff746F6F), fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              MaterialButton(
                onPressed: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300] as Color)),
                  width: double.infinity,
                  height: 52,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 30,
                          width: 30,
                          child: Image.asset("images/google.png")),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Continuer with Google",
                        style: TextStyle(
                            color: Color(0xff746F6F),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Dont have an account?"),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UserInformation()),
                        );
                      },
                      child: const Text("Register now"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}
