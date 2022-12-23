import 'package:etam_wallet/blocs/auth/auth_bloc.dart';
import 'package:etam_wallet/models/signup_form_model.dart';
import 'package:etam_wallet/shared/shared_methods.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/pages/sign_up_set_profile_page.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:etam_wallet/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController(text: '');
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool validate() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
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

          if (state is AuthCheckEmailSuccess) {
            Navigator.push(
              context, 
              MaterialPageRoute(
                builder: (context) => SignUpSetProfile(
                  data: SignUpFormModel(
                    email: emailController.text,
                    name: nameController.text,
                    password: passwordController.text,
                  )
                )
              )
            );
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
                  image: DecorationImage(
                      image: AssetImage('assets/img_logo_light.png')),
                ),
              ),
              Text(
                'Join Us to Unlock\nYour Growth',
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        title: 'Full Name',
                        controller: nameController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        title: 'Email address',
                        textInputType: TextInputType.emailAddress,
                        controller: emailController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        title: 'Password',
                        obscureText: true,
                        controller: passwordController,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomFilledButton(
                        title: 'Continue',
                        onPressed: () {
                          if (validate()) {
                            context.read<AuthBloc>().add(AuthCheckEmail(emailController.text));
                          } else {
                            showCustomSnackbar(
                                context, 'Semua field harus diisi');
                          }
                        },
                      )
                    ]),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomTextButton(
                title: 'Sign In',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-in');
                },
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          );
        },
      ),
    );
  }
}
