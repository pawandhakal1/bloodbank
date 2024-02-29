import 'package:bloodbank/app/controllers/authController.dart';
import 'package:bloodbank/resource/widgets/customButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

class VerifyPage extends StatefulWidget {
  const VerifyPage({super.key});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  TextEditingController _pin = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final AuthController _authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
          child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "OTP",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 50,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                      SizedBox(
                        height: 55,
                      ),
                      Container(
                          child: Column(
                        children: [
                          Pinput(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter Pin';
                              }
                              return null;
                            },
                            controller: _pin,
                            length: 6,
                            keyboardType: TextInputType.number,
                            pinputAutovalidateMode:
                                PinputAutovalidateMode.onSubmit,
                          )
                        ],
                      )),
                      const SizedBox(
                        height: 30,
                      ),
                        customButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _authController.verifyphone(
                                  _pin.text
                                  );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                        ButtonText: "Verify"),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 10, horizontal: 5),
                      //   child: InkWell(
                      //     splashColor: Theme.of(context).primaryColor,
                      //     borderRadius: BorderRadius.circular(8),
                      //     onTap: () {
                      //       // if (_formKey.currentState!.validate()) {
                      //       //   _authController.verifyPhone(_pin.text);
                      //       //   ScaffoldMessenger.of(context).showSnackBar(
                      //       //     const SnackBar(
                      //       //         content: Text('Processing Data')),
                      //       //   );
                      //       // }
                      //     },
                      //     child: Ink(
                      //       padding: const EdgeInsets.symmetric(
                      //           vertical: 10, horizontal: 20),
                      //       decoration: BoxDecoration(
                      //           border: Border.all(
                      //               width: 1,
                      //               color: Theme.of(context).primaryColor),
                      //           borderRadius: BorderRadius.circular(8)),
                      //       child: Center(
                      //         child: Text(
                      //           "Submit",
                      //           style: TextStyle(
                      //               fontSize: 16, fontWeight: FontWeight.w500),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ))
            ],
          ),
        ),
      )),
    );
  }
}