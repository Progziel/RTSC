import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class ChatscreenPage extends StatefulWidget {
  const ChatscreenPage({super.key});

  @override
  State<ChatscreenPage> createState() => _ChatscreenPageState();
}

class _ChatscreenPageState extends State<ChatscreenPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeBackgroundcolor,
      body: Container(
        child: Column(
          children: [
            Container(
              height: 40,
              color: themecolordark,
            ),
            Container(
              height: 130,
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
                          "Chat with Us",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  ListTile(
                    trailing: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.grey,
                      ),
                      child: const Center(
                        child: Icon(Icons.favorite),
                      ),
                    ),
                    title: const Text(
                      "App Bot",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    subtitle: const Text(
                      "Feel free to ask",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                    leading: const CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhjAw-hbXnvBf2iZ-cu2n_pu41qgJsYTi5Gg&usqp=CAU"),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ListTile(
              title: Text(
                "App Bot 5:41 Pm",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              subtitle: Card(
                color: Colors.white,
                child: SizedBox(
                  height: 40,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Hello! How can I help you?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhjAw-hbXnvBf2iZ-cu2n_pu41qgJsYTi5Gg&usqp=CAU"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ["What's new", "Offers"]
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.red)),
                          child: Center(
                            child: Text(
                              e,
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ["Pricing", "Im just "]
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xffFF0007),
                              )),
                          child: Center(
                            child: Text(
                              e,
                              style: const TextStyle(
                                color: Color(0xffFF0007),
                              ),
                            ),
                          ),
                        ),
                      ))
                  .toList(),
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xffFF0007),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: const Color(0xffFF0007),
                      elevation: 0,
                      child: const Icon(
                        Icons.send,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 70,
            )

            // SizedBox(
            //   height: 850,
            //   child: ListView.builder(
            //       itemCount: 3,
            //       padding: const EdgeInsets.all(0),
            //       physics: const NeverScrollableScrollPhysics(),
            //       shrinkWrap: true,
            //       itemBuilder: (context, index) {
            //         return Column(
            //           children: [
            //             Padding(
            //               padding: const EdgeInsets.only(left: 12, right: 12),
            //               child: Container(
            //                 child: Row(
            //                   children: [
            //                     Expanded(
            //                       flex: 1,
            //                       child: Column(
            //                         children: [
            //                           const CircleAvatar(
            //                             backgroundImage: NetworkImage(
            //                                 "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7-S_UbPA-Jltgdgj0CmRY7g7z9bu_fpQCgg&usqp=CAU"),
            //                           ),
            //                           Padding(
            //                             padding: const EdgeInsets.all(8.0),
            //                             child: Container(
            //                               color: Colors.red,
            //                               width: 2,
            //                               height: 120,
            //                             ),
            //                           ),
            //                           const SizedBox(
            //                             height: 50,
            //                             width: 50,
            //                             child: Stack(
            //                               clipBehavior: Clip.none,
            //                               children: [
            //                                 Positioned(
            //                                   top: 10,
            //                                   left: -0,
            //                                   child: CircleAvatar(
            //                                     radius: 10,
            //                                     backgroundImage: NetworkImage(
            //                                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7-S_UbPA-Jltgdgj0CmRY7g7z9bu_fpQCgg&usqp=CAU"),
            //                                   ),
            //                                 ),
            //                                 Positioned(
            //                                   top: -5,
            //                                   right: -10,
            //                                   child: CircleAvatar(
            //                                     radius: 10,
            //                                     backgroundImage: NetworkImage(
            //                                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7-S_UbPA-Jltgdgj0CmRY7g7z9bu_fpQCgg&usqp=CAU"),
            //                                   ),
            //                                 ),
            //                                 Positioned(
            //                                   bottom: 10,
            //                                   right: -10,
            //                                   child: CircleAvatar(
            //                                     radius: 10,
            //                                     backgroundImage: NetworkImage(
            //                                         "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7-S_UbPA-Jltgdgj0CmRY7g7z9bu_fpQCgg&usqp=CAU"),
            //                                   ),
            //                                 ),
            //                               ],
            //                             ),
            //                           )
            //                         ],
            //                       ),
            //                     ),
            //                     Expanded(
            //                       flex: 9,
            //                       child: SizedBox(
            //                         height: 250,
            //                         child: Column(
            //                           children: [
            //                             const ListTile(
            //                               trailing: Text(
            //                                 "12h ago",
            //                                 style: TextStyle(
            //                                     color: Colors.grey,
            //                                     fontWeight: FontWeight.bold),
            //                               ),
            //                               title: Text(
            //                                 "Alex Carey Khan",
            //                                 style: TextStyle(
            //                                     fontWeight: FontWeight.w600),
            //                               ),
            //                             ),
            //                             const Text(
            //                                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galle "),
            //                             const SizedBox(
            //                               height: 30,
            //                             ),
            //                             Row(
            //                               children: [
            //                                 const SizedBox(
            //                                   width: 30,
            //                                 ),
            //                                 const Text(
            //                                   "394",
            //                                   style: TextStyle(
            //                                       fontWeight: FontWeight.bold,
            //                                       color: Colors.grey,
            //                                       fontSize: 12),
            //                                 ),
            //                                 const Text(
            //                                   " replies  . ",
            //                                   style: TextStyle(
            //                                       fontWeight: FontWeight.bold,
            //                                       color: Colors.grey,
            //                                       fontSize: 12),
            //                                 ),
            //                                 const Text(
            //                                   "3672",
            //                                   style: TextStyle(
            //                                       fontWeight: FontWeight.bold,
            //                                       color: Colors.grey,
            //                                       fontSize: 12),
            //                                 ),
            //                                 const Text(
            //                                   " Likes",
            //                                   style: TextStyle(
            //                                       fontWeight: FontWeight.bold,
            //                                       color: Colors.grey,
            //                                       fontSize: 12),
            //                                 ),
            //                                 const SizedBox(
            //                                   width: 25,
            //                                 ),
            //                                 IconButton(
            //                                     onPressed: () {},
            //                                     icon: const Icon(
            //                                       Iconsax.heart5,
            //                                       color: Colors.red,
            //                                     )),
            //                                 IconButton(
            //                                     onPressed: () {},
            //                                     icon: Icon(
            //                                       Icons.comment,
            //                                       color: themecolordark,
            //                                     ))
            //                               ],
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //             const Divider(
            //               thickness: 1,
            //               color: Colors.black12,
            //             )
            //           ],
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
