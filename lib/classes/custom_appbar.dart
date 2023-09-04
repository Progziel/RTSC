// import 'package:flutter/material.dart';
//
// class CustomBarWidget extends StatefulWidget {
//   @override
//   State<CustomBarWidget> createState() => _CustomBarWidgetState();
// }
//
// class _CustomBarWidgetState extends State<CustomBarWidget> {
//   final drawerKey = GlobalKey<ScaffoldState>();
//   final screenSize = Get.height;
//   List<Services> serviceTexts = [
//     Services(title: 'Order Residential', subTitle: 'Your souce for high quality\nroof measurements and diagrams.', imageURL: 'assets/images/c_slider1.png',price: '\$47.95'),
//     Services(title: 'Order Commercial', subTitle: 'Roofers working for roofers.', imageURL: 'assets/images/c_slider2.png', price: '\$54.95'),
//   //  Services(title: 'Bank', subTitle: 'Bank Purchase', imageURL: '', price: ''),
//     ]; // Define your service texts here
//
//
//
//
//   // GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: drawerKey,
//       drawer: drawerWidget(),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         physics: screenSize < 600 ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
//         child: Column(
//           children: [
//             Container(
//               height: 160.0,
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     color: AppAssets.cg1,
//                     width: MediaQuery.of(context).size.width,
//                     height: 100.0,
//                     child: const Center(
//                       child: Text(
//                         "SkyTek",
//                         style: TextStyle(color: Colors.white, fontSize: 18.0),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     top: 80.0,
//                     left: 0.0,
//                     right: 0.0,
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 20.0),
//                       child: DecoratedBox(
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(1.0),
//                             border: Border.all(
//                                 color: Colors.grey.withOpacity(0.5), width: 1.0),
//                             color: Colors.white),
//                         child: Row(
//                           children: [
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.menu,
//                                 color: AppAssets.cg1,
//                               ),
//                               onPressed: () {
//                                 print("your menu action here");
//                                 drawerKey.currentState?.openDrawer();
//                               },
//                             ),
//                             const Expanded(
//                               child: TextField(
//                                 decoration: InputDecoration(
//                                   hintText: "Search",
//                                 ),
//                               ),
//                             ),
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.search,
//                                 color: AppAssets.cg1,                        ),
//                               onPressed: () {
//                                 print("your menu action here");
//                               },
//                             ),
//                             IconButton(
//                               icon: const Icon(
//                                 Icons.shopping_cart_outlined,
//                                 color: AppAssets.cg1,
//
//                               ),
//                               onPressed: () {
//                                // print('${Get.height}');
//                                 Get.to(()=> CartScreen());
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//            Column(
//              children: [
//                const Padding(
//                  padding: EdgeInsets.only(left: 12.0),
//                  child: Align(
//                      alignment: Alignment.topLeft,
//                      child: CustomTextWidget(text: 'Welcome to SkyTek Imaging',fontSize: 20,textColor: AppAssets.cg2,fontWeight: FontWeight.w600,)),
//                ),
//                CustomCarouselSlider(),
//                const Padding(
//                  padding: EdgeInsets.only(left: 12.0),
//                  child: Align(
//                      alignment: Alignment.topLeft,
//                      child: CustomTextWidget(text: 'Services',fontSize: 20,textColor: AppAssets.cg2,fontWeight: FontWeight.w600,)),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(8.0),
//                  child: ListView.builder(
//                    physics: NeverScrollableScrollPhysics(),
//                      shrinkWrap: true,
//                      // gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//                      //     maxCrossAxisExtent: 200,
//                      //     childAspectRatio: 2/ 4,
//                      //     crossAxisSpacing: 10,
//                      //     mainAxisSpacing: 10),
//                      itemCount: serviceTexts.length,
//
//                      itemBuilder: (BuildContext ctx, index) {
//                        return GestureDetector(
//                          onTap: (){
//                            Get.to(()=> DetailScreen(
//                              title: serviceTexts[index].title,
//                              price: serviceTexts[index].price,
//                              image: serviceTexts[index].imageURL,
//                            ));
//                          },
//                          child: Padding(
//                            padding: const EdgeInsets.all(8.0),
//                            child: Row(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: [
//                                Container(
//                                  height: 100,
//                                  width: 100,
//                                  alignment: Alignment.center,
//                                  decoration: BoxDecoration(
//                                      color: AppAssets.cg2,
//                                      image: DecorationImage(
//                                        image: AssetImage(
//                                          serviceTexts[index].imageURL
//                                        ),fit: BoxFit.cover
//                                      ),
//                                      borderRadius: BorderRadius.circular(15)),
//
//                                ),
//                                SizedBox(width: 10,),
//                                Column(
//                                  crossAxisAlignment: CrossAxisAlignment.start,
//                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                  children: [
//                                    CustomTextWidget(text: serviceTexts[index].title,fontSize: 19.0,fontWeight: FontWeight.w600,),
//                                    CustomTextWidget(text: serviceTexts[index].price,fontSize: 19.0,fontWeight: FontWeight.w500,),
//                                    CustomTextWidget(text: serviceTexts[index].subTitle,fontSize: 12.0,),
//                                  ],
//                                )
//
//                              ],
//                            ),
//                          ),
//                        );
//                      }),
//                ),
//
//
//              ],
//            )
//
//           ],
//         ),
//       ),
//     );
//   }
//   Widget drawerWidget(){
//     return  const Drawer(
//       backgroundColor: Colors.white70,
//         child: Padding(
//           padding: EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//
//               Row(
//                 children: [
//                   CircleAvatar(),
//                   SizedBox(
//                     width: 10,
//                   ),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomTextWidget(
//                           text: 'Wardee Warn',
//                           fontWeight: FontWeight.w600,
//                           fontSize: 14.0,
//                       ),
//                     ],
//                   ),
//                   Spacer(),
//                  Icon(Icons.navigate_next)
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Divider(
//                 thickness: 1,
//                 color: Colors.white38,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//
//
//                   CustomTextWidget(text: 'Services',),
//                   Spacer(),
//                  Icon(Icons.navigate_next)
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//
//
//                   CustomTextWidget(text: 'Wall Reports',),
//                   Spacer(),
//                   Icon(Icons.navigate_next)
//                 ],
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 children: [
//
//
//                   CustomTextWidget(text: 'Weather',),
//                   Spacer(),
//                   Icon(Icons.navigate_next)
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Spacer(),
//               Divider(
//                 thickness: 1,
//                 color: Colors.white38,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               Row(
//                 children: [
//
//
//                   CustomTextWidget(text: 'Logout',),
//                   Spacer(),
//                   Icon(Icons.navigate_next)
//                 ],
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//             ],
//           ),
//         )
//
//       /*ListView(
//         // Important: Remove any padding from the ListView.
//         padding: EdgeInsets.zero,
//         children: [
//
//           ListTile(
//             title:textWidget(text: 'Profile',color: textColor),
//             onTap: () {
//               Get.to(() => ProfileScreen(
//                 customerId: customerId,
//                 token: token,
//               ));
//               // Update the state of the app.
//               // ...
//             },
//           ),
//           ListTile(
//             title:  textWidget(text: 'Switch',color: textColor),
//             leading: Icon(Icons.swap_horiz_sharp,color: textColor,),
//             onTap: switchOnTap,
//           ),
//           ListTile(
//             title:  textWidget(text: 'Logout',color: textColor),
//             onTap: logoutOnTap,
//           ),
//         ],
//       ),*/
//     );
//   }
// }
//
//
// AppBar whiteCustomAppBar({required String title, List<Widget>? action}){
//   return AppBar(
//     title: CustomTextWidget(
//         text: title, fontSize: 20.0, fontWeight: FontWeight.w600),
//     centerTitle: true,
//     actions: action,
//   );
// }
//
//
// class Services{
//   String title;
//   String subTitle;
//   String imageURL;
//   String price;
//   Services({required this.title,required this.subTitle,required this.imageURL,required this.price});
// }