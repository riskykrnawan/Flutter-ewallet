import 'package:etam_wallet/shared/themes.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  
  const CustomFilledButton({
    Key? key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(56)
          )
        ),
        child: Text(
          title, 
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 16
          ),
          )
          ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;
  
  const CustomTextButton({
    Key? key,
    required this.title,
    this.onPressed,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: Text(
          title,
          style: greyTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 16
          ),
        ),
      ),
    );
  }
}

class CustomDarkCircleButton extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;
  const CustomDarkCircleButton({
    Key? key,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: darkButtonColor
        ),
        child: Center(
          child: Text(
            label,
            style: whiteTextStyle.copyWith(
              fontSize: 22,
              fontWeight: semiBold,
            ),
          ),
        ),
      ),
    );
  }
}