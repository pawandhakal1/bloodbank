import 'dart:async';
import 'package:bloodbank/resource/screens/signInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class mySplashScreen extends StatefulWidget {
  const mySplashScreen({super.key});

  @override
  State<mySplashScreen> createState() => _mySplashScreenState();
}

class _mySplashScreenState extends State<mySplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3), () { 
      Get.offAll(()=>SignInScreen());
    });
  }
  Widget build(BuildContext context) {
    final height=MediaQuery.sizeOf(context).height *1;
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/blood.png",fit: BoxFit.contain,height: height *0.6,),
            Text("Blood Donation",style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),),
            SizedBox(
              height: height*0.03,
            ),
            SpinKitSpinningLines(color: Theme.of(context).primaryColor)
          ],
        ),
      ),
    );
  }
}