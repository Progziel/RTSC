import 'package:boxing/classes/custom_text.dart';
import 'package:boxing/classes/custom_toast.dart';
import 'package:boxing/controller/controller.dart';
import 'package:boxing/models/dashboard_models/latest_news_body_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class LatestNewsSceen extends StatefulWidget {
  final LatestNewsData latestNewsData;

  const LatestNewsSceen({Key? key, required this.latestNewsData}) : super(key: key);

  @override
  State<LatestNewsSceen> createState() => _LatestNewsSceenState();
}

class _LatestNewsSceenState extends State<LatestNewsSceen> {
  UserController userController = Get.find<UserController>();
  String imgBaseUrl = 'http://192.168.1.120:8000';

  ToastMessage toastMessage = ToastMessage();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title:  CustomTextWidget(text: widget.latestNewsData.news_name ?? "",fontSize: 17),
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Latest News: ",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.latestNewsData.title ?? "",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      widget.latestNewsData.article ?? "",

                      style: TextStyle(fontSize: 18),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Text(
                          widget.latestNewsData.status ?? "",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [

                        Text(
                          widget.latestNewsData.created_at ?? "",
                          style: TextStyle(fontSize: 12,color: Colors.grey),
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
                  "${imgBaseUrl}${widget.latestNewsData.image}",
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
