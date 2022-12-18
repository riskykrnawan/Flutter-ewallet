import 'dart:io';

import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TransferAmountPage extends StatefulWidget {
  const TransferAmountPage({Key? key}) : super(key: key);

  @override
  State<TransferAmountPage> createState() => _TransferAmountPageState();
}

class _TransferAmountPageState extends State<TransferAmountPage> {

  final TextEditingController amountController = TextEditingController(text: '0');

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;
      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          decimalDigits: 0,
          symbol: '',
        ).format(
          int.parse(
            text.replaceAll('.', '')
          )
        )
      );
    });
  }

  addAmount(String num) {
    if(num != '0' && amountController.text == '0') {
      setState(() {
        amountController.text = num;
     });
    } else if(amountController.text != '0') {
      setState(() {
        amountController.text += num;
     });
    }
  }

  deleteAmount() {
    if(amountController.text != '0') {
      if (amountController.text.isNotEmpty) {
        setState(() {
          amountController.text = amountController.text.substring(0, amountController.text.length - 1);
        });
      }
    }

    if (amountController.text.length == 1) {
      setState(() {
        amountController.text = '0';
      });
    }
    
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(
          horizontal: 57
        ),
        children: [
          const SizedBox(height: 36,),
          Center(
            child: Text(
              'Total Amount',
              style: whiteTextStyle.copyWith(
                fontSize: 20,
                fontWeight: semiBold
              )
            ),
          ),
          const SizedBox(height: 67,),
          SizedBox(
            width: 200,
            child: TextFormField(
              controller: amountController,
              cursorColor: greyColor,
              enabled: false,
              style: whiteTextStyle.copyWith(
                fontSize: 36,
                fontWeight: medium,
              ),
              decoration: InputDecoration(
                prefixIcon: Text(
                  'Rp. ',
                  style: whiteTextStyle.copyWith(
                    fontSize: 36,
                    fontWeight: medium
                  ),
                ),
                disabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: darkGreyColor
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 66,),
          Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              CustomDarkCircleButton(
                label: '1',
                onTap: () {
                  addAmount('1');
                },
                ),
              CustomDarkCircleButton(
                label: '2',
                onTap: () {
                  addAmount('2');
                },
                ),
              CustomDarkCircleButton(
                label: '3',
                onTap: () {
                  addAmount('3');
                },
                ),
              CustomDarkCircleButton(
                label: '4',
                onTap: () {
                  addAmount('4');
                },
                ),
              CustomDarkCircleButton(
                label: '5',
                onTap: () {
                  addAmount('5');
                },
                ),
              CustomDarkCircleButton(
                label: '6',
                onTap: () {
                  addAmount('6');
                },
                ),
              CustomDarkCircleButton(
                label: '7',
                onTap: () {
                  addAmount('7');
                },
                ),
              CustomDarkCircleButton(
                label: '8',
                onTap: () {
                  addAmount('8');
                },
                ),
              CustomDarkCircleButton(
                label: '9',
                onTap: () {
                  addAmount('9');
                },
                ),
              const SizedBox(width: 60, height: 60,),
              CustomDarkCircleButton(
                label: '0',
                onTap: () {
                  addAmount('0');
                },
              ),
              GestureDetector(
                onTap: () {
                  deleteAmount();
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: darkButtonColor
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )
                    ),
                  ),
              ),
            ]
          ),
          const SizedBox(height: 50,),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Navigator.pushNamed(context, '/pin') == true) {
                Navigator.pushNamedAndRemoveUntil(context, '/transfer-success', (route) => false);
              }
            },
          ),
          const SizedBox(height: 25,),
          CustomTextButton(
            title: 'Terms & Conditions',
            onPressed: () {},
            ),
          const SizedBox(height: 40,),
        ],
      ),
    );
  }
}