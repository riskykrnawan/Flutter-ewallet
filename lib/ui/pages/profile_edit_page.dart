import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:etam_wallet/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class ProfileEditPage extends StatelessWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile'
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24
        ),
        children: [
          const SizedBox(height: 15,),
          Container(
            height: 480,
            padding: const EdgeInsets.all(22),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextFormField(title: 'Username'),
                const SizedBox(height: 16),
                const CustomTextFormField(title: 'Full Name'),
                const SizedBox(height: 16),
                const CustomTextFormField(
                  title: 'Email address',
                  textInputType: TextInputType.emailAddress,
                  ),
                const SizedBox(height: 16),
                const CustomTextFormField(title: 'Password', obscureText: true,),
                const SizedBox(height: 30,),
                CustomFilledButton(
                  title: 'Update Now',
                  onPressed: (){
                    Navigator.pushNamed(context, '/profile-edit-success');
                  },
                )
              ]
            ),
          ),
        ],
      ),
    );
  }
}