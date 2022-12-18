import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:etam_wallet/ui/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: Icon(Icons.chevron_left, color: blackColor, size: 30,),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        title: const Text('My Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24
        ),
        children: [
          const SizedBox(height: 15,),
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 22,
              horizontal: 30
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor
            ),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(image: AssetImage('assets/img_photo_profile.png')),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 27,
                      height: 27,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: whiteColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.check_circle,
                          color: lightGreenColor,
                          size: 24,
                        ),
                      ),
                    )
                  ),
                ),
                const SizedBox(height: 16,),
                Text(
                  'Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 18
                  ),
                ),
                const SizedBox(height: 10,),
                ProfileMenuItem(
                  icon: 'assets/ic_user.png',
                  label: 'Edit Profil',
                  onTap: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      Navigator.pushNamed(context, '/profile-edit');
                    }
                  }
                ),
                ProfileMenuItem(
                  icon: 'assets/ic_shield.png',
                  label: 'My PIN',
                  onTap: () async {
                    if (await Navigator.pushNamed(context, '/pin') == true) {
                      Navigator.pushNamed(context, '/profile-edit-pin');
                    }
                  }
                ),
                ProfileMenuItem(
                  icon: 'assets/ic_credit-card.png',
                  label: 'Wallet Settings',
                  onTap: () {}
                ),
                ProfileMenuItem(
                  icon: 'assets/ic_award.png',
                  label: 'My Rewards', 
                  notifCount: 2,
                  onTap: () {}
                ),
                ProfileMenuItem(
                  icon: 'assets/ic_sidebar.png',
                  label: 'Help Center',
                  onTap: () {}
                ),
                ProfileMenuItem(
                  icon: 'assets/ic_log-out.png',
                  label: 'Log Out',
                  onTap: () {}
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          const CustomTextButton(title: 'Report a Problem'),
        ],
      ),
    );
  }
}