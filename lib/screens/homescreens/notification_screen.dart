import 'package:boxing/classes/custom_text.dart';
import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/constants/colors.dart';
import 'package:boxing/controller/controller.dart';
import 'package:boxing/models/dashboard_models/get_notification_body_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  UserController userController = Get.find<UserController>();
  List<NotificationDataModel> notificationData= [];
  String? date;
  ToastMessage toastMessage = ToastMessage();

  Future<void> notification()async{
    final res = await userController.getNotification();
  try{
    if(res.status == 200){
      notificationData = res.data ?? [];
      date = res.date;
      setState(() {

      });
    }
    else{
      toastMessage.showToastMessage(res.message ?? "");
    }
  }catch(e){
    toastMessage.showToastMessage("Something went wrong");
  }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    notification();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(text: 'Notifcation',fontWeight: FontWeight.w600,fontSize: 17),
      centerTitle: true,),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: CustomTextWidget(text: date ?? "",fontSize: 17,textColor:AppAssets.primaryColor,fontWeight: FontWeight.w600),
              ),
              ListView.builder(
                  itemCount: notificationData.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, index) {
                    final data = notificationData[index];
                    /*final item = items[index];*/
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[200],
                        ),
                        child: Row(
                          children: [

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomTextWidget(
                                        text: data.player1Name ?? "",
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                    CustomTextWidget(
                                        text: "V/S",
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                    CustomTextWidget(
                                        text: data.player2Name ?? "",
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ],
                                ),
                                CustomTextWidget(text:data.time ?? ""),
                                CustomTextWidget(text:data.VenuesName ?? ""),
                                CustomTextWidget(text:data.VenuesLocation ?? ""),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
