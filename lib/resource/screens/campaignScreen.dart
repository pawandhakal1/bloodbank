import 'package:bloodbank/resource/widgets/customText.dart';
import 'package:flutter/material.dart';

class MyCampaignScreen extends StatefulWidget {
  const MyCampaignScreen({super.key});

  @override
  State<MyCampaignScreen> createState() => _MyCampaignScreenState();
}

class _MyCampaignScreenState extends State<MyCampaignScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
            textColor: Colors.white,
            textSize: 22,
            textWeight: FontWeight.w600,
            textes: "Campaigns"),
        backgroundColor: Colors.red[600],
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Card(
                        elevation: 5,
                        color: Colors.red[600],
                        child: SizedBox(
                          // height: height * 0.15,
                          width: width * 0.95,
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: height * 0.14,
                                  width: width * 0.30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://cdn.vectorstock.com/i/preview-1x/18/97/human-blood-donate-on-white-background-vector-42761897.jpg"),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      textColor: Colors.white,
                                      textSize: 14,
                                      textWeight: FontWeight.w500,
                                      textes: "Blood Donation Camp",
                                      maxLines: 2,
                                    ),
                                    CustomText(
                                        textColor: Colors.white,
                                        textSize: 12,
                                        textWeight: FontWeight.w400,
                                        textes: "Itahari Hospital"),
                                    Text(
                                      "Tuesday,Feb-10,2024",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: height * 0.01,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: height * 0.04,
                                              width: width * 0.18,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                  child: Text(
                                                "Volunteer",
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: height * 0.04,
                                              width: width * 0.18,
                                              decoration: BoxDecoration(
                                                  color: Colors.amber,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                  child: Text(
                                                "Donate",
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              )),
                                            ),
                                          )
                                        ],
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
