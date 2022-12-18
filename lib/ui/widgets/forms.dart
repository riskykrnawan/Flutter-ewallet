import 'package:etam_wallet/shared/themes.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextInputType textInputType;
  final bool isShowTitle;
  final TextEditingController? controller;

  const CustomTextFormField({
    Key? key,
    required this.title,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.isShowTitle = true,
    this.controller,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (isShowTitle) 
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: medium
            ),
          ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: textInputType,
          decoration: InputDecoration(
            fillColor: whiteColor,
            filled: true,
            hintText: !isShowTitle ? title : '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide(
                color: whiteColor
              )
            ),
            contentPadding: const EdgeInsets.all(12)
          ),
        )
      ],
    );
  }
}