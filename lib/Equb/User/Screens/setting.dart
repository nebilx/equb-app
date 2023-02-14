import 'package:equb_app/Authentication/Screens/edit_profile.dart';
import 'package:equb_app/Authentication/Screens/signin.dart';
import 'package:equb_app/Authentication/Shared/Shared.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 40),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    height: MediaQuery.of(context).size.height * 0.17,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                          image,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.06,
                        height: MediaQuery.of(context).size.height * 0.03,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          color: Colors.black,
                        ),
                        child: const Icon(
                          Icons.pin_end,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                fullname,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'Phone:- $phone',
                style: const TextStyle(fontSize: 13),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.5,
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.black,
              //       side: BorderSide.none,
              //       shape: const StadiumBorder(),
              //     ),
              //     onPressed: (() {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => UpdateProfile()));
              //     }),
              //     child: Text(
              //       'Edit Profile',
              //       style: TextStyle(
              //         color: Colors.white,
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03),
              const Divider(thickness: 4),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ProfileMenuWidget(
                title: 'Contact Us',
                icon: Icons.contacts,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Term Policy',
                icon: Icons.policy,
                onPress: () {},
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              const Divider(thickness: 4),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              ProfileMenuWidget(
                title: 'About',
                icon: Icons.info,
                onPress: () {},
              ),
              ProfileMenuWidget(
                title: 'Logout',
                icon: Icons.logout_outlined,
                textColor: Colors.red,
                endIcon: false,
                onPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignIn()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: MediaQuery.of(context).size.width * 0.04,
        height: MediaQuery.of(context).size.width * 0.04,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.black26.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: Colors.black,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: 15,
          fontWeight: FontWeight.w800,
        ),
      ),
      trailing: endIcon
          ? Container(
              width: MediaQuery.of(context).size.width * 0.03,
              height: MediaQuery.of(context).size.width * 0.03,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Icon(
                Icons.arrow_right,
                color: Colors.black,
                size: 20,
              ),
            )
          : null,
    );
  }
}
