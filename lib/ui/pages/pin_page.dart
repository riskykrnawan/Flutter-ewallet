import 'package:etam_wallet/blocs/auth/auth_bloc.dart';
import 'package:etam_wallet/shared/shared_methods.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);
  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {

  final TextEditingController pinController = TextEditingController(text: '');
  String pin = '';
  bool isError = false;

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;

    if (authState is AuthSuccess) {
      pin = authState.user.pin!;
    }
  }

  addPin(String num) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text += num;
      });
    }

    if (pinController.text.length == 6) {
      if (pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          isError = true; // karena salah, bintangnya dijadikan merah
        });
        showCustomSnackbar(context, 'PIN yang Anda masukkan salah. Silakan coba lagi');
      }
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        isError = false;  // kalau menghapus, iserror jadikan false
        pinController.text = pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 57
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Etam PIN',
                  style: whiteTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: semiBold
                  )
                ),
                const SizedBox(height: 72,),
                SizedBox(
                  width: 164,
                  height: 59,
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: pinController,
                    cursorColor: greyColor,
                    obscureText: true,
                    obscuringCharacter: '*',
                    enabled: false,
                    style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                      letterSpacing: 10.8,
                      color: isError ? redColor : whiteColor,
                    ),
                    decoration: InputDecoration(
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
                        addPin('1');
                      },
                      ),
                    CustomDarkCircleButton(
                      label: '2',
                      onTap: () {
                        addPin('2');
                      },
                      ),
                    CustomDarkCircleButton(
                      label: '3',
                      onTap: () {
                        addPin('3');
                      },
                      ),
                    CustomDarkCircleButton(
                      label: '4',
                      onTap: () {
                        addPin('4');
                      },
                      ),
                    CustomDarkCircleButton(
                      label: '5',
                      onTap: () {
                        addPin('5');
                      },
                      ),
                    CustomDarkCircleButton(
                      label: '6',
                      onTap: () {
                        addPin('6');
                      },
                      ),
                    CustomDarkCircleButton(
                      label: '7',
                      onTap: () {
                        addPin('7');
                      },
                      ),
                    CustomDarkCircleButton(
                      label: '8',
                      onTap: () {
                        addPin('8');
                      },
                      ),
                    CustomDarkCircleButton(
                      label: '9',
                      onTap: () {
                        addPin('9');
                      },
                      ),
                    const SizedBox(width: 60, height: 60,),
                    CustomDarkCircleButton(
                      label: '0',
                      onTap: () {
                        addPin('0');
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        deletePin();
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
                )
              ],
            ),
          ),
        ),
    );
  }
}