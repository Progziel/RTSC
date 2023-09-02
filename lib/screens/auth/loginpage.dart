import 'package:boxing/constants/colors.dart';
import 'package:boxing/screens/authentication/userinformation.dart';
import 'package:boxing/screens/homescreens/loginpage.dart';
import 'package:boxing/terms.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController telephonecontroller = TextEditingController();
  TextEditingController confirmtelephonecontroller = TextEditingController();
  bool showpassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
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
              child: TextField(
                onChanged: (c) {
                  setState(() {});
                },
                controller: telephonecontroller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black38, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter Email",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 20, bottom: 0),
              child: TextField(
                onChanged: (c) {
                  setState(() {});
                },
                controller: confirmtelephonecontroller,
                obscureText: showpassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showpassword = !showpassword;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye_outlined)),
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black38, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: "Enter Password",
                  labelStyle:
                      const TextStyle(color: Colors.black, fontSize: 15),
                ),
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
                if (telephonecontroller.text.isNotEmpty &&
                    confirmtelephonecontroller.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TermsandConditions()),
                  );
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    color: telephonecontroller.text.isEmpty
                        ? themecolordark.withOpacity(0.6)
                        : confirmtelephonecontroller.text.isEmpty
                            ? themecolordark.withOpacity(0.6)
                            : themecolordark,
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
    );
  }
}
