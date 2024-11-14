import 'package:getx_scaffold/getx_scaffold.dart';
import '../../common/model/base_model.dart';
import '../../pages/chat/index.dart';

class HistoryController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'history';

  LoadController? historyController = LoadController();
  HistoryController();

  var recent = [];

  @override
  void onInit() {
    super.onInit();

    _getRecent();
  }

  void _getRecent() async {
    historyController?.loading();

    try {
      var response = await HttpService.to.get(
        'https://dog.ceo/api/breeds/image/random',
        // params: {'id': 11, 'pageSize': 10},
      );

      if (response != null) {
        var result = BaseModel.fromJson(response.data);
        log('roles: $result');
      }
    } catch (e) {
      log('get roles error: $e');
    }

    // setValue('roles', ['admin', 'user']);

    historyController?.complete();
  }

  void linkToChat(int id) {
    final chatController = Get.put(ChatController());

    chatController.setId(id);

    Get.to(() => const ChatPage());
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
