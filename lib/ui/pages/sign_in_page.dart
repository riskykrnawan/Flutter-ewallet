import 'package:etam_wallet/blocs/auth/auth_bloc.dart';
import 'package:etam_wallet/models/signin_form_model.dart';
import 'package:etam_wallet/shared/shared_methods.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:etam_wallet/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validate() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
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
          if(state is AuthLoading) {
            return const Center (child: CircularProgressIndicator(),);
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
                'Sign In &\nGrow Your Finance',
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
                        height: 8,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text('Forgot Password', style: blueTextStyle),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      CustomFilledButton(
                        title: 'Sign In',
                        onPressed: () {
                          if (validate()) {
                            context.read<AuthBloc>()
                              .add(
                                AuthLogin(
                                  SignInFormModel(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  )
                                )
                              );
                          } else {
                            showCustomSnackbar(
                                context, 'Semua field harus diisi');
                          }
                        },
                      )
                    ]),
              ),
              const SizedBox(
                height: 50,
              ),
              CustomTextButton(
                title: 'Create New Account',
                onPressed: () {
                  Navigator.pushNamed(context, '/sign-up');
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
