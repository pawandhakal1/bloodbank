import 'package:bloodbank/resource/screens/requestDetailsScreen.dart';
import 'package:bloodbank/resource/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDashboardScreen extends StatefulWidget {
  const MyDashboardScreen({super.key});

  @override
  State<MyDashboardScreen> createState() => _MyDashboardScreenState();
}

class _MyDashboardScreenState extends State<MyDashboardScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: CustomText(
              textColor: Colors.white,
              textSize: 22,
              textWeight: FontWeight.w600,
              textes: "Dashboard",
            ),
            backgroundColor: Colors.red[600],
            bottom: const TabBar(
                padding: EdgeInsets.symmetric(vertical: 8),
                dividerHeight: 0,
                indicatorColor: Colors.white,
                tabs: [
                  Text(
                    "New Request",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "My Donations",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500),
                  )
                ]),
          ),
          body: TabBarView(children: [
            ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Card(
                            elevation: 5,
                            color: Colors.red[500],
                            child: SizedBox(
                              // height: height * 0.10,
                              width: width * 0.95,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: width * 0.72,
                                            child: CustomText(
                                              textColor: Colors.white,
                                              textSize: 16,
                                              textWeight: FontWeight.w500,
                                              textes: "Sagun Bahadur Basnet",
                                              maxLines: 2,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 4),
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    width: 1,
                                                    color: Colors.white),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: CustomText(
                                                textColor: Colors.white,
                                                textSize: 18,
                                                textWeight: FontWeight.w500,
                                                textes: "A+"),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.005,
                                    ),
                                    Container(
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: [
                                          Container(
                                            width: width * 0.22,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    textColor: Colors.white,
                                                    textSize: 13,
                                                    textWeight: FontWeight.w300,
                                                    textes: "Date"),
                                                CustomText(
                                                    textColor: Colors.white,
                                                    textSize: 13,
                                                    textWeight: FontWeight.w500,
                                                    textes: "26-Magh")
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.22,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    textColor: Colors.white,
                                                    textSize: 13,
                                                    textWeight: FontWeight.w300,
                                                    textes: "Time"),
                                                CustomText(
                                                    textColor: Colors.white,
                                                    textSize: 13,
                                                    textWeight: FontWeight.w500,
                                                    textes: "12:36 pm")
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: width * 0.37,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CustomText(
                                                    textColor: Colors.white,
                                                    textSize: 13,
                                                    textWeight: FontWeight.w300,
                                                    textes: "Status"),
                                                CustomText(
                                                    textColor: Colors.white,
                                                    textSize: 13,
                                                    textWeight: FontWeight.w500,
                                                    textes: "Completed")
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.005,
                                    ),
                                    Container(
                                      width: width * 0.88,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CustomText(
                                              textColor: Colors.white,
                                              textSize: 13,
                                              textWeight: FontWeight.w300,
                                              textes: "Hospital"),
                                          CustomText(
                                              textColor: Colors.white,
                                              textSize: 13,
                                              textWeight: FontWeight.w500,
                                              textes:
                                                  "Nobel Teaching College,Biratnagar")
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.025,
                                    ),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width: width * 0.35,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                 Ink(
                                            padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 1,color: Colors.white),
                                              borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: Text("Accept",style: TextStyle(color: Colors.white),),
                                          ),
                                          Ink(
                                            padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                                            decoration: BoxDecoration(
                                              border: Border.all(width: 1,color: Colors.white),
                                              borderRadius: BorderRadius.circular(8)
                                            ),
                                            child: Text("Decline",style: TextStyle(color: Colors.white),),
                                          )
                                              ],
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Get.to(MyRequestDetailScreen());
                                            },
                                            child: Ink(
                                              padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                                              decoration: BoxDecoration(
                                                border: Border.all(width: 1,color: Colors.white),
                                                borderRadius: BorderRadius.circular(8),
                                                color:Theme.of(context).primaryColor
                                              ),
                                              child: const Text("View Details",style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.white
                                              ),),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
            Center(
              child: Text("Here is donation"),
            )
          ])),
    );
  }
}
