import 'dart:core';

import 'package:boxing/classes/custom_text.dart';
import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/controller/controller.dart';
import 'package:boxing/models/dashboard_models/fighter_detail_body_model.dart';
import 'package:boxing/models/dashboard_models/fighter_detail_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FighterDetailScreen extends StatefulWidget {
  final int? playerId;
  final String playerName;
  final String playerImage;
  final String playerWeight;
  const FighterDetailScreen({Key? key,this.playerId,required this.playerImage,required this.playerName,required this.playerWeight }) : super(key: key);

  @override
  State<FighterDetailScreen> createState() => _FighterDetailScreenState();
}

class _FighterDetailScreenState extends State<FighterDetailScreen> {
  UserController userController = Get.find<UserController>();
  List<FighterDetail> fighterDetail = [];
  String imgBaseUrl = 'http://192.168.1.120:8000';

  ToastMessage toastMessage = ToastMessage();
  Future<void> getFighterDetail()async{
    FighterDetailModel fighterDetailModel = FighterDetailModel(
      matchLogPlayerID: widget.playerId
    );
    final res = await userController.fighterDetail(fighterDetailModel);
   try{
     if(res.status == 200){
       fighterDetail = res.data ?? [];
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
    getFighterDetail();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  CustomTextWidget(text: widget.playerName ?? "",fontSize: 17),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Text(
              widget.playerWeight,
              style: TextStyle(fontSize: 18),
            ),


            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                "${imgBaseUrl}${widget.playerImage}",
                fit: BoxFit.cover,
              ),
            ),
            ListView.builder(
                itemCount: fighterDetail.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context,index){
                  final fighter = fighterDetail[index];
             return Container(
               decoration: BoxDecoration(
                 color: Colors.red,
                 borderRadius: BorderRadius.circular(10),
               ),
               child: Row(
                 children: [
                   CustomTextWidget(text: fighter.date ?? ""),
                   CustomTextWidget(text: fighter.VenuesName ?? ""),
                   CustomTextWidget(text: fighter.matchLogPlayer1Score ?? ""),
                 ],
               ),
             );}
            ),
            Padding(
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
           Padding(
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
            Padding(
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
            Padding(
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
            const Row(
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
            const Padding(
              padding: EdgeInsets.all(12.0),
              child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,when an unknown printer took a galle",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
