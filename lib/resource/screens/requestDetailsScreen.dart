import 'package:bloodbank/resource/widgets/customText.dart';
import 'package:flutter/material.dart';

class MyRequestDetailScreen extends StatefulWidget {
  const MyRequestDetailScreen({super.key});

  @override
  State<MyRequestDetailScreen> createState() => _MyRequestDetailScreenState();
}

class _MyRequestDetailScreenState extends State<MyRequestDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomText(
                    textColor: Theme.of(context).primaryColor,
                    textSize: 18,
                    textWeight: FontWeight.w700,
                    textes: "Name: "),
                CustomText(
                    textColor: Theme.of(context).primaryColor,
                    textSize: 17,
                    textWeight: FontWeight.w500,
                    textes: "Sagun Bahadur Basnet"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 18,
                        textWeight: FontWeight.w700,
                        textes: "Gender: "),
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 17,
                        textWeight: FontWeight.w500,
                        textes: "Male"),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 18,
                        textWeight: FontWeight.w700,
                        textes: "Age:"),
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 17,
                        textWeight: FontWeight.w500,
                        textes: "44 Years"),
                  ],
                ),
                Row(
                  children: [
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 18,
                        textWeight: FontWeight.w700,
                        textes: "Blood:"),
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 17,
                        textWeight: FontWeight.w500,
                        textes: "A+"),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 18,
                        textWeight: FontWeight.w700,
                        textes: "Date:"),
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 17,
                        textWeight: FontWeight.w500,
                        textes: "2080-10-26"),
                  ],
                ),
                SizedBox(
                  width: width * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 18,
                        textWeight: FontWeight.w700,
                        textes: "Time:"),
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 17,
                        textWeight: FontWeight.w500,
                        textes: "12:06 pm"),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 18,
                        textWeight: FontWeight.w700,
                        textes: "Hospital:"),
                    Container(
                      width: width * 0.70,
                      child: Text(
                        "Nobel Medical College,Biratnagar",
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Theme.of(context).primaryColor,
                            overflow: TextOverflow.ellipsis),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 18,
                        textWeight: FontWeight.w700,
                        textes: "Ward: "),
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 17,
                        textWeight: FontWeight.w500,
                        textes: "08"),
                  ],
                ),
                SizedBox(
                  width: width * 0.10,
                ),
                Row(
                  children: [
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 18,
                        textWeight: FontWeight.w700,
                        textes: "Block No.: "),
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 17,
                        textWeight: FontWeight.w500,
                        textes: "2"),
                  ],
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 18,
                        textWeight: FontWeight.w700,
                        textes: "Hospital Address: "),
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 17,
                        textWeight: FontWeight.w500,
                        textes: "Biratnagar,Province1"),
                  ],
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 18,
                        textWeight: FontWeight.w700,
                        textes: "Condition: "),
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 17,
                        textWeight: FontWeight.w500,
                        textes: "Emergency"),
                  ],
                ),
              ],
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 18,
                        textWeight: FontWeight.w700,
                        textes: "Phone Number: "),
                    CustomText(
                        textColor: Theme.of(context).primaryColor,
                        textSize: 17,
                        textWeight: FontWeight.w500,
                        textes: "9819319266"),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Container(
              height: height * 0.65,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.red
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://www.researchgate.net/publication/345830022/figure/fig4/AS:957640029003789@1605330583881/Sample-prescription-used-as-input-to-the-GUI-developed-in-the-present-work.png"),fit: BoxFit.cover,
                  ),),
            )
          ],
        ),
      ),
    );
  }
}
