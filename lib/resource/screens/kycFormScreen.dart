import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:bloodbank/resource/widgets/customButton.dart';
import 'package:bloodbank/resource/widgets/customText.dart';
import 'package:bloodbank/resource/widgets/textFormField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nepali_address/nepali_address.dart';
import 'package:nepali_date_picker/nepali_date_picker.dart';

class MyKycForm extends StatefulWidget {
  const MyKycForm({Key? key}) : super(key: key);

  @override
  State<MyKycForm> createState() => _MyKycFormState();
}

class _MyKycFormState extends State<MyKycForm> {
  TextEditingController _date = TextEditingController();
  TextEditingController _ward = TextEditingController();
  String? selectedGender;
  Uint8List? _image;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    final width = MediaQuery.of(context).size.width * 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(
          textColor: Colors.white,
          textSize: 22,
          textWeight: FontWeight.w600,
          textes: "Know Your Customer",
        ),
        backgroundColor: Colors.red[600],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * 0.03,
          ),
          Center(
            child: Stack(
              children: [
                _image != null
                    ? CircleAvatar(
                        radius: 70, backgroundImage: MemoryImage(_image!))
                    : const CircleAvatar(
                        radius: 70,
                        backgroundImage: NetworkImage(
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),
                      ),
                Positioned(
                  bottom: -10,
                  left: 95,
                  child: IconButton(
                    onPressed: () {
                      showImagePickerOption(context);
                    },
                    icon: const Icon(
                      Icons.add_a_photo,
                      color: Colors.red,
                    ),
                    iconSize: 28,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  customTextFormField(
                    hintText: "Enter Your FullName",
                    labelText: "Enter Your FullName",
                    textInputAction: TextInputAction.next,
                    isObscureText: false,
                    height: height * 0.0017,
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
                          'Select Your Gender',
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 15,
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
                  TextFormField(
                    keyboardType: TextInputType.none,
                    style: TextStyle(
                      height: height * 0.0017,
                    ),
                    controller: _date,
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
                        lastDate: NepaliDateTime(2081),
                      );
                      if (_selectedDateTime != null) {
                        setState(() {
                          _date.text = NepaliDateFormat('yyyy-MM-dd')
                              .format(_selectedDateTime);
                        });
                      }
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    // width: width * 0.94,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1, color: Theme.of(context).primaryColor),
                        borderRadius: BorderRadius.circular(10)),
                    child: AddressContainer(
                        // isNepali: true,
                        borderColor: Theme.of(context).primaryColor,
                        isRoundedBorder: true,
                        selectMunicipality: (p0) {
                        },
                        selectDistrict: (p0) {},
                        selectProvince: (p0) {},
                        wardController: _ward),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  customButton(onTap: () {}, ButtonText: "Submit"),
                  SizedBox(
                    height: height * 0.02,
                  )
                ],
              ),
            ),
          ),
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
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop(); //close the model sheet
  }

//Camera
  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedImage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
    Navigator.of(context).pop();
  }
}
