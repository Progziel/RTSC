import 'package:boxing/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NewsArticlesPage extends StatefulWidget {
  const NewsArticlesPage({super.key});

  @override
  State<NewsArticlesPage> createState() => _NewsArticlesPageState();
}

class _NewsArticlesPageState extends State<NewsArticlesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeBackgroundcolor,
      body: SingleChildScrollView(
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
                          itemCount: 10,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: index == 1 ? themebluecolor : null,
                                    borderRadius: BorderRadius.circular(12)),
                                height: 40,
                                width: index.isEven ? 70 : 110,
                                child: Center(
                                  child: Text(
                                    index.isEven ? "For you" : "Asian League",
                                    style: TextStyle(
                                        color: index == 1
                                            ? Colors.white
                                            : Colors.white38),
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
            SizedBox(
              height: 250,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width - 60,
                        child: Column(
                          children: [
                            const Text(
                              "Robertson: We let the fans down.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            const Row(
                              children: [
                                SizedBox(
                                  width: 7,
                                ),
                                Text(
                                  "Klopp: We will not fall apart",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            const Row(
                              children: [
                                SizedBox(
                                  width: 7,
                                ),
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
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: SizedBox(
                                height: 150,
                                width: MediaQuery.of(context).size.width - 60,
                                child: Image.network(
                                  index.isEven
                                      ? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoOcgeVfyyzhq23rYIQA4kdMQB8o03uRlzBg&usqp=CAU"
                                      : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSt0F-bqvX72hQY19TNqX2Gp45lENCX1fn_hw&usqp=CAU",
                                  fit: BoxFit.fill,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
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
    );
  }
}
