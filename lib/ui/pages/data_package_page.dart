import 'package:etam_wallet/shared/shared_methods.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:etam_wallet/ui/widgets/data_package_item.dart';
import 'package:etam_wallet/ui/widgets/forms.dart';
import 'package:flutter/material.dart';

class DataPackagePage extends StatelessWidget {
  const DataPackagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Paket Data'
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(height: 15,),
          Text(
            'Phone Number',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),
          const SizedBox(height: 14,),
          const CustomTextFormField(title: '+628', isShowTitle: false,),
          const SizedBox(height: 40,),
          Text(
            'Select Package',
            style: blackTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semiBold
            ),
          ),
          Wrap(
            spacing: 24,
            runSpacing: 18,
            children: [
              DataPackageItem(data: '10GB', price: formatCurrency(218000)),
              DataPackageItem(data: '25GB', price: formatCurrency(420000)),
              DataPackageItem(data: '40GB', price: formatCurrency(2500000), isSelected: true,),
              DataPackageItem(data: '99GB', price: formatCurrency(5000000)),
            ],
          ),
          SizedBox(height: 20),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(context, '/data-success', (route) => false);
              }
            },
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}