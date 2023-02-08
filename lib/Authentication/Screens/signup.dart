import 'package:dotted_border/dotted_border.dart';
import 'package:equb_app/component/button.dart';
import 'package:equb_app/component/passwordtextfield.dart';
import 'package:equb_app/component/textfield.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _signUpFormKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // padding: const EdgeInsets.fromLTRB(30, 130, 30, 25),
        width: MediaQuery.of(context).size.height,
        height: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Color.fromRGBO(237, 237, 237, 4),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 1.35,
              decoration: BoxDecoration(
                color: Color.fromRGBO(84, 84, 84, 4),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'Sign Up',
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                    thickness: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Form(
                        key: _signUpFormKey,
                        child: Column(
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, right: 20, top: 20),
                                child: GestureDetector(
                                  onTap: () async {
                                    FilePickerResult? _res =
                                        await FilePicker.platform.pickFiles(
                                            allowMultiple: false,
                                            type: FileType.custom,
                                            allowedExtensions: ['jpg', 'png']);
                                    if (_res != null) {
                                      setState(() {});
                                    }
                                  },
                                  child: DottedBorder(
                                      borderType: BorderType.RRect,
                                      color: Colors.white,
                                      radius: const Radius.circular(40),
                                      dashPattern: [10, 4],
                                      strokeCap: StrokeCap.round,
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                4,
                                        height:
                                            MediaQuery.of(context).size.height /
                                                9,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.image,
                                              size: 40,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      )),
                                )),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 20),
                              child: CTextField(
                                controller: _nameController,
                                text: 'Name',
                                icon: Icons.person,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: CTextField(
                                controller: _emailController,
                                text: 'Email',
                                icon: Icons.email,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20),
                              child: CTextField(
                                controller: _userController,
                                text: 'Username',
                                icon: Icons.person_outlined,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: CPTextField(
                                controller: _passwordController,
                                text: 'Password',
                              ),
                            ),
                            CButton(
                              text: 'Sign Up',
                              onTap: () {},
                              color: Color.fromRGBO(125, 255, 115, 4),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Image.asset(
              'assets/images/dan_energy_black.png',
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2.9,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
