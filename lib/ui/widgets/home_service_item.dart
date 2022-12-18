import 'package:etam_wallet/shared/themes.dart';
import 'package:flutter/material.dart';

class HomeServiceItem extends StatelessWidget {
  final String icon;
  final String label;
  final VoidCallback? onTap;

  const HomeServiceItem({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8),
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Center(
              child: Image.asset(
                icon,
                width: 26,
                height: 26,
              ) 
            ),
          ),
          Text(
            label,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 14,
            ),
          )
        ],
      ),
    );
  } 
}