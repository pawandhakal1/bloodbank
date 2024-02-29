import 'package:bloodbank/resource/screens/dashboardScreen.dart';
import 'package:bloodbank/resource/screens/findDonorScreens.dart';
import 'package:bloodbank/resource/widgets/customText.dart';
import 'package:bloodbank/resource/widgets/drawer.dart';
import 'package:bloodbank/utils/navigationBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
                textColor: Theme.of(context).primaryColor,
                textSize: 14,
                textWeight: FontWeight.w500,
                textes: "Hi, Pawan"),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.notifications),
              color: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.13,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Stack(
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      width: width,
                      child: Image.asset(
                        "assets/images/crasoul_image.jpg",
                        fit: BoxFit.cover,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
          // donor button
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Get.to(MyFindDonorScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: width * 0.20,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/bloodicon.png",
                            height: height * 0.06,
                          ),
                          CustomText(
                              textColor: Theme.of(context).primaryColor,
                              textSize: 10,
                              textWeight: FontWeight.w500,
                              textes: "Find Donor")
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.to(MyDashboardScreen());
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: width * 0.20,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/blood_donation.png",
                            height: height * 0.06,
                          ),
                          CustomText(
                              textColor: Theme.of(context).primaryColor,
                              textSize: 10,
                              textWeight: FontWeight.w500,
                              textes: "Donate Blood")
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: width * 0.20,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/hospital.png",
                            height: height * 0.06,
                          ),
                          CustomText(
                              textColor: Theme.of(context).primaryColor,
                              textSize: 10,
                              textWeight: FontWeight.w500,
                              textes: "Hospitals")
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      width: width * 0.20,
                      height: height * 0.1,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1,color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white38,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/charity.png",
                            height: height * 0.06,
                          ),
                          CustomText(
                              textColor: Theme.of(context).primaryColor,
                              textSize: 10,
                              textWeight: FontWeight.w500,
                              textes: "Charity")
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              height: height * 0.15,
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              child: CustomText(textColor: Theme.of(context).primaryColor, textSize: 18, textWeight: FontWeight.w600, textes: "Featured events"),
            ),
          ),
          SizedBox(
            height: height*0.01,
          ),
          // feature event start here
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: height * 0.25,
              child: SizedBox(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              height: height * 0.24,
                              width: width * 0.45,
                              decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Theme.of(context).primaryColor),
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(),
                                    child: Container(
                                      height: height * 0.13,
                                      width: width,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(8),topRight: Radius.circular(8)),
                                        image: DecorationImage(image: AssetImage("assets/images/eventimg.jpeg"),fit:BoxFit.cover ,),
                                      ),
                                      ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 2),
                                    child: CustomText(textColor: Theme.of(context).primaryColor, textSize: 11, textWeight: FontWeight.w400, textes: "30 JAN 2024"),
                                  ),
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 2),
                                    child: Text("World Heart Day",maxLines: 2,overflow: TextOverflow.ellipsis, style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Theme.of(context).primaryColor,
                                  ),),
                                  ),
                                  Container(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 2),
                                          width: width*0.20,
                                          child: Text("Itahari-4,sunsari,Nepal",style: TextStyle(
                                            fontSize: 10,
                                            color: Theme.of(context).primaryColor,
                                            overflow: TextOverflow.ellipsis
                                          ),maxLines: 2,),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 3,top: 5),
                                            padding: EdgeInsets.all(2),
                                            width:width * 0.17,
                                            height: height * 0.05,
                                            decoration: BoxDecoration(
                                              color: Theme.of(context).primaryColor,
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Center(child: Text("Donate",style: TextStyle(
                                              color: Colors.white
                                            ),)),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          // feature event end here
          // Blood Request
           Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
            child: Container(
              child: CustomText(textColor: Theme.of(context).primaryColor, textSize: 18, textWeight: FontWeight.w600, textes: "Blood Request"),
            ),
          ),

        ],
      ),
      bottomNavigationBar: customNavigator(),
      drawer: MyDrawer(),
    );
  }
}
