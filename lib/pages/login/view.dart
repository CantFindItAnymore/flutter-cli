import '../../pages/navBar/index.dart';
import 'package:flutter/material.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  // 构建主视图
  Widget _buildView() {
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: 'login',
      builder: (_) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Logo
              const Image(
                image: AssetImage(
                    "assets/icons/ic_launcher_adaptive.png"), // 确保添加logo图片资源
                width: 200,
              ),

              const SizedBox(height: 100), // 间距

              // 登录按钮
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (controller.loading.value) {
                      return;
                    }
                    // setValue('test', '123');
                    controller.emailLogin();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6E8BF2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 15), // 按钮间距

              // 访客模式按钮
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    if (controller.loading.value) {
                      return;
                    }
                    controller.guestLogin();
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.white,
                    side: const BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: Obx(() {
                    return controller.loading.value // 检查加载状态
                        ? const SizedBox(
                            width: 16, // Set width
                            height: 16, // Set height
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ), // 显示加载圈
                          )
                        : const Text(
                            "Continue as Guest",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          );
                  }),
                ),
              ),

              const SizedBox(height: 30),

              // 底部文字
              const Text(
                "By continuing to log in or join us, you are agreeing to our",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      openWebPage('https://www.baidu.com',
                          mode: LaunchMode.inAppWebView);
                    },
                    child: const Text(
                      "Terms of Use",
                      style: TextStyle(
                        color: Color(0xFF57E4FF),
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const Text(
                    "and",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      openWebPage('https://www.baidu.com',
                          mode: LaunchMode.inAppWebView);
                    },
                    child: const Text(
                      "Privacy Policy",
                      style: TextStyle(
                        color: Color(0xFF57E4FF),
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return GetBuilder<LoginController>(
      init: LoginController(),
      id: 'login',
      builder: (_) {
        return DoublePressBackWidget(
            child: Scaffold(
          backgroundColor: Colors.black,
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: _buildView(),
          ),
        ));
      },
    );
  }
}
