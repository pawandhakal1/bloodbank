import 'dart:io';
import 'dart:typed_data';

import 'package:bloodbank/resource/widgets/customButton.dart';
import 'package:bloodbank/resource/widgets/customText.dart';
import 'package:bloodbank/resource/widgets/textFormField.dart';
import 'package:bloodbank/utils/dropDownRegister.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nepali_address/nepali_address.dart';

enum Condition { Emergency, Later_Use }

class BloodRequestForm extends StatefulWidget {
  const BloodRequestForm({super.key});

  @override
  State<BloodRequestForm> createState() => _BloodRequestFormState();
}

class _BloodRequestFormState extends State<BloodRequestForm> {
  Condition? _option = Condition.Emergency;
  
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    TextEditingController _ward = TextEditingController();
    String? selectedGender;
    Uint8List? _image;
    File? selectedImage;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          textColor: Colors.white,
          textSize: 22,
          textWeight: FontWeight.w600,
          textes: "Make Blood Request",
        ),
        backgroundColor: Colors.red[600],
      ),
      body: ListView(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Form(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customTextFormField(
                        hintText: "Enter Patient Name",
                        labelText: "Enter Patient Name",
                        textInputAction: TextInputAction.next,
                        isObscureText: false,
                        keyboardType: TextInputType.name,
                        height: height * 0.0016,
                      ),
                      SizedBox(height: height * 0.015),
                      customTextFormField(
                        hintText: "Enter Attendance Phone ",
                        labelText: "Enter Attendance Phone",
                        textInputAction: TextInputAction.next,
                        isObscureText: false,
                        keyboardType: TextInputType.phone,
                        height: height * 0.0016,
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      SelectBloodRegister(),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      customTextFormField(
                        hintText: "Enter Age ",
                        labelText: "Enter Age",
                        textInputAction: TextInputAction.next,
                        isObscureText: false,
                        keyboardType: TextInputType.number,
                        height: height * 0.0016,
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Container(
                        height: height * 0.084,
                        decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Theme.of(context).primaryColor),
                          borderRadius: BorderRadius.circular(9),
                        ),
                        width: width * 1,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: DropdownButton<String>(
                            style: TextStyle(color: Colors.black),
                            icon: Icon(Icons.arrow_drop_down),
                            iconSize: 24,
                            elevation: 16,
                            underline: Container(
                              color: Colors.red,
                            ),
                            onChanged: (String? value) {
                              setState(() {
                                selectedGender = value;
                                print('Selected Gender: $selectedGender');
                              });
                            },
                            hint: const Text(
                              'Select Gender',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400),
                            ),
                            value: selectedGender,
                            items: const [
                              DropdownMenuItem<String>(
                                value: 'Male',
                                child: Text('Male'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Female',
                                child: Text('Female'),
                              ),
                              DropdownMenuItem<String>(
                                value: 'Other',
                                child: Text('Other'),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      customTextFormField(
                        hintText: "Enter Hospital Name",
                        labelText: "Enter Hospital Name",
                        textInputAction: TextInputAction.next,
                        isObscureText: false,
                        height: height * 0.0017,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      customTextFormField(
                        hintText: "Enter Ward Number",
                        labelText: "Enter Ward Number",
                        textInputAction: TextInputAction.next,
                        isObscureText: false,
                        keyboardType: TextInputType.number,
                        height: height * 0.0017,
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      customTextFormField(
                        hintText: "Enter Bed Number",
                        labelText: "Enter Bed Number",
                        textInputAction: TextInputAction.next,
                        isObscureText: false,
                        keyboardType: TextInputType.number,
                        height: height * 0.0017,
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      customTextFormField(
                        hintText: "Enter Blood Quantity",
                        labelText: "Enter Blood Quantity",
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        isObscureText: false,
                        height: height * 0.0017,
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Container(
                        // width: width * 0.94,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: Theme.of(context).primaryColor),
                            borderRadius: BorderRadius.circular(10)),
                        child: AddressContainer(
                            // isNepali: true,
                            borderColor: Theme.of(context).primaryColor,
                            isRoundedBorder: true,
                            selectMunicipality: (p0) {},
                            selectDistrict: (p0) {},
                            selectProvince: (p0) {},
                            wardController: _ward),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      CustomText(
                          textColor: Colors.black,
                          textSize: 16,
                          textWeight: FontWeight.w500,
                          textes: "Condition"),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      Container(
                        child: Column(
                          children: [
                            RadioListTile<Condition>(
                              value: Condition.Emergency,
                              groupValue: _option,
                              onChanged: (Condition? value) {
                                setState(() {
                                  _option = value;
                                });
                              },
                              title: CustomText(
                                  textColor: Colors.black,
                                  textSize: 17,
                                  textWeight: FontWeight.w500,
                                  textes: "Emergency"),
                            ),
                            RadioListTile<Condition>(
                              value: Condition.Later_Use,
                              groupValue: _option,
                              onChanged: (Condition? value) {
                                setState(() {
                                  _option = value;
                                });
                              },
                              title: CustomText(
                                  textColor: Colors.black,
                                  textSize: 17,
                                  textWeight: FontWeight.w500,
                                  textes: "Later Use"),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.015,
                      ),
                      InkWell(
                        onTap: () {
                          showImagePickerOption(context);
                        },
                        child: Ink(
                          height: height * 0.35,
                          width: width * 0.90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          // color: Colors.green,
                          image: DecorationImage(image: NetworkImage("https://www.researchgate.net/publication/345830022/figure/fig4/AS:957640029003789@1605330583881/Sample-prescription-used-as-input-to-the-GUI-developed-in-the-present-work.png"),fit: BoxFit.contain,)),
                        child: const Center(child: Text("Upload Prec image",style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500
                        ),)),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.020,
                      ),
                      customButton(onTap: () {}, ButtonText: "Make Request"),
                      SizedBox(
                        height: height * 0.02,
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
    void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.red[400],
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(18.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3.5,
              child: Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.image,
                              color: Colors.white,
                              size: 70,
                            ),
                            Text("Gallery",style: TextStyle(color: Colors.white,fontSize: 16),)
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        _pickImageFromCamera();
                      },
                      child: const SizedBox(
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 70,
                            ),
                            Text("Camera",style: TextStyle(color: Colors.white,fontSize: 16))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//Gallery
  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      // selectedImage = File(returnImage.path);
      // _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      // selectedImage = File(returnImage.path);
      // _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
