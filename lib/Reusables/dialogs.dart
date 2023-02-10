import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:panara_dialogs/panara_dialogs.dart';

class DecoratedDialogs {
  static showError(String message, BuildContext context, String buttonText) {
    PanaraInfoDialog.show(
        color: Colors.black,
        textColor: Colors.black,
        barrierDismissible: false,
        context,
        message: message,
        buttonText: buttonText, onTapDismiss: () {
      Navigator.of(context).pop();
    }, panaraDialogType: PanaraDialogType.custom);
    return;
  }

  static showSuccess(String message, BuildContext context, String buttonText) {
    PanaraInfoDialog.show(
        imagePath: 'assets/images/equb_logo.png',
        barrierDismissible: false,
        context,
        message: message,
        buttonText: buttonText, onTapDismiss: () {
      Navigator.of(context).pop();
    }, panaraDialogType: PanaraDialogType.success);
    return;
  }
}
