import 'dart:async';
import 'dart:convert';
import 'dart:math' as math;

import 'package:boxing/classes/custom_button.dart';
import 'package:boxing/classes/custom_text.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/global_var.dart';
import 'package:boxing/models/dashboard_models/all_matches_body_model.dart';
import 'package:boxing/models/dashboard_models/live_matches_model.dart';
import 'package:boxing/screens/homescreens/fighter_detail_screen.dart';
import 'package:boxing/screens/homescreens/fightinfo.dart';
import 'package:boxing/screens/homescreens/notification_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:ticker_text/ticker_text.dart';

import '../../api/api_constant.dart';
import '../../classes/custom_toast.dart';
import '../../controller/controller.dart';
import '../../models/dashboard_models/live_matches_body_model.dart';
import '../../models/dashboard_models/ticker_live_update_body_model.dart';

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

  bool isDataLoaded = false;
  AnimationController? animationController;
  List<AllMatchesModel> allMatchesModel = [];
// Set to true when data is fetched

  String? currentNews;
  int textIndex = 0;
  List<LiveUpdateModel> newsList = [];
  TickerTextController tickerTextController =
      TickerTextController(autoStart: true);
  String? formattedData;
  Future<void> getLiveUpdates() async {
    final response = await userController.liveUpdate();
    try {
      if (response.status == 200) {
        newsList = response.data ?? [];
        //toastMessage.showToastMessage("Ok");
        setState(() {
          currentNews = response.data?.first.update_text ?? "";
          Map<String, dynamic> data = json.decode(currentNews ?? "");

          formattedData = data.entries.map((entry) {
            return '${entry.key}: ${entry.value}';
          }).join(', ');
          print("//////${formattedData}");
        });
      } else {
        toastMessage.showToastMessage(response.message ?? "");
      }
    } catch (e) {
      toastMessage.showToastMessage('$e');
      print(e);
    }
  }

  ///

  Future<void> getLiveMatches() async {
    final response = await userController.liveMatchesData();
    try {
      if (response.status == 200) {
        liveMatchesData = response.data ?? [];

        //toastMessage.showToastMessage("Ok");
        setState(() {
          isDataLoaded = true;
        });
      }
    } catch (e) {
      toastMessage.showToastMessage('$e');
      print(e);
    }
  }

  Future<void> getAllMatchesList() async {
    final response = await userController.allMatches();
    try {
      if (response.status == 200) {
        allMatchesModel = response.data ?? [];
        setState(() {

        });
      } else {
        toastMessage.showToastMessage(response.message ?? "");
      }
    } catch (e) {
      toastMessage.showToastMessage("Something went wrong");
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
  void addToWishlist(AllMatchesModel allMatch) {
    userController.addToWishList(allMatch);
  }
  void removeFromWishlist(AllMatchesModel allMatch) {
    userController.removeFromWishList(allMatch);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
      const Duration(milliseconds: 1),
      () {
        tickerTextController.startScroll();
        // print(_tickerTextController.started);
      },
    );
    getLiveMatches();
    getLiveUpdates();
    getAllMatchesList();
    profilePictureLocalStorage;

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
                  image: profilePictureLocalStorage != null
                      ? DecorationImage(
                          image: NetworkImage(profilePictureLocalStorage ),
                          fit: BoxFit.cover)
                      : DecorationImage(image: AssetImage("images/person.png")),
                )),
          ),
          actions: [
            InkWell(
              onTap: () {
                Get.to(() => NotificationScreen());
              },
              child: CircleAvatar(
                backgroundColor: Color(0xff414141),
                child: Icon(
                  Icons.notification_add_rounded,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            SizedBox(
              width: 5,
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
        body: newsList.isNotEmpty || liveMatchesData.isNotEmpty
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: Get.width,
                      color: AppAssets.primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TickerText(
                          controller: tickerTextController,
                          child: CustomTextWidget(
                              text: formattedData ?? "",
                              textColor: Colors.white),
                        ),
                      ),
                    ),
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
                                height: Get.height * 0.47,
                                // color: Colors.red,
                                width: Get.width * 0.6,
                                child: PageView.builder(
                                  //   shrinkWrap: true,
                                  controller: _pageController,
                                  itemCount: liveMatchesData.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final match = liveMatchesData[index];
                                    return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: isDataLoaded
                                            ? Container(
                                                // height: Get.height * 0.4,
                                                // width: 100,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey[300],
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12)),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              Get.to(() => FighterDetailScreen(
                                                                  playerId: match
                                                                      .matchLogPlayerID1,
                                                                  playerName:
                                                                      match.player1Name ??
                                                                          "",
                                                                  playerImage:
                                                                      match.player1Image ??
                                                                          "",
                                                                  status: match
                                                                      .status,
                                                                  playerScore: match
                                                                      .matchLogPlayer2Score,
                                                                  playerWeight:
                                                                      match.player1WeightClass ??
                                                                          ""));
                                                            },
                                                            child: Container(
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topLeft:
                                                                            Radius.circular(12),
                                                                      ),
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(
                                                                            '$imgBaseUrl${match.player1Image ?? ''}',
                                                                          ),
                                                                          fit: BoxFit.fill)),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: InkWell(
                                                            onTap: () {
                                                              Get.to(() => FighterDetailScreen(
                                                                  playerId: match
                                                                      .matchLogPlayerID2,
                                                                  playerImage:
                                                                      match.player2Image ??
                                                                          "",
                                                                  playerName:
                                                                      match.player2Name ??
                                                                          "",
                                                                  playerWeight:
                                                                      match.player2WeightClass ??
                                                                          "",
                                                                  playerScore: match
                                                                      .matchLogPlayer2Score,
                                                                  status: match
                                                                      .status));
                                                            },
                                                            child: Container(
                                                              height: 100,
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        topRight:
                                                                            Radius.circular(12),
                                                                      ),
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(
                                                                            '$imgBaseUrl${match.player2Image ?? ''}',
                                                                          ),
                                                                          fit: BoxFit.fill)),
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
                                                              child:
                                                                  CustomTextWidget(
                                                                text:
                                                                    '${match.Player1TeamName}',
                                                                textColor:
                                                                    Colors
                                                                        .white,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width: 2,
                                                                      color: Colors
                                                                          .red)),
                                                              child:
                                                                  const Center(
                                                                child: Text(
                                                                  "V/S",
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              child: Center(
                                                                child:
                                                                    CustomTextWidget(
                                                                  text:
                                                                      '${match.Player2TeamName ?? ''}',
                                                                  textColor:
                                                                      Colors
                                                                          .white,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      color: themecolordark,
                                                      height: 30,
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Center(
                                                              child: Text(
                                                                ' ${match.matchLogPlayer1Score}',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              child: Center(
                                                                child: Text(
                                                                  ' ${match.matchLogPlayer2Score}',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: Colors
                                                                          .white),
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
                                                          color: themecolordark,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "${match.day ?? ''}",
                                                      style: TextStyle(
                                                          color: themecolordark,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                      "${match.time ?? ''}",
                                                      style: TextStyle(
                                                          color: themecolordark,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    const SizedBox(height: 5),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 20),
                                                      child: CustomButton(
                                                          buttonText:
                                                              'View Fight Info',
                                                          onTap:
                                                              () => /*getLiveMatches()*/
                                                                  Get.to(
                                                                    () => fightinfopage(
                                                                        allMatchApi:
                                                                            false,
                                                                        liveMatch:
                                                                            match),
                                                                    //   transition: Transition.downToUp,
                                                                  )),

                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    )
                                                  ],
                                                ),
                                              )
                                            : ShimmerMatchCard());
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                        padding: EdgeInsets.all(0),
                        itemCount: allMatchesModel.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final match = allMatchesModel[index];
                          final isFavorite = userController.isFavorite(match);
                          return Padding(
                            padding: EdgeInsets.only(
                                top: 4, bottom: 4, left: 15, right: 15),
                            child: InkWell(
                              onTap: () {
                                Get.to(
                                  fightinfopage(
                                      allMatchesModel: match,
                                      allMatchApi: true),
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
                                                trailing: CustomTextWidget(
                                                    text: match
                                                            .matchLogPlayer1Score ??
                                                        ""),
                                                leading: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Image.network(
                                                      "$imgBaseUrl${match.player1Image}",
                                                      fit: BoxFit.cover),
                                                ),
                                                title: CustomTextWidget(
                                                  text: match.player1Name ?? "",
                                                ),
                                              ),
                                              ListTile(
                                                trailing: CustomTextWidget(
                                                  text: match
                                                          .matchLogPlayer2Score ??
                                                      "",
                                                ),
                                                leading: Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color: Colors.amber,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              12)),
                                                  child: Image.network(
                                                      "$imgBaseUrl${match.player2Image}",
                                                      fit: BoxFit.cover),
                                                ),
                                                title: CustomTextWidget(
                                                    text: match.player2Name ??
                                                        ""),
                                              )
                                            ],
                                          ),
                                        )),
                                    Expanded(
                                        flex: 3,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                if (isFavorite) {
                                                  userController.removeFromWishList(match);
                                                  toastMessage.showToastMessage("Remove from favorite list");
                                                } else {
                                                  userController.addToWishList(match);
                                                  toastMessage.showToastMessage("Add to your favorite list");
                                                }
                                                setState(() {

                                                });
                                              },
                                              child: Container(
                                                child: Icon(
                                                  isFavorite
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,
                                                  color: isFavorite
                                                      ? AppAssets.primaryColor
                                                      : AppAssets.themeColor,
                                                ),
                                              ),
                                            ),
                                           Text(
                                                match.matchLogCategoriesID ??
                                                    "",
                                                maxLines: 2,
                                                softWrap: true,
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: AppAssets
                                                        .primaryColor,
                                                    overflow: TextOverflow
                                                        .ellipsis)),
                                            CustomTextWidget(
                                              text: match.date ?? "",
                                              textColor: Colors.grey,
                                            )
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              )
            : SpinKitSquareCircle(
                controller: animationController,
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

class SpinKitSquareCircle extends StatefulWidget {
  const SpinKitSquareCircle({
    Key? key,
    this.color,
    this.size = 50.0,
    this.duration = const Duration(milliseconds: 500),
    this.controller,
  }) : super(key: key);

  final Color? color;
  final double size;
  final Duration duration;
  final AnimationController? controller;

  @override
  State<SpinKitSquareCircle> createState() => _SpinKitSquareCircleState();
}

class _SpinKitSquareCircleState extends State<SpinKitSquareCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animationCurve;
  late Animation<double> _animationSize;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(vsync: this, duration: widget.duration))
      ..addListener(() {
        if (mounted) {
          setState(() {});
        }
      })
      ..repeat(reverse: true);
    final animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutCubic,
    );
    _animationCurve = Tween(begin: 1.0, end: 0.0).animate(animation);
    _animationSize = Tween(begin: 0.5, end: 1.0).animate(animation);
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final sizeValue = widget.size * _animationSize.value;
    return Center(
      child: Transform(
        transform: Matrix4.identity()..rotateZ(_animationCurve.value * math.pi),
        alignment: FractionalOffset.center,
        child: SizedBox.fromSize(
          size: Size.square(sizeValue),
          child: _itemBuilder(0, 0.5 * sizeValue * _animationCurve.value),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index, double curveValue) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: AppAssets.primaryColor,
        borderRadius: BorderRadius.all(Radius.circular(curveValue)),
      ),
    );
  }
}
