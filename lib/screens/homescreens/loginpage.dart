import 'package:boxing/constants/colors.dart';
import 'package:boxing/global_var.dart';
import 'package:boxing/screens/homescreens/fightinfo.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Homescreenpage extends StatefulWidget {
  const Homescreenpage({super.key});

  @override
  State<Homescreenpage> createState() => _HomescreenpageState();
}

class _HomescreenpageState extends State<Homescreenpage> {
  final profilePictureLocalStorage = locator.read('profilePicture');

  int currentindex = 1;
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.8, // Adjust the fraction as desired
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppAssets.themeColor,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: AppAssets.primaryColor,
                borderRadius: BorderRadius.circular(70),
                image: DecorationImage(
                    image: NetworkImage( profilePictureLocalStorage ??
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRudDbHeW2OobhX8E9fAY-ctpUAHeTNWfaqJA&usqp=CAU')
                    ,fit: BoxFit.cover ),
              )
          ),
        ),
          actions: [
            CircleAvatar(
              backgroundColor: Color(0xff414141),
              child: Icon(
                Iconsax.notification,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            CircleAvatar(
              backgroundColor: Color(0xff414141),
              child: Icon(
                Iconsax.search_favorite,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(
              width: 15,
            ),
          ],


      ),
        backgroundColor: themeBackgroundcolor,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [

                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.1,
                  width: MediaQuery.of(context).size.width,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height / 2.1,
                        width: MediaQuery.of(context).size.width,
                        color: themecolordark,
                        child: Column(
                          children: [


                            const Padding(
                              padding: EdgeInsets.only(left: 15, top: 20),
                              child: Row(
                                children: [
                                  Icon(
                                    Iconsax.calendar,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "7 February , 2024",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              height: 90,
                              child: ListView.builder(
                                  padding: const EdgeInsets.all(0),
                                  shrinkWrap: true,
                                  itemCount: 31,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    int newiindex = index + 10;
                                    return Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: currentindex == index
                                                ? themebluecolor
                                                : null,
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        width: 60,
                                        height: 60,
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              index.isEven ? "Sun" : "Mon",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: currentindex == index
                                                      ? Colors.white
                                                      : Colors.grey),
                                            ),
                                            Text(
                                              newiindex.toString(),
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: currentindex == index
                                                      ? Colors.white
                                                      : Colors.grey),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              children: [
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Live Matchess",
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Positioned(
                          bottom: -180,
                          left: 0,
                          right: 0,
                          child: SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.width,
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: 3,
                              physics:
                                  const BouncingScrollPhysics(), // Specify page scrolling physics (optional)
                              scrollDirection: Axis
                                  .horizontal, // Set the page scrolling direction (optional)
                              pageSnapping:
                                  true, // Enable page snapping (optional)
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const fightinfopage()),
                                      );
                                    },
                                    child: Container(
                                      height: 300,
                                      width: 200,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              SizedBox(
                                                height: 120,
                                                width: 272,
                                                child: Image.asset(
                                                  "images/match.png",
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            ],
                                          ),
                                          Container(
                                            color: themecolordark,
                                            height: 30,
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    child: const Center(
                                                      child: Text(
                                                        "17-0-0",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            width: 2,
                                                            color: Colors.red)),
                                                    child: const Center(
                                                      child: Text(
                                                        "Records",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                    child: const Center(
                                                      child: Text(
                                                        "17-0-0",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "Saturday July 15,2023",
                                            style: TextStyle(
                                                color: themecolordark,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "Estimated Ringkwak : Sunday",
                                            style: TextStyle(
                                                color: themecolordark,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            "8:30 PM (Asia/Karachi)",
                                            style: TextStyle(
                                                color: themecolordark,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const fightinfopage()),
                                              );
                                            },
                                            child: Container(
                                              height: 50,
                                              width: 250,
                                              decoration: BoxDecoration(
                                                  color: themepickcolor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20)),
                                              child: const Center(
                                                child: Text(
                                                  "View Fight Info",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 180,
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Text(
                        "All Matches",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: 5,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            top: 4, bottom: 4, left: 15, right: 15),
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15)),
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 9,
                                  child: Container(
                                    child: Column(
                                      children: [
                                        ListTile(
                                          trailing: const Text("17-0-0"),
                                          leading: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7-S_UbPA-Jltgdgj0CmRY7g7z9bu_fpQCgg&usqp=CAU"),
                                          ),
                                          title: const Text(
                                            "Martin (UD 10)",
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green),
                                          ),
                                        ),
                                        ListTile(
                                          trailing: const Text("17-0-0"),
                                          leading: Container(
                                            height: 40,
                                            width: 40,
                                            decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: Image.network(
                                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAESGD2z3L-PicAB0vDqQZhYbUw-ETj8b6dg&usqp=CAU"),
                                          ),
                                          title: const Text(
                                            "Haruty (UD 10)",
                                            style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                              Expanded(
                                  flex: 3,
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "FT",
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: themepickcolor,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const Text(
                                          "16 Feb 2023",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      );
                    }),
                Container(
                  height: 100,
                )
              ],
            ),
          ),
        ));
  }
}
