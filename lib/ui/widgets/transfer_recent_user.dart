import 'package:etam_wallet/shared/themes.dart';
import 'package:flutter/material.dart';

class RecentUser extends StatelessWidget {
  final String img;
  final String fullname;
  final String username;
  final bool isVerified;
  const RecentUser({
    Key? key,
    required this.img,
    required this.fullname,
    required this.username,
    this.isVerified = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 14
      ),
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor
      ),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              img,
            ),
          ),
          SizedBox(width: 14,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                fullname,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: medium
                ),
              ),
              Text(
                '@$username',
                style: greyTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium
                ),
              ),
            ],
          ),
          const Spacer(),
          if (isVerified) 
            Row(
              children: [
                Icon(
                  Icons.check_circle,
                  size: 14,
                  color: lightGreenColor,
                ),  
                SizedBox(width: 4,),
                Text(
                  'Verified',
                  style: greenTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: medium
                  )
                )
              ],
            ),
        ],
      ),
    );
  }
}