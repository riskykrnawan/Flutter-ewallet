import 'package:etam_wallet/shared/shared_methods.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/home_latest_transaction_item.dart';
import 'package:etam_wallet/ui/widgets/home_service_item.dart';
import 'package:etam_wallet/ui/widgets/home_tips_item.dart';
import 'package:etam_wallet/ui/widgets/home_user_item.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(       
        color: whiteColor,
        shape: CircularNotchedRectangle(),
        clipBehavior: Clip.antiAlias,
        notchMargin: 6,
        elevation: 0,
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: whiteColor,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: lightblueColor,
          unselectedItemColor: blackColor,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: blueTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          unselectedLabelStyle: blackTextStyle.copyWith(
            fontSize: 10,
            fontWeight: medium,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_layers.png',
                width: 20,
                color: lightblueColor,
                ),
              label: 'Overview'
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_file_text.png',
                width: 20,
                ),
              label: 'History'
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_trending_up.png',
                width: 20,
                ),
              label: 'Stitistic'
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/ic_gift.png',
                width: 20,
                ),
              label: 'Reward'
            ),
          ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: blueColor,
        child: Image.asset(
          'assets/ic_plus_circle.png',
          width: 24,
        ),
        onPressed: () {}
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(child: 
        ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            buildProfileSection(context),
            buildWalletCardSection(),
            buildLevelSection(),
            buildServicesSection(context),
            buildLastestTransactionSection(),
            buildSendAgainSection(),
            buildFriendlyTipsSection()
        ]),
      )
    );
  }

  Widget buildProfileSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 40,
      ),
      child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Howdy,',
                  style: greyTextStyle.copyWith(
                    fontSize: 16
                  ),
                ),
                const SizedBox(height: 2,),
                Text(
                  'shaynahan',
                  style: blackTextStyle.copyWith(
                    fontWeight: semiBold,
                    fontSize: 20
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/profile');
              },
              child: Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(image: AssetImage('assets/img_photo_profile.png')),
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
              ),
            )
          ],
        ),
    );
  }
  Widget buildWalletCardSection() {
    return Container(
      width: double.infinity,
      height: 220,
      margin: EdgeInsets.only(top: 30),
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/img_bg_card.png'),
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Shayna Hanna',
            style: whiteTextStyle.copyWith(
              fontWeight: medium,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 28,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '**** **** **** 1280',
                style: whiteTextStyle.copyWith(
                  fontWeight: medium,
                  fontSize: 18,
                  letterSpacing: 5
                ),
              ),
            ],
          ),
          SizedBox(height: 21),
          Text(
            'Balance',
            style: whiteTextStyle
          ),
          Text(
            formatCurrency(12500),
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 24,
            ),
          ),
        ],
      ),
    );
  }
  Widget buildLevelSection() {
    return Container(
      width: double.infinity,
      height: 80,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(22),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Level 1',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: medium
                ),
              ),
              const Spacer(),
              Text(
                '55%',
                style: greenTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold
                ),
              ),
              Text(
                ' of ${formatCurrency(20000)}',
                style: blackTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semiBold
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(55),
            child: LinearProgressIndicator(
              minHeight: 5,
              value: 0.55,
              valueColor: AlwaysStoppedAnimation(lightGreenColor),
              backgroundColor: lightBackgroundColor,
            ),
          )
        ]
      ),
    );
  }
  Widget buildServicesSection(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do Something',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          const SizedBox(height: 14,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              HomeServiceItem(
                icon: 'assets/ic_download.png',
                label: 'Top Up',
                onTap: () {
                  Navigator.pushNamed(context, '/top-up');
                },
              ),
              HomeServiceItem(
                icon: 'assets/ic_repeat.png',
                label: 'Send',
                onTap: () {
                  Navigator.pushNamed(context, '/transfer');
                },
              ),
              HomeServiceItem(
                icon: 'assets/ic_upload.png',
                label: 'Withdraw',
                onTap: () {
                },
              ),
              HomeServiceItem(
                icon: 'assets/ic_grid.png',
                label: 'More',
                onTap: () {
                  showDialog(context: context, builder: (context) => const MoreDialog());
                },
              ),
            ],
          ),
        ]
      ),
    );
  }
  Widget buildLastestTransactionSection() {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Latest Transactions',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              top: 14
            ),
            padding: const EdgeInsets.only(
              top: 22,
              right: 22,
              bottom: 4,
              left: 22,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: whiteColor,
            ),
            child: Column(children: [
              HomeLatestTransactionItem(
                icon: 'assets/img_transaction_category_1.png', 
                title: 'Top Up', 
                time: 'Yesterday', 
                value: '+ ${formatCurrency(450000)}'
              ),
              HomeLatestTransactionItem(
                icon: 'assets/img_transaction_category_2.png', 
                title: 'Cashback', 
                time: 'Sep 11', 
                value: '+ ${formatCurrency(22000)}'
              ),
              HomeLatestTransactionItem(
                icon: 'assets/img_transaction_category_3.png', 
                title: 'Withdraw', 
                time: 'Sep 2', 
                value: '- ${formatCurrency(5000)}'
              ),
              HomeLatestTransactionItem(
                icon: 'assets/img_transaction_category_4.png', 
                title: 'Transfer', 
                time: 'Aug 27', 
                value: '- ${formatCurrency(123500)}'
              ),
              HomeLatestTransactionItem(
                icon: 'assets/img_transaction_category_5.png', 
                title: 'Electric', 
                time: 'Feb 18', 
                value: '- ${formatCurrency(12300000)}'
              ),
            ]),
          )
      ] ,
      ),
    );
  }
  Widget buildSendAgainSection() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Send Again',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16
            ),
          ),
          SizedBox(height: 14,),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: const [
                HomeUserItem(img: 'assets/img_photo_1.png', username: 'yuanita'),
                HomeUserItem(img: 'assets/img_photo_2.png', username: 'jani'),
                HomeUserItem(img: 'assets/img_photo_3.png', username: 'urip'),
                HomeUserItem(img: 'assets/img_photo_4.png', username: 'masa'),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget buildFriendlyTipsSection() {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Friendly Tips',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),
          Wrap(
            spacing: 17,
            children: const [
              HomeTipsItem(img: 'assets/img_cover_2.png', title: 'Best tips for using a credit card', url: 'https://www.google.com/'),
              HomeTipsItem(img: 'assets/img_cover_4.png', title: 'Spot the good pie of finance model', url: 'https://www.google.com/'),
              HomeTipsItem(img: 'assets/img_cover_3.png', title: 'Great hack to get better advices', url: 'https://pub.dev/'),
              HomeTipsItem(img: 'assets/img_cover_1.png', title: 'Save more penny buy this instead', url: 'https://www.google.com/'),
                ],
          ),
          SizedBox(height: 50,),
        ]),
    );
  }
}


class MoreDialog extends StatelessWidget {
  const MoreDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      alignment: Alignment.bottomCenter,
      content: Container(
        height: 326,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: lightBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Do More With Us',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
            const SizedBox(height: 13,),
            Wrap(
              spacing: 35,
              runSpacing: 29,
              children: [
                HomeServiceItem(
                  icon: 'assets/ic_smartphone.png',
                  label: 'Data',
                  onTap: () {
                    Navigator.pushNamed(context, '/more-data');
                  },
                ),
                HomeServiceItem(
                  icon: 'assets/ic_droplet.png',
                  label: 'Water',
                  onTap: () {
                  },
                ),
                HomeServiceItem(
                  icon: 'assets/ic_twitch.png',
                  label: 'Stream',
                  onTap: () {
                  },
                ),
                HomeServiceItem(
                  icon: 'assets/ic_tv.png',
                  label: 'Movie',
                  onTap: () {
                  },
                ),
                HomeServiceItem(
                  icon: 'assets/ic_coffee.png',
                  label: 'Food',
                  onTap: () {
                  },
                ),
                HomeServiceItem(
                  icon: 'assets/ic_globe.png',
                  label: 'Travel',
                  onTap: () {
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}