import 'package:bloodbank/resource/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:rate_in_stars/rate_in_stars.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({super.key});

  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  bool status = false;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
      ),
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(color: Colors.red[600]),
            child: Column(
              children: [
                // top container
                SizedBox(
                  height: height * 0.25,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // image
                      Container(
                        width: width,
                        child: Center(
                          child: const CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://images.unsplash.com/photo-1532170579297-281918c8ae72?q=80&w=1784&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                              radius: 55),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.001,
                      ),
                      CustomText(
                          textColor: Colors.white,
                          textSize: 15,
                          textWeight: FontWeight.w500,
                          textes: "Garima Bhattarai"),
                      SizedBox(
                        height: height * 0.0001,
                      ),
                      CustomText(
                          textColor: Colors.white,
                          textSize: 15,
                          textWeight: FontWeight.w500,
                          textes: "+9779819319266"),
                      RatingStars(
                        rating: 3,
                        editable: false,
                        color: Colors.amber,
                        iconSize: 20,
                      ),
                    ],
                  ),
                ),
                // top container end here
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      Center(
                          child: Card(
                        color: Colors.white60,
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          height: height * 0.10,
                          width: width * 0.80,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: height * 0.09,
                                width: width * 0.22,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/bloodicon.png",
                                      height: height * 0.06,
                                      width: width * 0.15,
                                    ),
                                    Text(
                                      "B+",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Theme.of(context).primaryColor),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: height * 0.09,
                                width: width * 0.25,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      "assets/images/bloodicon.png",
                                      height: height * 0.06,
                                      width: width * 0.15,
                                    ),
                                    Text(
                                      "4 Saved Life",
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color:
                                              Theme.of(context).primaryColor),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: Container(
                                  height: height * 0.09,
                                  width: width * 0.25,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "20 December",
                                        style: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        "Next Donation",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            color:
                                                Theme.of(context).primaryColor),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              height: height * 0.10,
              width: width * 0.80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                      textColor: Theme.of(context).primaryColor,
                      textSize: 15,
                      textWeight: FontWeight.w600,
                      textes: "Available To donate"),
                  FlutterSwitch(
                    activeColor: Theme.of(context).primaryColor,
                      width: width * 0.16,
                      height: height * 0.04,
                      valueFontSize: 12,
                      toggleSize: 15,
                      value: status,
                      borderRadius: 30.0,
                      showOnOff: true,
                      onToggle: (val) {
                        setState(() {
                          status = val;
                        });
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
