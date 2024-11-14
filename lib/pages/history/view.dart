import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';
import '../../pages/navBar/index.dart';
import '../../pages/pricing/index.dart';
import '../../pages/setting/index.dart';

import 'index.dart';

class HistoryPage extends GetView<HistoryController> {
  const HistoryPage({super.key});

  // 主视图
  Widget _buildView() {
    return <Widget>[
      for (var i = 0; i < 10; i++)
        GestureDetector(
          onTap: () {
            controller.linkToChat(i);
          },
          child: Container(
            height: 96,
            margin: EdgeInsets.only(
                bottom: 16, left: 8, right: 8, top: i == 0 ? 16 : 0),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF21242D),
              borderRadius: BorderRadius.circular(28),
            ),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(48),
                    child: ImageX.url(
                      'https://picsum.photos/100/100?random=$i',
                      width: 48,
                      height: 48,
                      radius: 48,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('role $i',
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white)),
                      const SizedBox(height: 8),
                      const Text(
                        '要限制文本最多显示两行并在超出时显示省略号，您可以使用 Text 小部件的 maxLines 和 overflow 属性。以下是更新后的代码片段：',
                        style:
                            TextStyle(fontSize: 14, color: Color(0xFF8B8B8B)),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
    ]
        .toListView(
            // separator: const DividerX(),
            )
        .scrollbar()
        .safeArea();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: HistoryController(),
      id: 'history',
      builder: (_) {
        return DoublePressBackWidget(
            child: Scaffold(
          backgroundColor: const Color(0xFF16171D),
          appBar: AppBar(
            title: const Text("Messages"),
            centerTitle: false,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  Get.to(() => const PricingPage());
                },
                icon: Image(
                  image: const AssetImage('assets/images/pro_icon.png'),
                  width: 24.w,
                ),
              ),
              IconButton(
                onPressed: () {
                  Get.to(() => const SettingPage());
                },
                icon: const Icon(Icons.settings),
              ),
            ],
          ),
          bottomNavigationBar: const NavBarPage(),
          body: LoadContainer(
            controller: controller.historyController!,
            child: _buildView(),
          ),
        ));
      },
    );
  }
}
