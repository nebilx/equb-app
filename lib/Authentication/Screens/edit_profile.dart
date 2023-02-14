// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equb_app/Authentication/Shared/Shared.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _name = TextEditingController();
    final TextEditingController _email = TextEditingController();
    final TextEditingController _pwd = TextEditingController();
    final TextEditingController _pno = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_left_outlined,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Center(
            child: Text(
              'Setting',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Column(children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            image,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.black,
                            ),
                            child: Icon(
                              Icons.camera,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                        child: Column(
                      children: [
                        TextInput(
                          text: 'name',
                          controller: _name,
                          icon: Icons.person,
                        ),
                        SizedBox(height: 20),
                        TextInput(
                          text: 'email',
                          controller: _email,
                          icon: Icons.mail,
                        ),
                        SizedBox(height: 20),
                        TextInput(
                          text: 'phone number',
                          controller: _pno,
                          icon: Icons.phone,
                        ),
                        SizedBox(height: 20),
                        TextInput(
                          text: 'password',
                          controller: _pwd,
                          icon: Icons.password,
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              side: BorderSide.none,
                              shape: StadiumBorder(),
                            ),
                            onPressed: (() {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UpdateProfile()));
                            }),
                            child: Text(
                              'Update Profile',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
                  )
                ]))));
  }
}

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.controller,
    required this.text,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: Text(text),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
