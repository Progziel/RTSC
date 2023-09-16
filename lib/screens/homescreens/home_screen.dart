import 'package:boxing/classes/custom_button.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/global_var.dart';
import 'package:boxing/models/dashboard_models/live_matches_model.dart';
import 'package:boxing/screens/homescreens/fighter_detail_screen.dart';
import 'package:boxing/screens/homescreens/fightinfo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../api/api_constant.dart';
import '../../classes/custom_toast.dart';
import '../../controller/controller.dart';
import '../../models/dashboard_models/live_matches_body_model.dart';

class Homescreenpage extends StatefulWidget {
  const Homescreenpage({super.key});

  @override
  State<Homescreenpage> createState() => _HomescreenpageState();
}

class _HomescreenpageState extends State<Homescreenpage> {
  final profilePictureLocalStorage = locator.read('profilePicture');
  UserController userController = Get.find<UserController>();
 // List</*NewsFeedModel*/LiveMatchesBodyModel>? liveMatchesDashboard;

  List<LiveMatchesData> liveMatchesData = [];


  ToastMessage toastMessage = ToastMessage();
  String imgBaseUrl = 'http://192.168.1.120:8000';

  bool isDataLoaded = false; // Set to true when data is fetched


  Future<void> getLiveMatches()async{


    final response = await userController.liveMatchesData();
   try{
     if(response.status == 200){
       liveMatchesData = response.data ?? [];

       //toastMessage.showToastMessage("Ok");
       setState(() {
         isDataLoaded = true;

       });
     }
   }catch(e){
     toastMessage.showToastMessage('$e');
     print(e);
   }

  }

 /* Future<void> getLiveMatches()async{
    final res = await userController.liveMatches();
    print('res is ${res.status}');

    try{
      if(res.status == 200){
        print('res is ${res.status}');
      //  liveMatchesDashboard = res.;
      //  print("img url is ${liveMatchesDashboard?.first.t1Image}");
        setState(() {
        });
      }
    }catch(e){
      print("something went wrong in live match");
      toastMessage.showToastMessage("Something went wrong");
    }
  }*/

  @override
  void initState()  {
    // TODO: implement initState
    super.initState();
   getLiveMatches();

  //   filteredItems = category;

    // print("res is ${res?.status}");

  }

  int currentindex = 1;
  final PageController _pageController = PageController(
    initialPage: 1,
    viewportFraction: 0.8,
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
                      image: NetworkImage(profilePictureLocalStorage ??
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRudDbHeW2OobhX8E9fAY-ctpUAHeTNWfaqJA&usqp=CAU'),
                      fit: BoxFit.cover),
                )),
          ),
          actions: const [
            CircleAvatar(
              backgroundColor: Color(0xff414141),
              child: Icon(
                Icons.notification_add_rounded,
                color: Colors.white,
                size: 20,
              ),
            ),
            SizedBox(
              width: 15,
            ),
            // CircleAvatar(
            //   backgroundColor: Color(0xff414141),
            //   child: Icon(
            //     Icons.search,
            //     color: Colors.white,
            //     size: 20,
            //   ),
            // ),
            SizedBox(
              width: 15,
            ),
          ],
        ),
        backgroundColor: themeBackgroundcolor,
        body: SingleChildScrollView(
          child: Column(
            children: [




              Container(
                color: Colors.grey[100],
                height: Get.height * 0.8,
                child: Stack(
                  children: [
                    TopContainer(currentindex: currentindex),
                    SizedBox(
                      height: Get.height * 0.13,
                    ),
                  Positioned(
                      bottom: 10,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 250,
                       // color: Colors.red,
                        width: Get.width * 0.6,
                        child: PageView.builder(
                         //   shrinkWrap: true,
                          controller: _pageController,
                          itemCount: liveMatchesData.length ,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final match = liveMatchesData[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: isDataLoaded ? Container(
                                height: 300,
                                // width: 100,
                                decoration: BoxDecoration(
                                    color: themeBackgroundcolor,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: InkWell(
                                            onTap:(){
                                              Get.to(()=> FighterDetailScreen(playerId: match.matchLogPlayerID1,playerName: match.player1Name ?? "",playerImage: match.player1Image ?? "",playerWeight: match.player1WeightClass ?? ""));
                                            },
                                            child: Container(
                                              height: 100,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(12),
                                                ),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                    '$imgBaseUrl${match.player1Image ?? '' }',
                                                  ),fit: BoxFit.fill
                                                )
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: InkWell(
                                            onTap:(){
                                              Get.to(()=> FighterDetailScreen(playerId: match.matchLogPlayerID2,playerImage: match.player2Image ?? "",playerName: match.player2Name ?? "",playerWeight: match.player2WeightClass ?? "",));
                                            },
                                            child: Container(
                                              height: 100,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                    topRight: Radius.circular(12),
                                                  ),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                        '$imgBaseUrl${match.player2Image ?? '' }',
                                                      ),fit: BoxFit.fill
                                                  )
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                    Container(
                                      color: themecolordark,
                                      height: 30,
                                      child: Row(
                                        children: [
                                           Expanded(
                                            child: Center(
                                              child: Text(
                                                '${match.Player1TeamName ?? ''} ${match.matchLogPlayer1Score}',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 2, color: Colors.red)),
                                              child: const Center(
                                                child: Text(
                                                  "V/S",
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              child:  Center(
                                                child: Text(
                                                  '${match.Player2TeamName ?? ''} ${match.matchLogPlayer2Score}',
                                                  style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  //  const SizedBox(height: 10),
                                    Text(
                                      "${match.date ?? ''}",
                                      style: TextStyle(
                                          color: themecolordark, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${match.day ?? ''}",
                                      style: TextStyle(
                                          color: themecolordark, fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${match.time ?? ''}",
                                      style: TextStyle(
                                          color: themecolordark, fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20),
                                      child: CustomButton(
                                          buttonText: 'View Fight Info',
                                          onTap: () =>  /*getLiveMatches()*/Get.to(
                                            ()=>

                                           const fightinfopage(),
                                         //   transition: Transition.downToUp,
                                          )),
                                    )
                                  ],
                                ),
                              ) :
                              ShimmerMatchCard()
                            );
                          },
                        ),
                      )),
                    // BoxingMatchesSlider(pageController: _pageController,img:  '$imgBaseUrl${newsFeedItems ?? ""}')
                  ],
                ),
              ),
              //
              // const SizedBox(height: 50),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(22.0),
                    child: Text(
                      "All Matches",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
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
                      child: InkWell(
                        onTap: () {
                          Get.to(
                            const fightinfopage(),
                            transition: Transition.downToUp,
                          );
                        },
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
                      ),
                    );
                  }),
            ],
          ),
    ));
  }
}

class TopContainer extends StatelessWidget {
  const TopContainer({
    super.key,
    required this.currentindex,
  });

  final int currentindex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.55,
      width: MediaQuery.of(context).size.width,
      color: themecolordark,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 20),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  size: 30,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "7 February , 2024",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
                          color: currentindex == index ? themebluecolor : null,
                          borderRadius: BorderRadius.circular(12)),
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
                "Live Matches",
                style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ShimmerMatchCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}