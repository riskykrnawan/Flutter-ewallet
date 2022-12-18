import 'package:etam_wallet/main.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/bank_item.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class TopUpPage extends StatelessWidget {
  const TopUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Top Up'
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24,),
        children: [
          const SizedBox(height: 15,),
          Text(
            'Wallet',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              Image.asset(
                'assets/img_card_2.png',
                width: 80,
                height: 55,
              ),
              const SizedBox(width: 16,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1996',
                    style: blackTextStyle.copyWith(
                      fontWeight: medium,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    'Risky Kurniawan',
                    style: greyTextStyle.copyWith(
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 40,),
          Text(
            'Select Bank',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 14,),
          const BankItem(
            img: 'assets/img-bca.png',
            label: 'Bank BCA',
            delay: '50 mins',
            isSelected: true,
          ),
          const BankItem(
            img: 'assets/img-bni.png',
            label: 'Bank BNI',
            delay: '50 mins',
          ),
          const BankItem(
            img: 'assets/img-mandiri.png',
            label: 'Bank Mandiri',
            delay: '50 mins',
          ),
          const BankItem(
            img: 'assets/img-ocbc.png',
            label: 'Bank OCBC',
            delay: '50 mins',
          ),
          const SizedBox(height: 12,),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/top-up-amount');
            },
            ),
          const SizedBox(height: 57,),
        ],
      ),
    );
  }
}