import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CPTextField extends StatefulWidget {
  final TextEditingController controller;
  final String text;

  const CPTextField({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  State<CPTextField> createState() => _CPTextFieldState();
}

class _CPTextFieldState extends State<CPTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _obscureText,
      maxLength: 8,
      controller: widget.controller,
      decoration: InputDecoration(
          hintText: widget.text,
          labelText: widget.text,
          hintStyle: GoogleFonts.inter(
            fontStyle: FontStyle.italic,
          ),
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(20))),
          filled: true,
          fillColor: Color.fromRGBO(217, 217, 217, 4),
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          prefixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
            child: Icon(
              _obscureText ? Icons.visibility : Icons.visibility_off,
              color: Color.fromRGBO(125, 255, 115, 4),
            ),
          )),
      validator: (val) {
        if (val == null || val.isEmpty) {
          return 'Enter you ${widget.text}';
        }
        return null;
      },
    );
  }
}
