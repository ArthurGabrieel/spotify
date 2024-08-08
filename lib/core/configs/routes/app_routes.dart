import '../../../presentation/auth/pages/signup_or_signin.dart';
import '../../../presentation/choose_mode/pages/choose_mode.dart';
import '../../../presentation/intro/pages/get_started.dart';
import '../../../presentation/splash/pages/splash.dart';

class AppRoutes {
  static const String splash = '/';
  static const String intro = '/intro';
  static const String chooseMode = '/choose-mode';
  static const String signupOrSignin = '/signup-or-signin';

  static get routes => {
        splash: (context) => const SplashPage(),
        intro: (context) => const GetStartedPage(),
        chooseMode: (context) => const ChooseModePage(),
        signupOrSignin: (context) => const SignupOrSigninPage(),
      };
}
