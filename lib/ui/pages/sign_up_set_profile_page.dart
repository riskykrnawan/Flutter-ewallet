import 'dart:convert';
import 'dart:io';

import 'package:etam_wallet/models/signup_form_model.dart';
import 'package:etam_wallet/shared/shared_methods.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/pages/sign_up_verify_page.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:etam_wallet/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class SignUpSetProfile extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpSetProfile({Key? key, required this.data}) : super(key: key);

  @override
  State<SignUpSetProfile> createState() => _SignUpSetProfileState();
}

class _SignUpSetProfileState extends State<SignUpSetProfile> {
  final pinController = TextEditingController(text: '');
  XFile? selectedImage;

  bool validate() {
    if (pinController.text.length != 6) {
      return false;
    }

    return true;
  }


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
            'Join Us to Unlock\nYour Growth',
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
                GestureDetector(
                  onTap: () async {
                    final image = await selectImage();
                    setState(() {
                      selectedImage = image;
                    });
                  },
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBackgroundColor,
                      image: selectedImage == null
                        ? null 
                        : DecorationImage(
                          fit: BoxFit.cover,
                          image: FileImage(
                            File(selectedImage!.path)
                          )
                        ),
                    ),
                    child: selectedImage != null ? null : Center( // kalau ada fotonya maka hapus ikon awan dengan cara kasih null, klo gaada kasih gambar awan
                      child: Image.asset(
                        'assets/ic_upload_cloud.png',
                        width: 32,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16,),
                Text(
                  'Shayna Hanna',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: medium,
                  )
                  ),
                const SizedBox(height: 30,),
                CustomTextFormField(
                  title: 'Set PIN (6 digit number)',
                  obscureText: true,
                  textInputType: TextInputType.number,
                  controller: pinController,
                ),
                const SizedBox(height: 30,),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: (){
                    if (validate()) {
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => SignUpVerifyPage(
                            data: widget.data.copyWith(
                              pin: pinController.text,
                              profilePicture: selectedImage == null 
                              ? null 
                              : 'data:image/png;base64,' + base64Encode(File(selectedImage!.path).readAsBytesSync()),
                            ),
                          ),
                        ),
                      );
                    } else {
                      showCustomSnackbar(context, 'PIN harus 6 digit');
                    }
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