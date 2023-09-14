import 'package:boxing/classes/custom_text.dart';
import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/controller/controller.dart';
import 'package:boxing/models/dashboard_models/search_filter_body_model.dart';
import 'package:boxing/models/dashboard_models/search_filter_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../classes/custom_button.dart';

class NewsArticlesPage extends StatefulWidget {
  const NewsArticlesPage({super.key});

  @override
  State<NewsArticlesPage> createState() => _NewsArticlesPageState();
}

class _NewsArticlesPageState extends State<NewsArticlesPage> {
  String imgBaseUrl = 'http://192.168.1.113:8000';

  SearchFilerBodyModel? res;
  ToastMessage toastMessage = ToastMessage();
  UserController userController = Get.find<UserController>();
  List<CategoriesList> filteredItems = [];
  TextEditingController _searchController = TextEditingController();

  int selectedIdx = -1;
  List<CategoriesList> category = [
    CategoriesList(name: "Lightweight"),
    CategoriesList(name: "WelterWeight"),
    CategoriesList(name: "Light Welterweight"),
    CategoriesList(name: "Super Middlewright"),
    CategoriesList(name: "Light Middleweight"),
    CategoriesList(name: "Super Flyweight"),
    CategoriesList(name: "Heavyweight"),
    CategoriesList(name: "Middleweight"),
    CategoriesList(name: "Super Featherweight"),
    CategoriesList(name: "Bantamweight"),
  ];

  void _filterSearchResults(String query) {
    List<CategoriesList> searchResults = category
        .where((item) =>
        item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      filteredItems = searchResults;
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      filteredItems = category;

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeBackgroundcolor,
      body: WillPopScope(
        onWillPop: () async {
          // Unfocus the text field when the back button is pressed.
          _searchController.clear();
          FocusScope.of(context).unfocus();
          return true; // Allow the back button press.
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 40,
                color: themecolordark,
              ),
              Container(
                height: 200,
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
                            "Article & News",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: TextField(
                        controller: _searchController,
                        onTap: () {
                          _filterSearchResults(_searchController.text);
                        },
                        onChanged: (query) {
                          _filterSearchResults(query);
                        },
                        decoration: InputDecoration(
                            fillColor: themeBackgroundcolor.withOpacity(0.1),
                            filled: true,
                            hintText: "Search all articles",
                            contentPadding: const EdgeInsets.only(
                                left: 15, right: 15, top: 15, bottom: 15),
                            suffixIcon: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Iconsax.search_normal,
                                  color: const Color(0xffFF0007),
                                )),
                            hintStyle: const TextStyle(color: Colors.white38),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: themeBackgroundcolor.withOpacity(0.1),
                                )),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  color: themeBackgroundcolor.withOpacity(0.1),
                                ))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, top: 10),
                      child: SizedBox(
                        height: 50,
                        child: ListView.builder(
                            itemCount: filteredItems.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: InkWell(
                                  onTap: ()async{
                                    SearchFilterModel searchFilter = SearchFilterModel(
                                      categories:filteredItems[index].name
                                    );
                                     res = await userController.search(searchFilter);
                                  try{
                                    if(res?.status == 200){
                                      toastMessage.showToastMessage(res?.message ?? "");
                                    }
                                    else{
                                      toastMessage.showToastMessage(res?.message ?? "");
                                    }
                                  }catch(e){
                                    toastMessage.showToastMessage("Something went wrong");
                                  }

                                    setState(() {
                                      selectedIdx = index;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: index == selectedIdx ? AppAssets.primaryColor : null,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    height: 40,
                                    child: Center(
                                      child: CustomTextWidget(
                                       text: filteredItems[index].name,textColor: Colors.white,

                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
  if (res?.status ==
      200) // Display data when the response status is 200.
    Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
          color: themeBackgroundcolor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                            '${imgBaseUrl}${res?.data?[0].t1_image ?? ''}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                            '${imgBaseUrl}${res?.data?[0].t2_image ?? ''}'),
                        fit: BoxFit.fill,
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
                        '${res?.data?[0].t1_team_name ?? ''} ${res?.data?[0].t1_score}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.red,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "V/S",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: Center(
                        child: Text(
                          '${res?.data?[0].t2_team_name ?? ''} ${res?.data?[0].t2_score}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              "${res?.data?[0].date ?? ''}",
              style: TextStyle(
                color: themecolordark,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${res?.data?[0].day ?? ''}",
              style: TextStyle(
                color: themecolordark,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${res?.data?[0].time ?? ''}",
              style: TextStyle(
                color: themecolordark,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: CustomButton(
                buttonText: 'View Fight Info',
                onTap: () {
                  // Handle the button tap action here.
                },
              ),
            ),
          ],
        ),
      ),
    ),

              // SizedBox(
              //   height: 250,
              //   child: ListView.builder(
              //       shrinkWrap: true,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return Padding(
              //           padding: const EdgeInsets.only(left: 8, right: 8),
              //           child: SizedBox(
              //             height: 300,
              //             width: MediaQuery.of(context).size.width - 60,
              //             child: Column(
              //               children: [
              //                 const Text(
              //                   "Robertson: We let the fans down.",
              //                   style: TextStyle(
              //                       fontWeight: FontWeight.bold, fontSize: 18),
              //                 ),
              //                 const Row(
              //                   children: [
              //                     SizedBox(
              //                       width: 7,
              //                     ),
              //                     Text(
              //                       "Klopp: We will not fall apart",
              //                       textAlign: TextAlign.start,
              //                       style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           fontSize: 18),
              //                     ),
              //                   ],
              //                 ),
              //                 const SizedBox(
              //                   height: 5,
              //                 ),
              //                 const Row(
              //                   children: [
              //                     SizedBox(
              //                       width: 7,
              //                     ),
              //                     Text(
              //                       "Sky Sports",
              //                       style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           color: Colors.grey,
              //                           fontSize: 14),
              //                     ),
              //                     SizedBox(
              //                       width: 30,
              //                     ),
              //                     Icon(
              //                       Iconsax.clock,
              //                       color: Colors.grey,
              //                     ),
              //                     Text(
              //                       "12 h",
              //                       style: TextStyle(
              //                           fontWeight: FontWeight.bold,
              //                           color: Colors.grey,
              //                           fontSize: 14),
              //                     ),
              //                   ],
              //                 ),
              //                 Padding(
              //                   padding: const EdgeInsets.all(6.0),
              //                   child: SizedBox(
              //                     height: 150,
              //                     width: MediaQuery.of(context).size.width - 60,
              //                     child: Image.network(
              //                       index.isEven
              //                           ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoOcgeVfyyzhq23rYIQA4kdMQB8o03uRlzBg&usqp=CAU"
              //                           : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt0F-bqvX72hQY19TNqX2Gp45lENCX1fn_hw&usqp=CAU",
              //                       fit: BoxFit.fill,
              //                     ),
              //                   ),
              //                 )
              //               ],
              //             ),
              //           ),
              //         );
              //       }),
              // ),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15, top: 10),
                    child: Text(
                      "Latest News",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1000,
                child: ListView.builder(
                    itemCount: 10,
                    padding: const EdgeInsets.all(0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 20, top: 10),
                        child: SizedBox(
                            height: 120,
                            width: MediaQuery.of(context).size.width - 60,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: SizedBox(
                                    height: 130,
                                    width: 120,
                                    child: Image.network(
                                      index.isOdd
                                          ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSabJteOeBo_3dLUA6tIR-G6zOODis6Lho-eA&usqp=CAU"
                                          : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTRifH9dTn7DKhOjhf9yB_n3gjEulOcIeWzeg&usqp=CAU",
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                                const Expanded(
                                    child: Column(
                                  children: [
                                    Text(
                                      "Arsenal Fresh \$70m Caicedo bid rejected by brighton",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Sky Sports",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        Icon(
                                          Iconsax.clock,
                                          color: Colors.grey,
                                        ),
                                        Text(
                                          "12 h",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey,
                                              fontSize: 14),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                              ],
                            )),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesList{
  final String name;
  const CategoriesList({required this.name});
}