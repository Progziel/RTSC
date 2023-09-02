import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../constants/colors.dart';

class BoxersRecords extends StatefulWidget {
  const BoxersRecords({super.key});

  @override
  State<BoxersRecords> createState() => _BoxersRecordsState();
}

class _BoxersRecordsState extends State<BoxersRecords> {
  bool showdetails = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeBackgroundcolor,
        body: showdetails == false
            ? SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: 40,
                      color: themecolordark,
                    ),
                    Container(
                      height: 150,
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
                                  "Boxers Profiles",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 10),
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor:
                                      themeBackgroundcolor.withOpacity(0.1),
                                  filled: true,
                                  hintText: "Search",
                                  contentPadding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 15, bottom: 15),
                                  suffixIcon: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Iconsax.search_normal,
                                        color: Colors.red,
                                      )),
                                  hintStyle:
                                      const TextStyle(color: Colors.white38),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: themeBackgroundcolor
                                            .withOpacity(0.1),
                                      )),
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide: BorderSide(
                                        color: themeBackgroundcolor
                                            .withOpacity(0.1),
                                      ))),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        child: GridView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(0),
                            itemCount: 8,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showdetails = true;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black12),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: const Column(
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAESGD2z3L-PicAB0vDqQZhYbUw-ETj8b6dg&usqp=CAU"),
                                          radius: 25,
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text("Ebanie Bridges"),
                                        Text("(28-2-0)"),
                                        SizedBox(
                                          height: 5,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  ],
                ),
              )
            : SingleChildScrollView(
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
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      setState(() {
                                        showdetails = false;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.cancel,
                                      color: Colors.white,
                                    )),
                                const Text(
                                  "Timothy Brradley Jr",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 5,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Stack(
                                      children: [
                                        CircleAvatar(
                                          radius: 60,
                                          child: ClipOval(
                                            child: Image.network(
                                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTAESGD2z3L-PicAB0vDqQZhYbUw-ETj8b6dg&usqp=CAU',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Expanded(
                                    flex: 7,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Record",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "33-2-1",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "From",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.all(0.0),
                                          child: Row(
                                            children: [
                                              Text(
                                                "UD 12 . TKO9 . UD 12 . SD 12 . UD12",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10),
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
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Stats:",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const ListTile(
                          subtitle: Text("39"),
                          title: Text(
                            "Age :",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const ListTile(
                          subtitle: Text("68.9' / 1755cm"),
                          title: Text(
                            "Reach :",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const ListTile(
                          subtitle: Text("5'6 / 168cm"),
                          title: Text(
                            "Height :",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const ListTile(
                          subtitle: Text("Orthodox"),
                          title: Text(
                            "Stance :",
                          ),
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Full Record:",
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const ListTile(
                          subtitle: Text("33"),
                          title: Text(
                            "Wins :",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const ListTile(
                          subtitle: Text("39%"),
                          title: Text(
                            "KO% :",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 12, right: 12, top: 10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const ListTile(
                          subtitle: Text("2"),
                          title: Text(
                            "Lost :",
                          ),
                        ),
                      ),
                    ),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Story:",
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontSize: 22),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galle",
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                    Container(
                      height: 100,
                    )
                  ],
                ),
              ));
  }
}
