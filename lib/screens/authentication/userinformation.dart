import 'package:boxing/constants/colors.dart';
import 'package:boxing/screens/authentication/personalprofile.dart';
import 'package:boxing/terms.dart';
import 'package:flutter/material.dart';

class UserInformation extends StatefulWidget {
  const UserInformation({super.key});

  @override
  State<UserInformation> createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  List<bool> boollist = List.generate(1, (index) => false).toList();
  int indexnumber = 0;

  String page1 = "started";
  String page2 = "";
  String page3 = "";
  String page4 = "";
  String page5 = "";

  @override
  void initState() {
    boollist[0] = true;

    setState(() {});
    // TODO: implement initState
    super.initState();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Container(
              child: screenlist[indexnumber],
            ),
            indexnumber == 0
                ? MaterialButton(
                    onPressed: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TermsandConditions()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: themecolordark,
                          borderRadius: BorderRadius.circular(10)),
                      width: double.infinity,
                      height: 52,
                      child: const Center(
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: indexnumber == 0
                            ? Container()
                            : GestureDetector(
                                onTap: () {},
                                child: Row(
                                  children: [
                                    const Icon(Icons.arrow_back_ios),
                                    TextButton(
                                      onPressed: () {
                                        setState(() {
                                          boollist[indexnumber] = false;
                                          indexnumber--;
                                          _scrollController.animateTo(0,
                                              duration: const Duration(
                                                  milliseconds: 500),
                                              curve: Curves.fastOutSlowIn);
                                        });
                                      },
                                      child: const Text(
                                        "Create Account",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            if (indexnumber < 0) {
                              indexnumber++;
                              boollist[indexnumber] = true;
                              _scrollController.animateTo(0,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.fastOutSlowIn);
                            } else {
                              print(indexnumber);
                            }
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color(0xff4698B4),
                              borderRadius: BorderRadius.circular(10)),
                          width: 120,
                          height: 52,
                          child: const Center(
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  List<String> demolist = ["Oui", "Non"];
  List<String> demolist2 = ["Ecole Primaire", "Lycee", "BAC +", "Aucun"];
  List<Widget> screenlist = [
    const PersonalProfile(),
  ];
}
