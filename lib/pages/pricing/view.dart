import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class PricingPage extends GetView<PricingController> {
  const PricingPage({super.key});

  // 主视图
  Widget _buildView() {
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PricingController>(
      init: PricingController(),
      id: 'pricing',
      builder: (_) {
        return Scaffold(
          extendBody: false,
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Pricing"),
            centerTitle: true,
            elevation: 1,
          ),
          body: _buildView(),
        );
      },
    );
  }
}
