import 'package:getx_scaffold/getx_scaffold.dart';
import '../../pages/home/index.dart';
import '../../pages/create/index.dart';
import '../../pages/history/index.dart';
import '../../pages/example/index.dart';
import 'index.dart';

class NavBarPage extends GetView<NavBarController> {
  const NavBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    Get.put(NavBarController()); // Ensure the controller is initialized

    return GetBuilder<NavBarController>(
      // Removed init: NavBarController() since it's already initialized
      id: 'navBar',
      builder: (_) {
        return NavigationX(
          currentIndex: controller.pageIndex, // 当前选中的tab索引
          onTap: (index) {
            if (index == controller.pageIndex) {
              return;
            }

            controller.pageIndex = index;

            switch (index) {
              case 0:
                Get.offAll(() => const HomePage(),
                    transition: Transition.noTransition);
              case 1:
                Get.offAll(() => const CreatePage(),
                    transition: Transition.noTransition);
              case 2:
                Get.offAll(() => const HistoryPage(),
                    transition: Transition.noTransition);
              case 3:
                Get.offAll(() => const ExamplePage(),
                    transition: Transition.noTransition);
            }
            controller.updateUi();
          }, // 切换tab事件
          items: [
            NavigationItemModel(
              label: 'home',
              icon: AntdIcon.home,
              selectedIcon: AntdIcon.home,
            ),
            NavigationItemModel(
              label: 'create',
              icon: AntdIcon.plus,
              selectedIcon: AntdIcon.plus,
            ),
            NavigationItemModel(
              label: 'history',
              icon: AntdIcon.message,
              selectedIcon: AntdIcon.message,
            ),
            NavigationItemModel(
              label: 'example',
              icon: AntdIcon.trademark,
              selectedIcon: AntdIcon.trademark,
            ),
          ],
        );
      },
    );
  }
}
