import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';
import '../navBar/index.dart';

import 'index.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  // 主视图
  Widget _buildView() {
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CreateController>(
      init: CreateController(),
      id: 'create',
      builder: (_) {
        return DoublePressBackWidget(
          child: Scaffold(
            backgroundColor: const Color(0xFF16171D),
            appBar: AppBar(
              title: const Text("Create"),
              centerTitle: false,
              elevation: 0,
            ),
            bottomNavigationBar: const NavBarPage(),
            body: _buildView(),
          ),
        );
      },
    );
  }
}
