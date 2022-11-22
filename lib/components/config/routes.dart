import 'package:note/pages/splash_page.dart';

import '../../pages/detail_page.dart';
import '../../pages/home_page.dart';

class Routes {
  static init() => '/';

  static get() => ({
        '/': (context) => SplashPage(),
        '/home': (context) => HomePage(),
        '/detail': (context) => DetailPage(),
      });
}
