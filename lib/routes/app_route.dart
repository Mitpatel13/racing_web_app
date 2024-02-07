import 'package:admin_racing/modules/home/home_scr.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../modules/alluser/all_user_scr.dart';




class Routes {
  Routes._();

  static const String homeScr = '/HomeScr';
  static const String myHomePage = '/MyHomePage';
  static const String bottomScr = '/bottomScr';
  static const String loginScreen = '/loginScreen';
  static const String allUserScr = '/allUserScr';

}

class page {
  List<GetPage> pages = [
    GetPage(
      name: Routes.allUserScr,
      page: () => const AllUserScr(),
    ),
    GetPage(
      name: Routes.myHomePage,
      page: () => const MyHomePage(),
    ),


  ];
}
