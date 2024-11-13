import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';
import '../../pages/navBar/index.dart';
import '../../pages/pricing/index.dart';
import '../../pages/setting/index.dart';

import 'index.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      for (var i = 0; i < 3; i++)
        ListTile(
          title: Text('$i'),
          onTap: () {},
        )
    ]
        .toListView(
          separator: const DividerX(),
        )
        .scrollbar()
        .safeArea();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: 'home',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Home"),
            // centerTitle: true,
            // elevation: 1,
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(() => const PricingPage());
                },
                icon: const Icon(Icons.alarm),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => const SettingPage());
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
          bottomNavigationBar: const NavBarPage(),
          body: LoadContainer(
            controller: controller.homeController!,
            child: _buildView(),
          ),
        );
      },
    );
  }
}
