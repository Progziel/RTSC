import 'package:boxing/classes/custom_text.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/models/dashboard_models/all_matches_body_model.dart';
import 'package:boxing/models/dashboard_models/live_matches_body_model.dart';
import 'package:flutter/material.dart';

class fightinfopage extends StatefulWidget {
  final AllMatchesModel? allMatchesModel;
  final  LiveMatchesData? liveMatch;
  final bool allMatchApi;
  const fightinfopage(
      {super.key, this.allMatchesModel, required this.allMatchApi,this.liveMatch,  });

  @override
  State<fightinfopage> createState() => _fightinfopageState();
}

class _fightinfopageState extends State<fightinfopage> {
  String imgBaseUrl = 'http://192.168.1.120:8000';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 65,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          backgroundColor: themecolordark,
          title: const Text(
            "Fight Information",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 320,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  children: [
                   widget.allMatchApi == true ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        CustomTextWidget(
                          text: "${widget.allMatchesModel?.player1Name}",
                        ),
                        CustomTextWidget(
                            text: "V/S", textColor: AppAssets.primaryColor,fontSize: 17),
                        CustomTextWidget(
                          text: "${widget.allMatchesModel?.player2Name}",
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: EdgeInsets.only(
                                  left: 10, bottom: 5, top: 5, right: 10),
                              decoration: BoxDecoration(
                                  color: themecolordark,
                                  borderRadius: BorderRadius.circular(20)),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.notifications,
                                    color: Colors.white,
                                  ),
                                  Text(
                                    "Notifications",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ) :
                   Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       const SizedBox(
                         width: 20,
                       ),
                       CustomTextWidget(
                         text: "${widget.liveMatch?.player1Name}",
                       ),
                       CustomTextWidget(
                           text: "V/S", textColor: AppAssets.primaryColor,fontSize: 17),
                       CustomTextWidget(
                         text: "${widget.liveMatch?.player2Name}",
                       ),
                       MaterialButton(
                         onPressed: () {},
                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Container(
                             padding: EdgeInsets.only(
                                 left: 10, bottom: 5, top: 5, right: 10),
                             decoration: BoxDecoration(
                                 color: themecolordark,
                                 borderRadius: BorderRadius.circular(20)),
                             child: const Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Icon(
                                   Icons.notifications,
                                   color: Colors.white,
                                 ),
                                 Text(
                                   "Notifications",
                                   style: TextStyle(color: Colors.white),
                                 )
                               ],
                             ),
                           ),
                         ),
                       )
                     ],
                   ),
                    widget.allMatchApi == true ? Stack(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Image.network(
"$imgBaseUrl${widget.allMatchesModel?.player1Image}",                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Image.network(
                                  "$imgBaseUrl${widget.allMatchesModel?.player2Image}",                                  fit: BoxFit.cover,


                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ) : Stack(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Image.network(
                                  "$imgBaseUrl${widget.liveMatch?.player1Image}",                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Image.network(
                                  "$imgBaseUrl${widget.liveMatch?.player2Image}",                                  fit: BoxFit.cover,

                                ),
                              )
                            ],
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
                            child: Container(
                              child:  Center(
                                child: Text(
                                  widget.allMatchApi == true ? widget.allMatchesModel?.matchLogPlayer1Score ?? "" : widget.liveMatch?.matchLogPlayer1Score ?? "" ,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                width: 2,
                                color: const Color(0xffFF0007),
                              )),
                              child: const Center(
                                child: Text(
                                  "Records",
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
                                  widget.allMatchApi == true ?  widget.allMatchesModel?.matchLogPlayer2Score ?? "" : widget.liveMatch?.matchLogPlayer2Score ?? "",
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
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.allMatchApi == true ? widget.allMatchesModel?.date ?? "" : widget.liveMatch?.date ?? "",
                      style: TextStyle(
                          color: themecolordark, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.allMatchApi == true ? "Estimated Ringkwak : ${widget.allMatchesModel?.day ?? ""}" : "Estimated Ringkwak : ${widget.liveMatch?.day ?? ""}",
                      style: TextStyle(
                          color: themecolordark, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.allMatchApi == true ? "${widget.allMatchesModel?.time ?? ""}" : "${widget.liveMatch?.time ?? ""}",
                      style: TextStyle(
                          color: themecolordark, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),

              Divider(
                color: Colors.grey[300],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0),
                child: SizedBox(
                  height: 40,
                  width: double.infinity,
                  child: ListView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: tablist.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        int newindex = index ;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              pageindx = newindex;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 100),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            height: 40,
                            width: (MediaQuery.of(context).size.width - 10) / 4,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Center(
                                  child: Text(
                                    tablist[index],
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: pageindx == index
                                            ? FontWeight.bold
                                            : FontWeight.w600,
                                        color: pageindx == index
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ),
                                pageindx == newindex
                                    ? Padding(
                                        padding: EdgeInsets.only(
                                          left: index == 0 ? 20 : 7,
                                          right: index == 0 ? 20 : 7,
                                        ),
                                        child: Container(
                                          color: Colors.black38,
                                          height: 2,
                                        ),
                                      )
                                    : Container(
                                        height: 2,
                                      )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
              pageindx == -1
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Media Credential Request",
                          style: TextStyle(fontSize: 18),
                        ),
                        const Text(
                          "Your Personal Privacy is always important to us",
                          style: TextStyle(fontSize: 12),
                        ),
                        const Text(
                          "Yours Information is shared only wih the PR team",
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIGl5fAU5C7unzYmmw-UOyBfnQQjnRPZreXg&usqp=CAU",
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Required Information",
                          style: TextStyle(fontSize: 14),
                        ),
                        textfieldwidget("Event"),
                        Row(
                          children: [
                            Expanded(child: textfieldwidget("First Name")),
                            Expanded(child: textfieldwidget("Last Name"))
                          ],
                        ),
                        textfieldwidget("Media Affliation"),
                        textfieldwidget("Mailing Address"),
                        textfieldwidget("Address Line"),
                        Row(
                          children: [
                            Expanded(child: textfieldwidget("City")),
                            Expanded(child: textfieldwidget("Zip Code"))
                          ],
                        ),
                        textfieldwidget("Role"),
                        textfieldwidget("Media Affliation"),
                        textfieldwidget("Mailing Address"),
                        textfieldwidget("Address Line"),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                color: const Color(0xffFF0007),
                                borderRadius: BorderRadius.circular(10)),
                            width: double.infinity,
                            height: 52,
                            child: const Center(
                              child: Text(
                                "Submit Credential Request",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    )
                  : pageindx == 0
                      ? Column(
                          children: [
                            pageindx != 0
                                ? const Column(
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "commentary",
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(12.0),
                                        child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galle",
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                    ],
                                  )
                                : const Row(
                                    children: [],
                                  ),
                            pageindx != 0
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                      right: 12,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child:  ListTile(
                                        subtitle: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            widget.allMatchApi == true ? Text(widget.allMatchesModel?.Player1Age ?? "") : Text(widget.liveMatch?.Player1Age ?? ""),
                                            widget.allMatchApi == true ? Text(widget.allMatchesModel?.Player2Age ?? "") : Text(widget.liveMatch?.Player2Age ?? ""),
                                          ],
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Age ",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                            pageindx != 0
                                ? Container()
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        left: 12, right: 12, top: 10),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child:  ListTile(
                                        subtitle: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            widget.allMatchApi == true ? Text(widget.allMatchesModel?.Player1Height ?? "") : Text(widget.liveMatch?.Player1Height ?? ""),
                                            widget.allMatchApi == true ? Text(widget.allMatchesModel?.Player2Height ?? "") : Text(widget.liveMatch?.Player2Height ?? ""),

                                          ],
                                        ),
                                        title: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Height ",
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                            pageindx != 0
                                ? Container()
                                :  Row(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child:  widget.allMatchApi == true ? Text(
                                          "What is ${widget.allMatchesModel?.player1Name ?? ""} VS ${widget.allMatchesModel?.player1Name ?? ""}?",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ) : Text(
                                          "What is ${widget.liveMatch?.player1Name ?? ""} VS ${widget.liveMatch?.player1Name ?? ""}?",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ),
                                    ],
                                  ),
                            pageindx != 0
                                ? Container()
                                : const Padding(
                                    padding: EdgeInsets.all(12.0),
                                    child: Text(
                                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galle",
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: boxingCommentary.length,
                                itemBuilder: (context, index) {
                                  return const Padding(
                                    padding: EdgeInsets.only(
                                        left: 15, right: 15, top: 10),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galle")),
                                      ],
                                    ),
                                  );
                                }),
                            Container(
                              height: 100,
                            )
                          ],
                        )
                      : pageindx == 1
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  pageindx != 0
                                      ? const Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galle",
                                                style: TextStyle(fontSize: 14),
                                              ),
                                            ),
                                          ],
                                        )
                                      : const Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "The Tape:",
                                                style: TextStyle(
                                                    color: Color(0xffFF0007),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 22),
                                              ),
                                            ),
                                          ],
                                        ),
                                  pageindx != 0
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                            left: 12,
                                            right: 12,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child:  ListTile(
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  widget.allMatchApi == true ? Text(widget.allMatchesModel?.Player1Age ?? "") : Text(widget.liveMatch?.Player1Age ?? ""),
                                                  widget.allMatchApi == true ? Text(widget.allMatchesModel?.Player2Age ?? "") : Text(widget.liveMatch?.Player2Age ?? ""),
                                                ],
                                              ),
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Age ",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                  pageindx != 0
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, right: 12, top: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: const ListTile(
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("68.9' / 1755cm"),
                                                  Text("68.9' / 1755cm"),
                                                ],
                                              ),
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Reach ",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                  pageindx != 0
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, right: 12, top: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: const ListTile(
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("68.9' / 1755cm"),
                                                  Text("68.9' / 1755cm"),
                                                ],
                                              ),
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Height ",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                  pageindx != 0
                                      ? Container()
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              left: 12, right: 12, top: 10),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            child: const ListTile(
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Orthodox"),
                                                  Text("Orthodox"),
                                                ],
                                              ),
                                              title: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "Stance ",
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                  pageindx != 0
                                      ? Container()
                                      : const Row(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "when is martin VS Harutyunyan?",
                                                style: TextStyle(
                                                    color: Color(0xffFF0007),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ],
                                        ),
                                  pageindx != 0
                                      ? Container()
                                      : const Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Text(
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galle",
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                  ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: boxingCommentary.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              left: 15, right: 15, top: 10),
                                          child: Row(
                                            children: [
                                              Text(
                                                "$index      ",
                                                style: const TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              Expanded(
                                                  child: Text(
                                                      "10:59 :  ${boxingCommentary[index]}")),
                                            ],
                                          ),
                                        );
                                      }),
                                  Container(
                                    height: 100,
                                  )
                                ],
                              ),
                            )
                          : pageindx == 2
                              ? Container(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const LinearProgressIndicator(
                                          color: Color(0xffFF0007)),
                                      SizedBox(
                                        height: 300,
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  height: 50,
                                                  color: themecolordark,
                                                  child: const Center(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Ring A",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "57KG",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "Round 1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ),
                                            Container(
                                              height: 2,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  height: 50,
                                                  color:
                                                      const Color(0xffFF0007),
                                                  child: const Center(
                                                    child: Text(
                                                      "Martin  12",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                )),
                                                Expanded(
                                                    child: Container(
                                                  height: 50,
                                                  color: Colors.blue,
                                                  child: const Center(
                                                    child: Text(
                                                      "Harutyunyan  16",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ),
                                            Container(
                                              height: 2,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  height: 50,
                                                  color:
                                                      const Color(0xffFF0007),
                                                  child: const Center(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ),
                                            Container(
                                              height: 2,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  height: 50,
                                                  color: Colors.blue,
                                                  child: const Center(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          Text(
                                                            "0",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ),
                                            Container(
                                              height: 2,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Container(
                                                  height: 80,
                                                  color: themecolordark,
                                                  child: const Center(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(12.0),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            "R1",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 32,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          SizedBox(
                                                            width: 30,
                                                          ),
                                                          Text(
                                                            "26:59",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 32,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              : Column(
                                  children: [
                                    ListView.builder(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: 10,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) {
                                          return Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: 200,
                                                  width: 300,
                                                  child: Image.network(pageindx ==
                                                          4
                                                      ? index.isEven
                                                          ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_NSEOBeCEvxqt3rlAUm7ftHpGl3CAuvbSLg&usqp=CAU"
                                                          : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhjAw-hbXnvBf2iZ-cu2n_pu41qgJsYTi5Gg&usqp=CAU"
                                                      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR07-T_o8_ycgCeoXeIb-p2XA7TCj0hlOLSmQ&usqp=CAU"),
                                                ),
                                                pageindx == 4
                                                    ? Container()
                                                    : const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20,
                                                                right: 10),
                                                        child: Text(
                                                          "The challenger is on fire, launching a is a relentless assault on the titleholder!",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                pageindx == 4
                                                    ? Container()
                                                    : const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 20,
                                                                right: 10),
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              "45 minutes ago",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold),
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                              ],
                                            ),
                                          );
                                        })
                                  ],
                                )
            ],
          ),
        ));
  }

  textfieldwidget(String name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: name,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black26)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.black26)),
        ),
      ),
    );
  }

  int pageindx = 0;
  List<String> tablist = [
    "About",
    "Compubox",
    "Scorecard",
    "Post-Fight",
    "gallery",
  ];
  List<String> boxingCommentary = [
    "And the bell rings, signaling the start of an electrifying bout!",
    "A flurry of punches from the challenger, keeping the champion on the defensive.",
    "Oh, what a devastating right hook! It connects flush, and the crowd goes wild!",
    "The fighters trade blow for blow, neither willing to back down.",
    "Incredible footwork displayed by the boxer, dodging punches with finesse.",
    "A thunderous body shot lands, visibly affecting the opponent's stamina.",
    "The tension in the arena is palpable as we head into the championship rounds.",
    "A cunning feint sets up the perfect opening for a powerful uppercut!",
    "The referee steps in, giving a standing count after a fierce knockdown.",
    "With seconds remaining, the boxers give it their all in a final flurry of action!",
    "The judges' scorecards are in, and we have a split decision!",
    "Ladies and gentlemen, we have a new champion crowned tonight!",
    "The fight of the year, an epic battle that will be talked about for ages.",
    "The crowd erupts in applause, showing appreciation for an incredible display of skill.",
    "A rematch is inevitable after such an intense and closely contested fight.",
    "Incredible sportsmanship shown as the boxers embrace in the center of the ring.",
    "The victorious fighter's hand is raised, a moment of triumph and glory.",
    "A well-executed counterpunch leaves the opponent stunned and searching for answers.",
    "The champion's defensive tactics are proving impenetrable; the challenger needs a new strategy.",
    "The challenger is on fire, launching a relentless assault on the titleholder!",
  ];
}
