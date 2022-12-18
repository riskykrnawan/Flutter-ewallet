import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class SignUpVerifyPage extends StatelessWidget {
  const SignUpVerifyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        children: [
          Container(
            height: 50,
            width: 240,
            margin: const EdgeInsets.only(
              top: 100,
              bottom: 100,
              ),
            decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/img_logo_light.png')),
            ),
          ),
          Text(
            'Verify Your\nAccount',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 22,),
          Container(
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: lightBackgroundColor,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/ic_upload_cloud.png',
                      width: 32,
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Text(
                  'Passport/ID Card',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  )
                  ),
                const SizedBox(height: 30,),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: (){},
                ),
              ]
            ),
          ),
          const SizedBox(height: 60,),
          CustomTextButton(
            title: 'Skip for Now',
            onPressed: () {
              Navigator.pushNamed(context, '/sign-up-success');
            },
          ),
        ],
      ),
    );
  }
}