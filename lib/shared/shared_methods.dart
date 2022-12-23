import 'package:another_flushbar/flushbar.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';

void showCustomSnackbar(BuildContext context, String message) {
  Flushbar(
    message: message,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: redColor,
    duration: Duration(seconds: 2),
  ).show(context);
}

String formatCurrency(
  num number,
  { String symbol = 'Rp ' }
) {
  return NumberFormat.currency(
    locale: 'id',
    symbol: symbol,
    decimalDigits: 0,
  ).format(number);
}

// Nullable karena ketika user tidak jadi menginputkan gambar, maka kembalikan null
Future<XFile?> selectImage() async {
  XFile? selectedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
  return selectedImage;
}