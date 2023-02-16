import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:equb_app/Equb/Admin/Service/equbadmin.service.dart';
import 'package:equb_app/Equb/Models/UserEqub.Model.dart';
import 'package:equb_app/Reusables/dialogs.dart';
import 'package:flutter/material.dart';

class AddEqub extends StatefulWidget {
  const AddEqub({super.key});

  @override
  State<AddEqub> createState() => _AddEqubState();
}

class _AddEqubState extends State<AddEqub> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _typeController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _noMembersController = TextEditingController();
  File? _imageFile;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.black,
          title: const Center(
            child: Text(
              'Setting',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.fromLTRB(30, 50, 30, 25),
          decoration: const BoxDecoration(
            color: Color.fromRGBO(237, 237, 237, 4),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    // Pick an image
                    // final XFile? _image =
                    //     await _picker.pickImage(source: ImageSource.gallery);

                    // if (_image != null) {
                    //   setState(() {
                    //     _imageFile = File(_image.path);
                    //     disabled = false;
                    //   });
                    // }
                  },
                  child: _imageFile == null
                      ? DottedBorder(
                          borderType: BorderType.RRect,
                          radius: const Radius.circular(10),
                          dashPattern: [10, 4],
                          strokeCap: StrokeCap.round,
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image,
                                  size: 40,
                                )
                              ],
                            ),
                          ),
                        )
                      : Image.file(
                          _imageFile!,
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.1,
                        ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    labelText: 'Name',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                TextField(
                  controller: _typeController,
                  decoration: InputDecoration(
                    hintText: 'Type',
                    labelText: 'Type',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                TextField(
                  controller: _amountController,
                  decoration: InputDecoration(
                    hintText: 'Amount',
                    labelText: 'Amount',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                TextField(
                  controller: _noMembersController,
                  decoration: InputDecoration(
                    hintText: 'No Members',
                    labelText: 'No Members',
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black, width: 5),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                ElevatedButton(
                  onPressed: () {
                    if (_nameController.text == '' ||
                        _typeController.text == '' ||
                        _amountController.text == '' ||
                        _noMembersController.text == '') {
                      DecoratedDialogs.showError(
                          'please submit all information', context, 'okay');
                      return;
                    } else {
                      AdminEqubService equb = AdminEqubService();
                      EqubModeL equbModeL = EqubModeL(
                          title: _nameController.text,
                          description: _typeController.text,
                          amount: _amountController.text,
                          memberSize: _noMembersController.text);
                      equb.addEqub(equbModeL, context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40),
                    backgroundColor: Colors.black,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                  child: const Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
