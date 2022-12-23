import 'dart:convert';
import 'dart:io';

import 'package:etam_wallet/blocs/auth/auth_bloc.dart';
import 'package:etam_wallet/models/signup_form_model.dart';
import 'package:etam_wallet/shared/shared_methods.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpVerifyPage extends StatefulWidget {
  final SignUpFormModel data;
  const SignUpVerifyPage({Key? key, required this.data}) : super(key: key);

  @override
  State<SignUpVerifyPage> createState() => _SignUpVerifyPageState();
}

class _SignUpVerifyPageState extends State<SignUpVerifyPage> {
  XFile? selectedImage;

  bool validate() {
    if (selectedImage == null) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
          }

        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView(
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
                'Verify Your\nAccount',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(children: [
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
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Passport/ID Card',
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: medium,
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Continue',
                    onPressed: () {
                      if (validate()) {
                        context.read<AuthBloc>().add(
                          AuthRegister(
                            widget.data.copyWith(
                            ktp: selectedImage == null 
                                ? null 
                                : 'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}',
                            ),
                          ),
                        );
                      } else {
                        showCustomSnackbar(
                            context, 'Gambar tidak boleh kosong!');
                      }
                    },
                  ),
                ]),
              ),
              const SizedBox(
                height: 60,
              ),
              CustomTextButton(
                title: 'Skip for Now',
                onPressed: () {
                  context.read<AuthBloc>().add(
                    AuthRegister(
                      widget.data.copyWith(
                      ktp: null
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
