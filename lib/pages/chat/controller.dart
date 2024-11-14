import 'package:getx_scaffold/getx_scaffold.dart';

class ChatController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'chat';

  late int id;
  void setId(int newId) {
    id = newId;
    log('id: $id');
  }

  ChatController();

  @override
  void onInit() {
    super.onInit();
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
