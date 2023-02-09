import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:equb_app/Authentication/Models/usermodel.dart';
import 'package:equb_app/Authentication/Models/usermodel.dart';
import 'package:equb_app/Authentication/Screens/signin.dart';
import 'package:equb_app/Authentication/Services/auth.services.dart';
import 'package:equb_app/Reusables/dialogs.dart';
import 'package:equb_app/Authentication/Services/auth.services.dart';
import 'package:equb_app/Reusables/dialogs.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isChecked = false;
  bool _obscureText = true;
  bool disabled = true;
  // final ImagePicker _picker = ImagePicker();
  final _signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  File? _imageFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 130, 30, 25),
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
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  labelText: 'Full Name',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  focusColor: Colors.amberAccent,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.black, width: 5),
                  ),
                ),
                initialCountryCode: 'ET',
                onChanged: (phone) {
                  _phoneController.text = phone.completeNumber;
                  _phoneController.text = phone.completeNumber;
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              TextField(
                controller: _userController,
                decoration: InputDecoration(
                  hintText: 'Username',
                  labelText: 'Username',
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              TextField(
                obscureText: _obscureText,
                controller: _passwordController,
                decoration: InputDecoration(
                  hintText: 'Password',
                  labelText: 'Password',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black, width: 5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              ElevatedButton(
                onPressed: () {
                  if (_nameController.text == '' ||
                      _phoneController.text == '' ||
                      _userController.text == '' ||
                      _passwordController.text == '') {
                    DecoratedDialogs.showError(
                        'please submit all information', context, 'okay');
                    return;
                  } else {
                    User user = User(
                        username: _userController.text,
                        phonenumber: _phoneController.text,
                        fullname: _nameController.text,
                        password: _passwordController.text);
                    Auth mAuth = Auth();
                    mAuth.signup(user, context);
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
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    'Already have account? ',
                    style: TextStyle(
                      color: Color(0xFF103265),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(fontSize: 15, color: Color(0xFF536DF8)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
