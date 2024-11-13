import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import '../navBar/index.dart';

import 'index.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  // 主视图
  Widget _buildView() {
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: HistoryController(),
      id: 'history',
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("History"),
            centerTitle: true,
            elevation: 1,
          ),
          bottomNavigationBar: const NavBarPage(),
          body: _buildView(),
        );
      },
    );
  }
}
