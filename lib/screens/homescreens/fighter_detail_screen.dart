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
  final  String? playerScore;
  final String? status;
  const FighterDetailScreen({Key? key,this.playerId,required this.playerImage,required this.playerName,required this.playerWeight,this.status,this.playerScore  }) : super(key: key);

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
        matchLogPlayerId: widget.playerId
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
        title:  CustomTextWidget(text: widget.playerWeight ?? "",fontSize: 17),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             Container(
               padding: EdgeInsets.all(8),
               decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(10)
               ),
               child: Column(
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text(
                         "Name: ",
                         style: TextStyle(fontSize: 18),
                       ),
                       Text(
                         widget.playerName,
                         style: TextStyle(fontSize: 18),
                       ),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,

                     children: [
                       Text(
                         "Id: ",
                         style: TextStyle(fontSize: 18),
                       ),
                       Text(
                         widget.playerId.toString() ?? "",
                         style: TextStyle(fontSize: 18),
                       ),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,

                     children: [
                       Text(
                         "Score: ",
                         style: TextStyle(fontSize: 18),
                       ),
                       Text(
                         widget.playerScore.toString() ?? "",
                         style: TextStyle(fontSize: 18),
                       ),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,

                     children: [
                       Text(
                         "Status: ",
                         style: TextStyle(fontSize: 18),
                       ),
                       Text(
                         widget.status ?? "",
                         style: TextStyle(fontSize: 18),
                       ),
                     ],
                   ),
                 ],
               ),
             )


,              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  "${imgBaseUrl}${widget.playerImage}",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: CustomTextWidget(text: "Matches History",fontSize: 17)),
              ListView.builder(
                  itemCount: fighterDetail.length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context,index){
                    final fighter = fighterDetail[index];
               return Padding(
                 padding: const EdgeInsets.all(4.0),
                 child: Container(
                   decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(10),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         CustomTextWidget(text: fighter.date ?? ""),
                         CustomTextWidget(text: fighter.VenuesName ?? ""),
                         CustomTextWidget(text: fighter.matchLogPlayer1Score ?? ""),
                       ],
                     ),
                   ),
                 ),
               );}
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
      ),
    );
  }
}
