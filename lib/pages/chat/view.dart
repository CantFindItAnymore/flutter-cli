import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';
import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'index.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  // 主视图
  Widget _buildView(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            children: [
              // Build message cards
              ...controller.messages.map((msg) {
                return Container(
                  key: UniqueKey(),
                  margin: const EdgeInsets.only(top: 16, left: 8, right: 8),
                  // width: double.infinity,

                  child: Row(
                    mainAxisAlignment: msg['sender'] == 'user'
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width * 0.8,
                            minWidth: 50),
                        child: Card(
                          color: msg['sender'] == 'user'
                              ? Colors.blueAccent
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              msg['message'],
                              softWrap: true,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
        Container(
          color: const Color(0xFF16171D),
          height: 96,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 16, right: 16),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AnimatedToggleSwitch<bool>.dual(
                            current: controller.isSwitchOn.value,
                            first: false,
                            second: true,
                            spacing: -4.0,
                            animationDuration:
                                const Duration(milliseconds: 300),
                            style: const ToggleStyle(
                              borderColor: Colors.transparent,
                              indicatorColor: Colors.white,
                              backgroundColor: Colors.black,
                            ),
                            customStyleBuilder: (context, local, global) {
                              return const ToggleStyle(
                                  backgroundGradient: LinearGradient(
                                colors: [Colors.blueAccent, Colors.grey],
                              ));
                            },
                            borderWidth: 0,
                            height: 20.0,
                            indicatorSize: const Size(20, 20),
                            onChanged: (b) => {
                              controller.isSwitchOn.value = b,
                              controller.updateUi(),
                            },
                          ),
                          const SizedBox(height: 4),
                          Text('NSFW',
                              style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: controller.isSwitchOn.value
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                  color: controller.isSwitchOn.value
                                      ? Colors.blueAccent
                                      : Colors.grey)),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        controller: TextEditingController(
                            text: controller.message.value),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color(0xFF333846),
                          hintText: 'Type a Message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 16.0),
                        ),
                        textInputAction: TextInputAction.send,
                        onChanged: (value) {
                          controller.message.value = value;
                        },
                        onSubmitted: (value) {
                          FocusScope.of(context).unfocus();
                          controller.sendMessage();
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.sendMessage();
                    },
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      id: 'chat',
      builder: (_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: const Color(0xFF21242D),
            appBar: AppBar(
              title: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(40),
                      child: ImageX.url(
                        'https://picsum.photos/100/100?random=${controller.id}',
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
            body: LoadContainer(
              controller: controller.chatController!,
              child: SafeArea(child: _buildView(context)),
            ),
          ),
        );
      },
    );
  }
}
