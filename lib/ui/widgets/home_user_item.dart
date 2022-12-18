import 'package:etam_wallet/shared/themes.dart';
import 'package:flutter/material.dart';

class HomeUserItem extends StatelessWidget {
  final String img;
  final String username;
  const HomeUserItem({
    Key? key,
    required this.img,
    required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 17),
      padding: const EdgeInsets.only(
        top: 22
      ),
      width: 90,
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
      ),
      child: Column(children: [
        Container(
          width: 45,
          height: 45,
          margin: EdgeInsets.only(bottom: 13),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(image: AssetImage(img))
          ),
        ),
        Text(
          '@$username',
          style: blackTextStyle.copyWith(
            fontSize: 12,
            fontWeight: medium,
          ),
        )
      ]),
    );
  }
}