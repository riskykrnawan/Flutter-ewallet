import 'package:etam_wallet/main.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:flutter/material.dart';

class DataPackageItem extends StatelessWidget {
  final String data;
  final String price;
  final bool isSelected;
  const DataPackageItem({
    Key? key,
    required this.data,
    required this.price,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 171,
      margin: const EdgeInsets.only(
        top: 14,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 22,
        ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        border: Border.all(
          color: isSelected ? lightblueColor : whiteColor,
          width: 2,
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            data,
            style: blackTextStyle.copyWith(
              fontSize: 32,
              fontWeight: medium
            ),
          ),
          Text(
            price,
            style: greyTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}