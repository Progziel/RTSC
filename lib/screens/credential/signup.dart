import 'dart:developer';
import 'package:boxing/classes/custom_text.dart';
import 'package:boxing/classes/custom_textfield.dart';
import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/global_var.dart';
import 'package:boxing/models/user_model.dart';
import 'package:boxing/screens/credential/loginpage.dart';
import 'package:boxing/terms.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  Future<void> signUp(context) async {
    // UserModel newUser = UserModel(
    //     firstName: fNameController.text,
    //     lastName: lNameController.text,
    //     email: emailController.text,
    //     uid: ,
    //     phone: phoneController.text);


    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );
      //log("${user.user} user added");
      if (userCredential != null) {
        try {

          // final userExists = await _checkUserExists(user.user!.uid);
          // if (userExists) {
          //   await docRef.doc().delete();
          // }

          await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid/*user.user!.uid*/).set({
            "uid": userCredential.user!.uid,
            "email": userCredential.user!.email,
            "firstName": fNameController.text,
            "lastName": lNameController.text,
            "phone": phoneController.text,
            "profilePicture": ""
          }).then((value) => log('User added successfully')).catchError((error)=> log('Something went wrong'));

          await locator.write('userId', userCredential.user?.uid);

          toastMessage.showToastMessage('User added successfully');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  TermsandConditions(userId: userCredential.user?.uid)),
          );
        } on FirebaseAuthException catch (e) {
          toastMessage.showToastMessage(e.code);

        }
       // log("saved user ${userCredential.user!.email}");
      }
    } on FirebaseAuthException catch (e) {
      toastMessage.showToastMessage(e.code);
    }
  }
// Future<bool> _checkUserExists(String uid) async {
//   final userDocs = await FirebaseFirestore.instance.collection('users').get();
//
//   final emailsToDelete = userDocs.docs.where((doc) => doc.data()['email'] == emailController.text.trim()).toList();
//   if (emailsToDelete.isNotEmpty) {
//     for (var doc in emailsToDelete) {
//       await doc.reference.delete();
//       print('User document deleted');
//     }
//     return true;
//   }
//
//   print('${emailsToDelete.length} user documents deleted');
//   return true;
// }

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
                CustomPassTextFormField(
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
                  onTap: () {
                    if (_formKey2.currentState!.validate()) {
                      signUp(context);
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
