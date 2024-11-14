import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  // 主视图
  Widget _buildView() {
    return const SizedBox();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      id: 'chat',
      builder: (_) {
        return Scaffold(
          backgroundColor: const Color(0xFF16171D),
          appBar: AppBar(
            title: Row(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(40),
                    child: ImageX.url(
                      'https://picsum.photos/300/300?random=${controller.id}',
                      width: 40,
                      height: 40,
                      radius: 40,
                      fit: BoxFit.cover,
                    )),
                const SizedBox(width: 8), // 图片和文本之间的间距
                const Text("Chat"),
              ],
            ),
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  // Get.to(() => const SettingPage());
                },
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          body: _buildView(),
        );
      },
    );
  }
}
