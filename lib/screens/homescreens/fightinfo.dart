import 'package:boxing/constants/colors.dart';
import 'package:flutter/material.dart';

class fightinfopage extends StatefulWidget {
  const fightinfopage({super.key});

  @override
  State<fightinfopage> createState() => _fightinfopageState();
}

class _fightinfopageState extends State<fightinfopage> {
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
            "Fight Info",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        const Text(
                          "Martin Vs Harutyunyan",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        MaterialButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 40,
                              width: 130,
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
                    Stack(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSPq6Ztl1bJiNoIpsi6uPk-DXiL-hAZENN0gw&usqp=CAU",
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width / 2,
                                child: Image.network(
                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnV-qX1YKy9QTe8jrsEidPHwXeVVkkezVlMw&usqp=CAU",
                                  fit: BoxFit.fill,
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
                              child: const Center(
                                child: Text(
                                  "17-0-0",
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
                              child: const Center(
                                child: Text(
                                  "17-0-0",
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
                      "Saturday July 15,2023",
                      style: TextStyle(
                          color: themecolordark, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Estimated Ringkwak : Sunday",
                      style: TextStyle(
                          color: themecolordark, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "8:30 PM (Asia/Karachi)",
                      style: TextStyle(
                          color: themecolordark, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    child: Image.network(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTMK69dbcOWdJS--e-mc_8oHZYGaTb53DRIwA&usqp=CAU"),
                  ),
                  Positioned(
                      left: 0,
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 20,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.white),
                          child: const Center(
                            child: Text(
                              "Press Conference",
                              style: TextStyle(
                                  color: Color(0xffFF0007),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 20,
                          width: 150,
                          child: Center(
                              child: CircleAvatar(
                            backgroundColor: Colors.grey[200],
                            child: const Icon(Icons.play_arrow),
                          )),
                        ),
                      ))
                ],
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
                        int newindex = index - 1;
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
                                      child: const ListTile(
                                        subtitle: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("39"),
                                            Text("39"),
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
                                              MainAxisAlignment.spaceBetween,
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
                                              MainAxisAlignment.spaceBetween,
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
                                              MainAxisAlignment.spaceBetween,
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
                                            child: const ListTile(
                                              subtitle: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("39"),
                                                  Text("39"),
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

  int pageindx = -1;
  List<String> tablist = [
    "Credentials",
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
