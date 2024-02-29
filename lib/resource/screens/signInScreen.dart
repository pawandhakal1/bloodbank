import 'package:bloodbank/app/controllers/authController.dart';
import 'package:bloodbank/resource/screens/registerscreens.dart';
import 'package:bloodbank/resource/widgets/customButton.dart';
import 'package:bloodbank/resource/widgets/customText.dart';
import 'package:bloodbank/resource/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

final AuthController _authController = Get.put(AuthController());
final TextEditingController _email = TextEditingController();
final TextEditingController _password = TextEditingController();

final _formKey = GlobalKey<FormState>();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CustomText(
            textColor: Theme.of(context).primaryColor,
            textSize: 24,
            textWeight: FontWeight.bold,
            textes: "Sign In"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    customTextFormField(
                      controller: _email,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      height: 1.15,
                      hintText: "Enter Your Email",
                      labelText: "Enter Your Email",
                      textInputAction: TextInputAction.next,
                      isObscureText: false,
                      suffix: const Icon(
                        Icons.email,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    customTextFormField(
                      controller: _password,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Password';
                        }
                        return null;
                      },
                      height: 1.15,
                      hintText: "Enter Password",
                      labelText: "Enter Password",
                      textInputAction: TextInputAction.done,
                      isObscureText: true,
                      suffix: const Icon(
                        Icons.remove_red_eye,
                        color: Colors.red,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    customButton(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              _authController.logIn(
                                  _email.text,
                                  _password.text);
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                        ButtonText: "Sign In"),
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                              textColor: Theme.of(context).primaryColor,
                              textSize: 12,
                              textWeight: FontWeight.w400,
                              textes: "Don't have an account?"),
                          TextButton(
                            onPressed: () {
                              Get.to(RegisterScreen());
                            },
                            child: CustomText(
                                textColor: Theme.of(context).primaryColor,
                                textSize: 15,
                                textWeight: FontWeight.w500,
                                textes: "Register"),
                          ),
                        ],
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
