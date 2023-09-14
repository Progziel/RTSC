import 'dart:io';

import 'package:boxing/classes/custom_button.dart';
import 'package:boxing/classes/custom_text.dart';
import 'package:boxing/classes/custom_textfield.dart';
import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/controller/controller.dart';
import 'package:boxing/global_var.dart';
import 'package:boxing/models/profile/update_profile_model.dart';
import 'package:boxing/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ToastMessage toastMessage = ToastMessage();
  final ImagePicker picker = ImagePicker();
  UserController userController = Get.find<UserController>();
  final profilePictureLocalStorage = locator.read('profilePicture');

  String? getImage;

  Future<void> getData() async {
    final res = await userController.getProfile();
    try {
      if (res.status == 200) {
        //   getImage = res.data?.image ?? "";
        fnameController =
            TextEditingController(text: "${res.user?.first_name}");
        lnameController = TextEditingController(text: res.user?.last_name);
        phoneController = TextEditingController(text: res.user?.phone);
        emailController = TextEditingController(text: res.user?.email);
        addressController = TextEditingController(text: res.user?.address);
        //addressController = TextEditingController(text: res.data!.address);
        userController.loading.value = false;
        setState(() {});
      } else {
        userController.loading.value = true;
        toastMessage.showToastMessage(res.message ?? "");
      }
    } catch (e) {
      print('error in profile screen is : $e');
      toastMessage.showToastMessage('Something went wrong.');
    }
  }


  /* Future<SetProfileImageBodyModel?> setProfileImage() async {
    final image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      userController.image.value = image;
      final value = await userController.setProfileImage(
        widget.customerId,
        File(image.path),
      );
      try {
        if (value.status == 200) {
          snackBarWidget(value.message);
        } else {
          snackBarWidget(value.message);
        }
      } catch (e) {
        snackBarWidget('Something went wrong.');
      }
      return value;
    }
    return null;
  }
*/
  @override
  void initState() {
    super.initState();
    getData();
    /*fetchUserData();
    profilePictureLocalStorage;*/
  }

/*
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

*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeBackgroundcolor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: themecolordark,
          actions: [
          InkWell(
              onTap: ()async{
                UpdateProfileModel updateProfile = UpdateProfileModel(
                  first_name: fnameController.text,
                  last_name: lnameController.text,
                  address: addressController.text
                );
                final res = await userController.updateProfile(updateProfile);
               try{
                 if(res.status == 200){
                   toastMessage.showToastMessage(res.message ?? "");
                 }
                 else{
                   toastMessage.showToastMessage(res.message ?? "");

                 }
               }catch(e){
                 toastMessage.showToastMessage('Something went wrong');
               }
              },
              /*onTap: () async {
                UpdateProfileModel updateProfile = UpdateProfileModel(
                    first_name: fnameController.text.trim(),
                    last_name: lnameController.text.trim(),
                    address: addressController.text.trim(),
                );
                final response =
                await userController.updateProfile(updateProfile);
                try {
                  if (response.status == 200) {
                    toastMessage.showToastMessage(response.message ?? "");
                    *//*Get.offAll(() => Dashboard(
                                  customerId: widget.customerId,
                                ));*//*
                  } else {
                    toastMessage.showToastMessage(response.message ?? "");
                  }
                } catch (e) {
                  toastMessage.showToastMessage('Something went wrong');
                }
              },*/
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppAssets.primaryColor
                    ),
                    child: CustomTextWidget(text: "Update",fontSize: 15,fontWeight: FontWeight.w600,textColor: Colors.white)),
              )),
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
        body: /*userData == null
          ? Center(child: CircularProgressIndicator())
          :*/
            Obx(() => userController.loading.value == false
                ? ListView(
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
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              /*profilePictureLocalStorage ?? (latestProfile?.isNotEmpty ?? false
                                  ? latestProfile ?? ""
                                  : */
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRudDbHeW2OobhX8E9fAY-ctpUAHeTNWfaqJA&usqp=CAU' /*)*/
                                              ),
                                          fit: BoxFit.cover)),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {
                                        //   setProfilePicturePath();
                                      },
                                      child: const CircleAvatar(
                                        radius: 20,
                                        backgroundColor: AppAssets.themeColor,
                                        child: Icon(
                                          Icons.cameraswitch_outlined,
                                          color: AppAssets.backgroundColor,
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
                      const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(
                              "Your Informations",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                            height: 50,
                            child: CustomTextFormField(
                              hint: "First Name",
                              label: 'First Name',
                              controller: fnameController,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                            height: 50,
                            child: CustomTextFormField(
                              hint: "Last Name",
                              label: 'Last Name',
                              controller: lnameController,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                            height: 50,
                            child: CustomTextFormField(
                              hint: "Phone",
                              label: 'Phone',
                              controller: phoneController,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                            height: 50,
                            child: CustomTextFormField(
                              label: 'Email',
                              hint: "Email",
                              controller: emailController,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: SizedBox(
                            height: 50,
                            child: CustomTextFormField(
                              label: 'Address',
                              hint: "Address",
                              controller: addressController,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: CustomButton(buttonText: "Change Password?", onTap: (){}),
                      )
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  )));
  }
}
