import 'package:bloodbank/resource/screens/bloodRequestForm.dart';
import 'package:bloodbank/resource/widgets/customText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFindDonorScreen extends StatefulWidget {
  const MyFindDonorScreen({super.key});

  @override
  State<MyFindDonorScreen> createState() => _MyFindDonorScreenState();
}

class _MyFindDonorScreenState extends State<MyFindDonorScreen> {
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
              textes: "Find Donor"),
          backgroundColor: Colors.red[600],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: SizedBox(
                height: height * 0.06,
                child: TextFormField(
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 1,
                          )),
                      prefixIcon: Icon(Icons.search,
                          color: Theme.of(context).primaryColor),
                      hintText: "Search",
                      hintStyle: TextStyle(
                          fontSize: 14,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500),
                      border: const OutlineInputBorder()),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Card(
                              elevation: 5,
                              color: Colors.red[500],
                              child: SizedBox(
                                // height: height * 0.10,
                                width: width * 0.90,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: height * 0.25,
                                        width: width * 0.85,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                                                fit: BoxFit.cover)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 10),
                                      child: Container(
                                        child: CustomText(
                                            textColor: Colors.white,
                                            textSize: 18,
                                            textWeight: FontWeight.w400,
                                            textes: "Manoj Kumar Chaudhary",maxLines: 2,),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                           horizontal: 10),
                                      child: Container(
                                        child: CustomText(
                                            textColor: Colors.white,
                                            textSize: 18,
                                            textWeight: FontWeight.w400,
                                            textes: "Blood Group : B+"),
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 5),
                                      child: Row(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10)
                                            ),
                                            child: Center(child: Text("View Details",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w400),)),
                                          ),
                                          SizedBox(width: 10,),
                                          InkWell(
                                            onTap: () {
                                              Get.to(BloodRequestForm());
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.amber,
                                                borderRadius: BorderRadius.circular(10)
                                              ),
                                              child: Center(child: Text("Make Request",style: TextStyle(color: Theme.of(context).primaryColor,fontWeight: FontWeight.w400),)),
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
                  );
                },
              ),
            )
          ],
        ));
  }
}
