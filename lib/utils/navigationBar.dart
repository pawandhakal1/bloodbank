import 'package:bloodbank/resource/screens/campaignScreen.dart';
import 'package:bloodbank/resource/screens/dashboardScreen.dart';
import 'package:bloodbank/resource/screens/homeScreen.dart';
import 'package:bloodbank/resource/screens/profileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class customNavigator extends StatelessWidget {
  const customNavigator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
        activeColor: Theme.of(context).primaryColor,
        color: Theme.of(context).primaryColor,
        haptic: true,
        iconSize: 27,
        duration: Duration(milliseconds: 150),
        rippleColor: Colors.redAccent,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 12),
        tabs: [
          GButton(
            icon: Icons.home_filled,
            text: "Home",
            onPressed: () {
              Get.to(HomeScreen());
            },
          ),
          GButton(
            icon:Icons.dashboard_customize_sharp,
            text: "Dashboard",
            onPressed: () {
              Get.to(MyDashboardScreen());
            },
          ),
          GButton(
            icon: Icons.campaign_rounded,
            text: "Campaign",
            onPressed: () {
              Get.to(MyCampaignScreen());
            },
          ),
          GButton(
            icon: Icons.account_circle,
            text: "Profile",
            onPressed: () {
              Get.to(MyProfileScreen());
            },
          )
        ]);
  }
}
