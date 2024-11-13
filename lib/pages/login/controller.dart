import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:getx_scaffold/getx_scaffold.dart';
import '../../pages/email_login/index.dart';
import '../../pages/home/index.dart';

class LoginController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'login';

  LoginController();

  var loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    FlutterNativeSplash.remove();
  }

  void emailLogin() async {
    Get.to(() => const EmailLoginPage());
    loading.value = false;
  }

  void guestLogin() async {
    loading.value = true;
    delayed(3000, () {
      Get.to(() => const HomePage());
      loading.value = false;
    });

    // log('loading2: $loading');

    // HttpService.to.setAuthorization('1234567890');
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
