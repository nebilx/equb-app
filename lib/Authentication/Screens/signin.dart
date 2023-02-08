import 'package:equb_app/component/button.dart';
import 'package:equb_app/component/passwordtextfield.dart';
import 'package:equb_app/component/textfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _signInFormKey = GlobalKey<FormState>();

  final TextEditingController _userController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userController.dispose();
    _passwordController.dispose();
  }

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
            Image.asset(
              'assets/images/dan_equb.png',
              height: MediaQuery.of(context).size.height / 3.5,
              width: MediaQuery.of(context).size.width / 1.5,
              fit: BoxFit.contain,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.1,
              height: MediaQuery.of(context).size.height / 2.5,
              // decoration: BoxDecoration(
              //     color: Color.fromRGBO(84, 84, 84, 4),
              //     boxShadow: [
              //       BoxShadow(
              //           color: Colors.black.withOpacity(.15),
              //           blurRadius: 30,
              //           offset: Offset(0, 10))
              //     ],
              //     borderRadius: BorderRadius.circular(20)),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(84, 84, 84, 4),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Padding(
                  //   padding:
                  //       const EdgeInsets.only(left: 30, top: 15, bottom: 10),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, top: 20, bottom: 10),
                    child: RichText(
                      text: TextSpan(
                        text: 'Sign In',
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
                        key: _signInFormKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 20, right: 20, bottom: 20, top: 20),
                              child: CTextField(
                                controller: _userController,
                                text: 'Username',
                                icon: Icons.person,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: CPTextField(
                                  controller: _passwordController,
                                  text: 'Password'),
                            ),
                            CButton(
                              text: 'Sign In',
                              onTap: () {},
                              color: Color.fromRGBO(41, 255, 178, 5),
                            )
                          ],
                        ),
                      ),

                      // TextButton(
                      //   onPressed: () {},
                      //   child: Text(
                      //     'Forgot password',
                      //     style: TextStyle(
                      //         color: Colors.greenAccent, fontSize: 12),
                      //   ),
                      // ),
                    ],
                  )
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
