import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class SettingPage extends GetView<SettingController> {
  const SettingPage({super.key});

  // 主视图
  Widget _buildView() {
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      init: SettingController(),
      id: 'setting',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Setting"),
            centerTitle: true,
            elevation: 1,
          ),
          body: _buildView(),
        );
      },
    );
  }
}
