import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';
import '../login/index.dart';

import 'index.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      ListTile(
        title: const Text('Privacy policy'),
        onTap: () {
          log('Privacy policy');
        },
        trailing: const Icon(AntdIcon.right, color: Colors.grey, size: 14),
      ),
      ListTile(
        title: const Text('Terms of Service'),
        onTap: () {},
        trailing: const Icon(AntdIcon.right, color: Colors.grey, size: 14),
      ),
      ListTile(
        title: const Text('Report a Problem'),
        onTap: () {
          launchUrl(Uri.parse('mailto:ww@gmail.com'));
        },
        trailing: const Icon(AntdIcon.right, color: Colors.grey, size: 14),
      ),
      ListTile(
        title: const Text('Log out'),
        onTap: () {
          Get.offAll(() => const LoginPage(),
              transition: Transition.leftToRight);
        },
        trailing: const Icon(AntdIcon.right, color: Colors.grey, size: 14),
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
    return GetBuilder<SettingController>(
      init: SettingController(),
      id: 'setting',
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xFF16171D),
          appBar: AppBar(
            title: const Text("Setting"),
            centerTitle: true,
            elevation: 0,
          ),
          body: _buildView(),
        );
      },
    );
  }
}
