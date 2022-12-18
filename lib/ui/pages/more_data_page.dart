import 'package:etam_wallet/main.dart';
import 'package:etam_wallet/shared/shared_methods.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/bank_item.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';

class MoreDataPage extends StatelessWidget {
  const MoreDataPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beli Data'
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24,),
        children: [
          const SizedBox(height: 15,),
          Text(
            'From Wallet',
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
                    'Balance: ${formatCurrency(180000000)}',
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
            'Select Provider',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 14,),
          const BankItem(
            img: 'assets/img_telkomsel.png',
            label: 'Telkomsel',
            delay: 'Available',
            isSelected: true,
          ),
          const BankItem(
            img: 'assets/img_indosat.png',
            label: 'Indosat Ooredoo',
            delay: 'Available',
          ),
          const BankItem(
            img: 'assets/img_singtel.png',
            label: 'Singtel ID',
            delay: 'Available',
          ),
          const SizedBox(height: 70,),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Navigator.pushNamed(context, '/data-package');
            },
          ),
          const SizedBox(height: 57,),
        ],
      ),
    );
  }
}