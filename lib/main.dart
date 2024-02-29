import 'package:bloodbank/resource/screens/bloodRequestForm.dart';
import 'package:bloodbank/resource/screens/campaignScreen.dart';
import 'package:bloodbank/resource/screens/findDonorScreens.dart';
import 'package:bloodbank/resource/screens/homeScreen.dart';
import 'package:bloodbank/resource/screens/kycFormScreen.dart';
import 'package:bloodbank/resource/screens/profileScreen.dart';
import 'package:bloodbank/resource/screens/registerscreens.dart';
import 'package:bloodbank/resource/screens/signInScreen.dart';
import 'package:bloodbank/resource/screens/splashScreen.dart';
import 'package:bloodbank/utils/color_schemes.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Blood Bank',
      theme: ThemeData(
        colorScheme: lightColorScheme,
        useMaterial3: true,
      ),
      initialRoute: "/",
      getPages:[
        GetPage(name: "/", page: ()=> const mySplashScreen()),
        GetPage(name: "/register", page: ()=> RegisterScreen()),
        GetPage(name: "/signin", page: ()=> const SignInScreen()),
        GetPage(name: "/home", page: ()=> const HomeScreen()),
        GetPage(name: "/profile", page: ()=> const MyProfileScreen()),
        GetPage(name: "/campaign", page: ()=> const MyCampaignScreen()),
        GetPage(name: "/donor", page: ()=> const MyFindDonorScreen()),
        GetPage(name: "/kyc", page: ()=> const MyKycForm()),
        GetPage(name: "/bloodrequestform", page: ()=> const BloodRequestForm()),
      ],
    );
  }
}


