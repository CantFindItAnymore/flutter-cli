import 'package:getx_scaffold/getx_scaffold.dart';

class NavBarController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'navBar';

  NavBarController();

  int pageIndex = 0;
}
