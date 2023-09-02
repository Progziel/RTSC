import 'package:boxing/screens/profile/updateprofile.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      children: [
                        const Expanded(
                          flex: 5,
                          child: Padding(
                            padding: EdgeInsets.all(12.0),
                            child: Stack(
                              children: [
                                CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsbmLFM5VeA0TGOre8j8ZGquHbKH8oQLQruQ&usqp=CAU"),
                                ),
                                Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        Icons.camera,
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Alex Nick",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(0.0),
                                  child: Row(
                                    children: [
                                      Text(
                                        "AlexNick@gmail.com",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Row(
                                    children: [
                                      MaterialButton(
                                        onPressed: () {
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
                                    ],
                                  ),
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              leading: Icon(Iconsax.heart),
              title: Text(
                "Favourites",
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 15,
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
            const ListTile(
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
            const ListTile(
              leading: Icon(
                Iconsax.logout,
                color: Color(0xffFF0007),
              ),
              title: Text("Log Out"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
