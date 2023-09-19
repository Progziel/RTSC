import 'package:boxing/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../classes/custom_toast.dart';


class FavScreen extends StatefulWidget {

  const FavScreen({Key? key}) : super(key: key);

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  UserController userController = Get.find<UserController>();
  ToastMessage toastMessage = ToastMessage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: [
            // Container(
            //   padding: const EdgeInsets.all(5),
            //   width: Get.width,
            //   color: AppAssets.cg2,
            //   child:  Row(
            //     children: [
            //       Icon(
            //         Icons.check,
            //         color: AppAssets.cg1,
            //       ),
            //       CustomTextWidget(
            //           text:
            //               '“Regular Residential Roof Report” has been added to your cart.'),
            //     ],
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Column(
            //    // mainAxisAlignment: MainAxisAlignment.spaceAround,
            //     children: [
            //       CustomTable(),
            //     ],
            //   ),
            // ),
            Obx(
                  () => ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: userController.items.length,
                itemBuilder: (ctx, index) {

                  final product = userController.items[index];

                  return Card(
                    child: ListTile(
                      title: Text(product.matchLogId.toString()  ?? ""),
                      subtitle: Text("${product.player1Name} V/S ${product.player2Name}"?? ""),
                      trailing: IconButton(
                        icon: const Icon(Icons.cancel_outlined),
                        onPressed: () {
                          userController.removeFromWishList(product);
                          toastMessage.showToastMessage("Remove to cart successfully");
                        },
                      ),
                    ),
                  );
                },
              ),
            ),


            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
