import 'package:etam_wallet/shared/themes.dart';
import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {
  final String img;
  final String label;
  final String delay;
  final bool isSelected;
  const BankItem({
    Key? key,
    required this.img,
    required this.label,
    required this.delay,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 18,
        ),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          border: isSelected ?
          Border.all(
            width: 2,
            color: lightblueColor
          ) : Border()
        ),
        child: Row(
          children: [
            Image.asset(
              img,
              height: 30,
            ),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  label,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium
                  ),
                ),
                Text(
                  delay,
                  style: greyTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}