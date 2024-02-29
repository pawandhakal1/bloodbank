import 'package:flutter/material.dart';

class SelectGender extends StatefulWidget {
  const SelectGender({super.key});

  @override
  State<SelectGender> createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender>  {
  String? selectedGender;
  final TextEditingController _gender = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Theme.of(context).primaryColor),
        borderRadius: BorderRadius.circular(10),
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0),
        child: ListView(
          children: [
            ListTile(
              title: TextFormField(
                controller:_gender,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: 'Select Your Blood Group',
                  hintStyle: TextStyle(color: Colors.black87, fontSize: 15, fontWeight: FontWeight.w400),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  border: InputBorder.none,
                ),
                onTap: () {
                  _showBloodGroupList(context);
                },
              ),
            ),
            if (selectedGender != null) ...[
              Divider(),
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
}