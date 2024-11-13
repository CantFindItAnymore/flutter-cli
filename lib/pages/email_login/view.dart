import '../../pages/navBar/index.dart';
import 'package:flutter/material.dart';
import '../../pages/email_register/index.dart';
import 'package:getx_scaffold/getx_scaffold.dart';

import 'index.dart';

class EmailLoginPage extends GetView<EmailLoginController> {
  const EmailLoginPage({super.key});

  // 构建主视图
  Widget _buildView() {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(100),
            ),
            child: const BackButton(color: Colors.white),
          ),
          const SizedBox(height: 32),
          const Text(
            'Log in to\nyour account',
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          const Text(
            'Email',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Enter your email',
              hintStyle: TextStyle(color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white),
            keyboardType: TextInputType.emailAddress,
            autofocus: true,
            onChanged: (value) {
              controller.email.value = value;
            },
          ),
          const SizedBox(height: 24),
          const Text(
            'Password',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          const SizedBox(height: 8),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'Enter your password',
              hintStyle: TextStyle(color: Colors.grey[600]),
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              controller.password.value = value;
            },
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              const Text(
                "Don't have an account yet? ",
                style: TextStyle(color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  // Add navigation to sign up page
                  Get.to(() => const EmailRegisterPage());
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(color: Color(0xFF57E4FF)),
                ),
              ),
            ],
          ),
          const Spacer(),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF6E8BF2),
              borderRadius: BorderRadius.circular(25),
            ),
            child: ElevatedButton(
              onPressed: () {
                if (controller.loading.value) {
                  return;
                }
                controller.emailLogin();

                // Add login logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
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
                        'Continue',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      );
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Get.put(NavBarController());
    return GetBuilder<EmailLoginController>(
      init: EmailLoginController(),
      id: 'email_login',
      builder: (_) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            backgroundColor: Colors.black,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: _buildView(),
            ),
          ),
        );
      },
    );
  }
}