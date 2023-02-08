import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;
  final IconData icon;
  final int maxLines;

  const CTextField({
    super.key,
    required this.controller,
    required this.text,
    required this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: text,
        labelText: text,
        hintStyle: GoogleFonts.inter(
          fontStyle: FontStyle.italic,
        ),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        filled: true,
        fillColor: Color.fromRGBO(217, 217, 217, 4),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        prefixIcon: Icon(
          icon,
          color: Color.fromRGBO(41, 255, 178, 5),
        ),
      ),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter you $text';
        }
        return null;
      },
      maxLines: maxLines,
    );
  }
}
