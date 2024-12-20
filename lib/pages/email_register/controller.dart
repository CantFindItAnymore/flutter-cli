import 'package:getx_scaffold/getx_scaffold.dart';
import '../home/index.dart';

class EmailRegisterController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'email_register';

  EmailRegisterController();

  var email = ''.obs;
  var password = ''.obs;
  var loading = false.obs;

  void emailRegister() async {
    if (email.isEmpty) {
      showErrorToast('Please enter your email');
      return;
    }
    if (password.value.isEmpty) {
      showErrorToast('Please enter your password');
      return;
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$')
        .hasMatch(email.value)) {
      showErrorToast('Please enter a valid email address');
      return;
    }

    if (password.value.length < 6 || password.value.length > 12) {
      showErrorToast('Password must be between 6 and 12 characters long');
      return;
    }

    loading.value = true;

    // HttpService.to.setAuthorization('1234567890');
    // showErrorToast('test');
    Get.offAll(() => const HomePage(), transition: Transition.fadeIn);
  }

  /// 是否监听生命周期事件
  @override
  bool get listenLifecycleEvent => true;

  /// listenLifecycleEvent设置为true时，会调用以下生命周期方法
  @override
  void onDetached() {
    log('onDetached');
  }

  @override
  void onHidden() {
    log('onHidden');
  }

  @override
  void onInactive() {
    log('onInactive');
  }

  @override
  void onPaused() {
    log('onPaused');
  }

  @override
  void onResumed() {
    log('onResumed');
  }
}
