import 'package:etam_wallet/blocs/auth/auth_bloc.dart';
import 'package:etam_wallet/models/pin_model.dart';
import 'package:etam_wallet/shared/shared_methods.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/widgets/buttons.dart';
import 'package:etam_wallet/ui/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileEditPinPage extends StatefulWidget {
  const ProfileEditPinPage({Key? key}) : super(key: key);

  @override
  State<ProfileEditPinPage> createState() => _ProfileEditPinPageState();
}

class _ProfileEditPinPageState extends State<ProfileEditPinPage> {
  final oldPinController = TextEditingController(text: '');
  final newPinController = TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit PIN'),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is AuthFailed) {
            showCustomSnackbar(context, state.e);
          }

          if (state is AuthSuccess) {
            Navigator.pushNamedAndRemoveUntil(context, '/profile-edit-success', (route) => false);
          }
        },
        builder: (context, state) {
          if(state is AuthLoading) {
            return const Center (child: CircularProgressIndicator(),);
          }

          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              const SizedBox(
                height: 15,
              ),
              Container(
                height: 294,
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: whiteColor,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        title: 'Old PIN',
                        obscureText: true,
                        controller: oldPinController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextFormField(
                        title: 'New PIN',
                        obscureText: true,
                        controller: newPinController,
                      ),
                      const SizedBox(height: 30),
                      CustomFilledButton(
                        title: 'Update Now',
                        onPressed: () {
                          context.read<AuthBloc>()
                            .add(
                              AuthUpdatePin(
                                PinModel(
                                  oldPin: oldPinController.text,
                                  newPin: newPinController.text,
                                ),
                              ),
                            );
                        },
                      )
                    ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
