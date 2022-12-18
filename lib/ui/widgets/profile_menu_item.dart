import 'package:etam_wallet/shared/themes.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String icon;
  final String label;
  final int notifCount;
  final VoidCallback? onTap; 

  const ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.label,
    this.notifCount = 0,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 24,
              height: 24,
            ),
            const SizedBox(width: 18,),
            Text(
              label,
              style: blackTextStyle.copyWith(
                fontSize: 14,
                fontWeight: medium,
              ),
            ),
            const Spacer(),
            if (notifCount > 0)  Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lightblueColor,
              ),
              child: Center(
                child: Text(
                  notifCount.toString(),
                  style: whiteTextStyle.copyWith(
                    fontSize: 14,
                    fontWeight: medium,
                  )
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}