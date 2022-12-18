import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:etam_wallet/ui/widgets/forms.dart';
import 'package:etam_wallet/ui/widgets/transfer_recent_user.dart';
import 'package:etam_wallet/ui/widgets/transfer_result_user.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({Key? key}) : super(key: key);

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData screen = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: lightBackgroundColor,
      appBar: AppBar(
        title: const Text(
          'Transfer'
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 15,),
          Text(
            'Search',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 14,),
          const CustomTextFormField(title: 'by username', isShowTitle: false,),
          // textController.text == '' ? buildRecentUsers(context) : buildResultUsers(context)
          buildResultUsers(context),
          SizedBox(height: screen.size.height/3 - 60),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/transfer-amount');
            },
          ),
        ],
      ),
    );
  }

  Widget buildRecentUsers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          'Recent Users',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold
          ),
        ),
        RecentUser(img: 'assets/img_photo_1.png', fullname: 'Yonna Jie', username: 'yeonna', isVerified: true,),
        RecentUser(img: 'assets/img_photo_2.png', fullname: 'John Hi', username: 'jhi'),
        RecentUser(img: 'assets/img_photo_3.png', fullname: 'Masayoshi', username: 'form'),
        RecentUser(img: 'assets/img_photo_4.png', fullname: 'Yoon', username: 'yoon'),
      ],
    );
  }

  Widget buildResultUsers(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 40,
        ),
        Text(
          'Result',
          style: blackTextStyle.copyWith(
            fontSize: 16,
            fontWeight: semiBold
          ),
        ),
        Wrap(
          spacing: 17,
          children: const [
            ResultUser(img: 'assets/img_photo_1.png', fullname: 'Yonna Jie', username: 'yeonna', isVerified: true,),
            ResultUser(img: 'assets/img_photo_4.png', fullname: 'Yoon', username: 'yoon', isSelected: true,),
          ],
        )
      ],
    );
  }
}