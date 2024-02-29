import 'package:bloodbank/resource/screens/homeScreen.dart';
import 'package:bloodbank/resource/screens/kycFormScreen.dart';
import 'package:bloodbank/resource/screens/profileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.red[600],
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.red[600]),
                  margin: EdgeInsets.zero,
                  accountName: Text("Garima Bhattari"),
                  accountEmail: Text("garima32@gmail.com"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage("https://images.unsplash.com/photo-1532170579297-281918c8ae72?q=80&w=1784&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  ),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home
              ,
              color: Colors.white,
              ),
              onTap: () {
                Get.to(HomeScreen());
              },
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
            InkWell(
              onTap: () {
                Get.to(MyProfileScreen());
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                  color: Colors.white,
                ),
                title: Text(
                  "Profile",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.arrow_2_circlepath,
                color: Colors.white,
              ),
              title: Text(
                "History",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.book,
                color: Colors.white,
              ),
              title: Text(
                "Guidelines for Donation",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.settings,
                color: Colors.white,
              ),
              title: Text(
                "Setting",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bell,
                color: Colors.white,
              ),
              title: Text(
                "Notification",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
             InkWell(
              onTap: () {
                Get.to(MyKycForm());
              },
               child: ListTile(
                leading: Icon(
                  CupertinoIcons.upload_circle,
                  color: Colors.white,
                ),
                title: Text(
                  "KYC Form",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
                           ),
             ),
            ListTile(
              leading: Icon(
                CupertinoIcons.arrow_left_square_fill,
                color: Colors.white,
              ),
              title: Text(
                "Log Out",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
