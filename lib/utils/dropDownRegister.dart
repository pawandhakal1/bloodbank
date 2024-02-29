// import 'package:flutter/material.dart';

// class SelectBloodRegister extends StatefulWidget {
//   const SelectBloodRegister({Key? key}) : super(key: key);

//   @override
//   _SelectBloodRegisterState createState() => _SelectBloodRegisterState();
// }

// class _SelectBloodRegisterState extends State<SelectBloodRegister> {
//   String? selectedBloodGroup;
//   final TextEditingController bloodGroup=TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.sizeOf(context).height * 1;
//     return Container(
//       height: height * 0.085,
//       decoration: BoxDecoration(
//         border: Border.all(width: 1, color: Theme.of(context).primaryColor),
//         borderRadius: BorderRadius.circular(10),
//       ),
//       width: MediaQuery.of(context).size.width,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: DropdownButton<String>(
//           style: TextStyle(color: Colors.black),
//           icon: Icon(Icons.arrow_drop_down),
//           iconSize: 24,
//           elevation: 16,
//           underline: Container(
//             // height: 1.20,
//             color: Colors.red,
//           ),
//           onChanged: (String? value) {
//             setState(() {
//               selectedBloodGroup = value;
//               print('Selected Blood Group: $selectedBloodGroup');
//             });
//           },
//           hint: const Text(
//             'Select Your Blood Group',
//             style: TextStyle(color: Colors.black87, fontSize: 15,fontWeight: FontWeight.w400),
//           ),
//           value: selectedBloodGroup,
//           items: const [
//             DropdownMenuItem<String>(
//               value: 'O-positive',
//               child: Text('O-positive'),
//             ),
//             DropdownMenuItem<String>(
//               value: 'O-negative',
//               child: Text('O-negative'),
//             ),
//             DropdownMenuItem<String>(
//               value: 'B-negative',
//               child: Text('B-negative'),
//             ),
//             DropdownMenuItem<String>(
//               value: 'B-positive',
//               child: Text('B-positive'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class SelectBloodRegister extends StatefulWidget {
  const SelectBloodRegister({Key? key}) : super(key: key);

  @override
  _SelectBloodRegisterState createState() => _SelectBloodRegisterState();
}

class _SelectBloodRegisterState extends State<SelectBloodRegister> {
  String? selectedBloodGroup;
  final TextEditingController bloodGroupController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.085;
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
                controller: bloodGroupController,
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
            if (selectedBloodGroup != null) ...[
              Divider(),
              ListTile(
                title: Text(selectedBloodGroup!),
                onTap: () {
                  setState(() {
                    selectedBloodGroup = null;
                    bloodGroupController.clear();
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
              for (String bloodGroup in ['O-positive', 'O-negative', 'B-negative', 'B-positive'])
                ListTile(
                  title: Text(bloodGroup),
                  onTap: () {
                    setState(() {
                      selectedBloodGroup = bloodGroup;
                      bloodGroupController.text = bloodGroup; 
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
