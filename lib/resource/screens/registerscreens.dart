import 'package:bloodbank/app/controllers/authController.dart';
import 'package:bloodbank/resource/widgets/customButton.dart';
import 'package:bloodbank/resource/widgets/customText.dart';
import 'package:bloodbank/resource/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nepali_address/nepali_address.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _province = TextEditingController();
  final TextEditingController _district = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? selectedGender;
  final TextEditingController _gender = TextEditingController();
  String? selectedBloodGroup;
  final TextEditingController _bloodController = TextEditingController();
  final TextEditingController _ward = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: CustomText(
            textColor: Theme.of(context).primaryColor,
            textSize: 24,
            textWeight: FontWeight.bold,
            textes: "Register"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      customTextFormField(
                          controller: _name,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter FullName';
                            }
                            return null;
                          },
                          height: 1.15,
                          hintText: "Enter Your FullName",
                          labelText: "Enter Your FullName",
                          textInputAction: TextInputAction.next,
                          isObscureText: false,
                          suffix: const Icon(
                            Icons.person,
                            color: Colors.red,
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      customTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email';
                          }
                          return null;
                        },
                        controller: _email,
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Phone Number';
                          }
                          return null;
                        },
                        controller: _phone,
                        keyboardType: TextInputType.phone,
                        height: 1.15,
                        hintText: "Enter Your Phone",
                        labelText: "Enter Your Phone",
                        textInputAction: TextInputAction.next,
                        isObscureText: false,
                        suffix: const Icon(
                          Icons.phone_android,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: ListView(
                            children: [
                              ListTile(
                                title: TextFormField(
                                  controller: _gender,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Select Your Gender',
                                    hintStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                    border: InputBorder.none,
                                  ),
                                  onTap: () {
                                    _showGenderList(context);
                                  },
                                ),
                              ),
                              if (selectedGender != null) ...[
                                const Divider(),
                                ListTile(
                                  title: Text(selectedGender!),
                                  onTap: () {
                                    setState(() {
                                      selectedGender = null;
                                      _gender.clear();
                                    });
                                  },
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.none,
                        style: TextStyle(
                          height: height * 0.0017,
                        ),
                        controller: _dateController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          labelText: "Select Date of Birth",
                          suffixIcon: Icon(
                            Icons.calendar_month,
                            color: Theme.of(context).primaryColor,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onTap: () async {
                          NepaliDateTime? _selectedDateTime =
                              await showMaterialDatePicker(
                            context: context,
                            initialDate: NepaliDateTime.now(),
                            firstDate: NepaliDateTime(1980),
                            lastDate: NepaliDateTime.now(),
                          );
                          if (_selectedDateTime != null) {
                            setState(() {
                              _dateController.text =
                                  NepaliDateFormat('yyyy-MM-dd')
                                      .format(_selectedDateTime);
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: ListView(
                            children: [
                              ListTile(
                                title: TextFormField(
                                  controller: _bloodController,
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    hintText: 'Select Your Blood Group',
                                    hintStyle: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400),
                                    suffixIcon: Icon(Icons.arrow_drop_down),
                                    border: InputBorder.none,
                                  ),
                                  onTap: () {
                                    _showBloodGroupList(context);
                                  },
                                ),
                              ),
                              if (selectedBloodGroup != null) ...[
                                Divider(),
                                ListTile(
                                  title: Text(selectedBloodGroup!),
                                  onTap: () {
                                    setState(() {
                                      selectedBloodGroup = null;
                                      _bloodController.clear();
                                    });
                                  },
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: AddressContainer(
                          isNepali:false, 
                          borderColor: Theme.of(context).primaryColor,
                          isRoundedBorder:
                              true, 
                          selectMunicipality: (selectedMunicipality) {
                            setState(() {
                              _city.text =
                                  selectedMunicipality; 
                            });
                          },
                          selectDistrict: (selectedDistrict) {
                            setState(() {
                              _district.text =
                                  selectedDistrict; 
                            });
                          },
                          selectProvince: (selectedProvince) {
                            setState(() {
                              _province.text =
                                  selectedProvince; 
                            });
                          },
                          wardController: _ward,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Password';
                          }
                          return null;
                        },
                        controller: _password,
                        height: 1.15,
                        hintText: "Enter Password",
                        labelText: "Enter Password",
                        textInputAction: TextInputAction.next,
                        isObscureText: true,
                        suffix: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.red,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      customTextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please confirm Password';
                          }
                          if (value != _password.text) {
                            return ("Password not match");
                          }
                          return null;
                        },
                        controller: _confirmPassword,
                        height: 1.15,
                        hintText: "Confirm Password",
                        labelText: "Confirm Password",
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
                              _authController.registerUser(
                                  _name.text,
                                  _email.text,
                                  _phone.text,
                                  _gender.text,
                                  _dateController.text,
                                  _bloodController.text,
                                  _province.text,
                                  _district.text,
                                  _city.text,
                                  _password.text,
                                  );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                            }
                          },
                          ButtonText: "Register"),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ))),
        ),
      ),
    );
  }

  void _showGenderList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (String Gender in ['Male', 'Female', 'Other'])
                ListTile(
                  title: Text(Gender),
                  onTap: () {
                    setState(() {
                      selectedGender = Gender;
                      _gender.text = Gender;
                    });
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }

  void _showBloodGroupList(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (String bloodGroup in [
                'O-positive',
                'O-negative',
                'B-negative',
                'B-positive'
              ])
                ListTile(
                  title: Text(bloodGroup),
                  onTap: () {
                    setState(() {
                      selectedBloodGroup = bloodGroup;
                      _bloodController.text = bloodGroup;
                    });
                    Navigator.pop(context);
                  },
                ),
            ],
          ),
        );
      },
    );
  }
}
