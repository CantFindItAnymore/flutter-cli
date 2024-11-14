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
      for (var i = 0; i < 10; i++)
        GestureDetector(
          onTap: () {
            controller.linkToChat(i);
          },
          child: Container(
            height: 188,
            margin: EdgeInsets.only(
                bottom: 16, left: 8, right: 8, top: i == 0 ? 16 : 0),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFF21242D),
              borderRadius: BorderRadius.circular(32),
            ),
            child: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(32),
                    child: ImageX.url(
                      'https://picsum.photos/300/300?random=$i',
                      width: 172,
                      height: 172,
                      radius: 32,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var j = 0; j < 6; j++)
                              Container(
                                margin:
                                    const EdgeInsets.only(right: 8, bottom: 4),
                                child: TextTag(
                                  'Tag$i',
                                  color:
                                      const Color.fromARGB(255, 195, 246, 253),
                                  outline: true,
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text('role $i',
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF8B8B8B))),
                      const SizedBox(height: 4),
                      const Text(
                        '要限制文本最多显示两行并在超出时显示省略号，您可以使用 Text 小部件的 maxLines 和 overflow 属性。以下是更新后的代码片段：',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Center(
                        child: ButtonX(
                          'Chat',
                          icon: Icons.chat,
                          borderRadius: 24,
                          minSize: const Size(144, 24),
                          backgroundColor: const Color(0xFF6E8BF2),
                          textColor: Colors.white,
                          onPressed: () {
                            controller.linkToChat(i);
                          },
                        ),
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
    return GetBuilder<HomeController>(
      init: HomeController(),
      id: 'home',
      builder: (_) {
        return DoublePressBackWidget(
            child: Scaffold(
          backgroundColor: const Color(0xFF16171D),
          appBar: AppBar(
            title: const Text("Discover"),
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
            controller: controller.homeController!,
            child: _buildView(),
          ),
        ));
      },
    );
  }
}
