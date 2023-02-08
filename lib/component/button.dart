// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color? color;

  const CButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(50, 40),
        backgroundColor: color,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
      ),
      child: Text(
        text,
        // style: TextStyle(
        //   color: color == null ? Colors.white : Colors.black,
        // ),
        style: GoogleFonts.inter(
          color: color == null ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
