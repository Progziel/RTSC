import 'dart:io';

import 'package:boxing/classes/custom_textfield.dart';
import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/global_var.dart';
import 'package:boxing/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  UserModel? userData;
  final uId = locator.read('userId');
  TextEditingController fnameController = TextEditingController();
  TextEditingController lnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  ToastMessage toastMessage = ToastMessage();
  final ImagePicker picker = ImagePicker();
  String? latestProfile;
  final profilePictureLocalStorage = locator.read('profilePicture');

  @override
  void initState() {
    super.initState();
    fetchUserData();
    profilePictureLocalStorage;
    // userData?.profilePicture;
  }

  void fetchUserData() async {
    UserModel? data = await getUserData(uId);
    if (data != null) {
      userData = data;
      fnameController = TextEditingController(text: userData?.firstName);
      lnameController = TextEditingController(text: userData?.lastName);
      phoneController = TextEditingController(text: userData?.phone);
      emailController = TextEditingController(text: userData?.email);
      latestProfile = userData?.profilePicture ?? ""; // Set latestProfile here
      //     userData?.profilePicture = latestProfile;
      setState(() {});
      //   userData?.profilePicture = data.profilePicture ;
      // userData?.profilePicture;

      // setState(() {
      //   });
    }
  }

  void updateProfile() async {
    try {
      await FirebaseFirestore.instance.collection('users').doc(uId).update({
        'firstName': fnameController.text,
        'lastName': lnameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'profilePicture': latestProfile ?? ""
      });
      // fetchUserData();

      //setProfilePicturePath();
      toastMessage.showToastMessage('Profile updated');
    } on FirebaseException catch (e) {
      toastMessage.showToastMessage(e.code);
    }
  }

  void updateProfilePicture(String profilePicture) {
    userData?.profilePicture = profilePicture;

    // updateProfile();
    setState(() {});
  }

  Future<void> setProfilePicturePath() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      String uid = uId; // Assuming you have access to the user's UID
      String fileName = 'profilePictures/$uid.jpg';

      try {
        await FirebaseStorage.instance.ref(fileName).putFile(imageFile);
        latestProfile =
            await FirebaseStorage.instance.ref(fileName).getDownloadURL();
        await locator.write('profilePicture', latestProfile);
        // Call setState to trigger a rebuild with the updated latestProfile
        setState(() {});

        updateProfilePicture(latestProfile ?? "");
      } on FirebaseException catch (e) {
        toastMessage.showToastMessage(e.code);
      }
    }
  }

/*  Future<void> setProfilePicturePath() async {
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      File imageFile = File(pickedImage.path);
      String uid = uId; // Assuming you have access to the user's UID
      String fileName = 'profilePictures/$uid.jpg';

      try {
        await FirebaseStorage.instance.ref(fileName).putFile(imageFile);
        latestProfile =
            await FirebaseStorage.instance.ref(fileName).getDownloadURL();

        // downloadUrl = userData.profilePicture;
        updateProfilePicture(latestProfile ?? "");
        setState(() {});
      } on FirebaseException catch (e) {
        toastMessage.showToastMessage(e.code);
      }

      //updateProfilePicture(imageFile.toString());
      // Now you can upload or display the picked image
      // For example, you can call _updateProfilePicture(imageFile) to update the profile picture
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeBackgroundcolor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themecolordark,
        actions: [
          IconButton(
              onPressed: () async {
                updateProfile();
                //  Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
                size: 30,
              ))
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: userData == null
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: AppAssets.primaryColor,
                                borderRadius: BorderRadius.circular(50),
                                image: DecorationImage(
                                  image: NetworkImage( profilePictureLocalStorage ?? (latestProfile?.isNotEmpty ?? false
                                      ? latestProfile ?? ""
                                      : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRudDbHeW2OobhX8E9fAY-ctpUAHeTNWfaqJA&usqp=CAU')
                                  ),fit: BoxFit.cover
                                )
                              ),

                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: InkWell(
                                  onTap: () {
                                    setProfilePicturePath();
                                  },
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: AppAssets.themeColor,
                                    child: Icon(
                                      Icons.cameraswitch_outlined,color: AppAssets.backgroundColor,
                                    ),
                                  ),
                                ))
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: const [
                        Text(
                          "Your Informations",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: SizedBox(
                        height: 50,
                        child: CustomTextFormField(
                          hint: "First Name",
                          label: 'First Name',
                          controller: fnameController,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: SizedBox(
                        height: 50,
                        child: CustomTextFormField(
hint: "Last Name",
                          label: 'Last Name',
                          controller: lnameController,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: SizedBox(
                        height: 50,
                        child: CustomTextFormField(
                          hint: "Phone",
                          label: 'Phone',
                          controller: phoneController,
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: SizedBox(
                        height: 50,
                        child: CustomTextFormField(
                          label: 'Email',
                          hint: "Email",
                          controller: emailController,
                        )),
                  ),

                ],
              ),
            ),
    );
  }
}
