import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/controller/controller.dart';
import 'package:boxing/global_var.dart';
import 'package:boxing/models/auth_models/logout_model.dart';
import 'package:boxing/screens/credential/loginpage.dart';
import 'package:boxing/screens/profile/fav_screen.dart';
import 'package:boxing/screens/profile/updateprofile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../constants/colors.dart';

class ProfilePage extends StatefulWidget {
  final String? userId;
  const ProfilePage({super.key,this.userId});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final profilePictureLocalStorage = locator.read('profilePicture');
  final username = locator.read('username');
  final email = locator.read('email');
  UserController userController = Get.find<UserController>();
  ToastMessage toastMessage = ToastMessage();

  @override
  void initState() {
    profilePictureLocalStorage;
    username;
    email;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              height: 40,
              color: themecolordark,
            ),
            Container(
              height: 220,
              decoration: BoxDecoration(
                  color: themecolordark,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "My Profile",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                         Padding(
                           padding: EdgeInsets.all(12.0),
                           child: Container(
                             height: 100,
                             width: 100,
                             decoration: BoxDecoration(
                                 color: AppAssets.primaryColor,
                                 borderRadius: BorderRadius.circular(70),
                                 image: profilePictureLocalStorage != null ? DecorationImage(
                                     image: NetworkImage(profilePictureLocalStorage)
                                    ,fit: BoxFit.cover ) : DecorationImage(image: AssetImage(
                                   "images/person.png"
                                 )),
                                 )
                             ),

                           ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  username ?? "Unknown",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  email ?? "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const UpdateProfile()),
                                  );
                                },
                                child: Container(
                                  height: 40,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: const Color(0xffFF0007),
                                      border: Border.all(
                                          color: Colors.white),
                                      borderRadius:
                                          BorderRadius.circular(12)),
                                  child: const Center(
                                      child: Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: (){
                Get.to(()=> FavScreen());
              },
              child: const ListTile(
                leading: Icon(Iconsax.heart),
                title: Text(
                  "Favourites",
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Divider(
                color: Colors.black12,
                thickness: 1,
              ),
            ),
            const ListTile(
              leading: Icon(Iconsax.card),
              title: Text("Ny Reminders"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
            const ListTile(
              leading: Icon(Iconsax.wallet),
              title: Text("My Discussions"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 40, right: 40),
              child: Divider(
                thickness: 1,
                color: Colors.black12,
              ),
            ),
            InkWell(
              onTap: (){
                locator.remove("profilePicture");
                toastMessage.showToastMessage("Cache clear");
              },
              child: const ListTile(
                leading: Icon(
                  Iconsax.profile_delete,
                ),
                title: Text(
                  "Clear Cache",
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ),
            InkWell(
              onTap: ()async{

                // FirebaseAuth.instance.signOut();

                final res = await userController.logoutUser();
              try{
                if(res.status == 200){
                  toastMessage.showToastMessage(res.message ?? "");
                 await locator.remove('userId');
                  Get.offAll(()=> LoginPage());
                }
                else{
                  toastMessage.showToastMessage(res.message ?? "");
                }
              }catch(e){
                toastMessage.showToastMessage("Something went wrong");
              }

              },
              child: const ListTile(
                leading: Icon(
                  Iconsax.logout,
                  color: Color(0xff38219f),
                ),
                title: Text("Log Out"),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
