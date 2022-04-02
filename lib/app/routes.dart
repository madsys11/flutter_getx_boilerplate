import 'package:get/get_navigation/src/routes/get_route.dart';

import '../binding/post_binding.dart';
import '../binding/signin_binding.dart';
import '../binding/signout_binding.dart';
import '../binding/splash_binding.dart';
import '../ui/screen/home/home_screen.dart';
import '../ui/screen/signin/signin_screen.dart';
import '../ui/screen/splash/splash_screen.dart';

class RouteName {
  static const String splash = '/splash';
  static const String signin = '/signin';
  static const String home = '/home';
}

final List<GetPage>? appPages = [
  GetPage(
    name: RouteName.splash,
    page: () => SplashScreen(),
    binding: SplashBinding(),
  ),
  GetPage(
    name: RouteName.signin,
    page: () => SigninScreen(),
    binding: SigninBinding(),
  ),
  GetPage(
    name: RouteName.home,
    page: () => HomeScreen(),
    bindings: [SignoutBinding(), PostBinding()],
  ),
];
