import 'dart:developer';
import 'package:boxing/classes/custom_text.dart';
import 'package:boxing/classes/custom_textfield.dart';
import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/controller/controller.dart';
import 'package:boxing/global_var.dart';
import 'package:boxing/models/auth_models/signup_model.dart';
import 'package:boxing/screens/credential/loginpage.dart';
import 'package:boxing/terms.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  TextEditingController emailController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();
  ToastMessage toastMessage = ToastMessage();
  final _formKey2 = GlobalKey<FormState>();
  UserController userController = Get.find<UserController>();

/*  Future<void> signUp(context) async {

    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
      //log("${user.user} user added");
      if (userCredential != null) {
        try {

          await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          //  physics: NeverScrollableScrollPhysics(),
          child: Form(
            key: _formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const CustomTextWidget(
                    text: 'Create new account!',
                    textColor: AppAssets.primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                    hint: 'First Name', controller: fNameController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                    hint: 'Last Name', controller: lNameController),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hint: 'Phone',
                  controller: phoneController,
                  validator: (String? value) {
                    if (value!.length < 11) {
                      return 'Please enter your 11 digit phone number';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hint: 'Email',
                  controller: emailController,
                  validator: (String? input) =>
                      input!.isValidEmail() ? null : "Invalid Email",
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hint: 'Password',
                  obscureText: true,
                  controller: passController,
                  validator: (String? value) {
                    if (value!.length < 6) {
                      return 'Please enter min 6 digit password';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    if (_formKey2.currentState!.validate()) {
                    try{
                      SignupModel signupModel = SignupModel(
                        email: emailController.text.trim(),
                        password: passController.text.trim(),
                        roll_no: 3,
                        first_name: fNameController.text.trim(),
                        last_name: lNameController.text.trim(),
                       // phoneController: phoneController.text.trim(),

                      );
                      final res = await userController.userSignup(signupModel);
                      if(res.status == 200){
                        toastMessage.showToastMessage(res.message ?? "");
                        await locator.write('userId', res.data?.id);

                        Get.to(()=> TermsandConditions());
                      }
                      else if(res.message == 401){
                        toastMessage.showToastMessage(res.message ?? "");
                      }
                      else{
                        toastMessage.showToastMessage(res.message ?? "");
                      }
                    }catch(e){
                      toastMessage.showToastMessage("Something went wrong");
                    }

                     // signUp(context);
                    }
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: themecolordark,
                        borderRadius: BorderRadius.circular(10)),
                    width: MediaQuery.of(context).size.width,
                    height: 52,
                    child: const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
