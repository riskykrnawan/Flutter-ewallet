import 'package:etam_wallet/blocs/auth/auth_bloc.dart';
import 'package:etam_wallet/shared/themes.dart';
import 'package:etam_wallet/ui/pages/data_package_page.dart';
import 'package:etam_wallet/ui/pages/data_success_page.dart';
import 'package:etam_wallet/ui/pages/home_page.dart';
import 'package:etam_wallet/ui/pages/more_data_page.dart';
import 'package:etam_wallet/ui/pages/onboarding_pages.dart';
import 'package:etam_wallet/ui/pages/pin_page.dart';
import 'package:etam_wallet/ui/pages/profil_edit_pin.dart';
import 'package:etam_wallet/ui/pages/profil_edit_success.dart';
import 'package:etam_wallet/ui/pages/profile_edit_page.dart';
import 'package:etam_wallet/ui/pages/profile_page.dart';
import 'package:etam_wallet/ui/pages/sign_in_page.dart';
import 'package:etam_wallet/ui/pages/sign_up_page.dart';
import 'package:etam_wallet/ui/pages/sign_up_set_profile_page.dart';
import 'package:etam_wallet/ui/pages/sign_up_success_page.dart';
import 'package:etam_wallet/ui/pages/sign_up_verify_page.dart';
import 'package:etam_wallet/ui/pages/splash_page.dart';
import 'package:etam_wallet/ui/pages/top_up_amount_page.dart';
import 'package:etam_wallet/ui/pages/top_up_page.dart';
import 'package:etam_wallet/ui/pages/top_up_success_page.dart';
import 'package:etam_wallet/ui/pages/transfer_amount_page.dart';
import 'package:etam_wallet/ui/pages/transfer_page.dart';
import 'package:etam_wallet/ui/pages/transfer_success_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) =>AuthBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            toolbarHeight: 76,
            backgroundColor: lightBackgroundColor,
            elevation: 0,
            centerTitle: true,
            iconTheme: IconThemeData(
              color: blackColor
            ),
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold
            ),
            
          )
        ),
        routes: {
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          
          '/sign-in': (context) => const SignInPage(),
    
          '/sign-up': (context) => const SignUpPage(),
          // '/sign-up-set-profile': (context) => const SignUpSetProfile(),
          '/sign-up-verify': (context) => const SignUpVerifyPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          
          '/pin': (context) => const PinPage(),
          
          '/home': (context) => const HomePage(),
          
          '/profile': (context) => const ProfilePage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
    
          '/top-up': (context) => const TopUpPage(),
          '/top-up-amount': (context) => const TopUpAmountPage(),
          '/top-up-success': (context) => const TopUpSuccessPage(),
    
    
          '/transfer': (context) => const TransferPage(),
          '/transfer-amount': (context) => const TransferAmountPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
    
          '/more-data': (context) => const MoreDataPage(),
          '/data-package': (context) => const DataPackagePage(),
          '/data-success': (context) => const DataSuccessPage(),
        },
      ),
    );
  }
}