import 'package:etam_wallet/shared/themes.dart';
import 'package:flutter/material.dart';

class ResultUser extends StatelessWidget {
  final String img;
  final String fullname;
  final String username;
  final bool isVerified;
  final bool isSelected;
  const ResultUser({
    Key? key,
    required this.img,
    required this.fullname,
    required this.username,
    this.isVerified = false,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
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
        children: [
          isVerified ? 
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(image: AssetImage(img)),
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 16,
                  height: 16,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: whiteColor,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_circle,
                      color: lightGreenColor,
                      size: 14,
                    ),
                  ),
                )
              ),
            ) :
            Image.asset(
              img,
              width: 70,
              height: 70,
            ),
          const SizedBox(height: 13,),
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
    );
  }
}