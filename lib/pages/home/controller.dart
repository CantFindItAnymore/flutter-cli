import 'package:getx_scaffold/getx_scaffold.dart';
import '../../pages/chat/index.dart';

import '../../common/model/base_model.dart';

class HomeController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'home';

  LoadController? homeController = LoadController();

  HomeController();

  var roles = [];

  @override
  void onInit() {
    super.onInit();

    final roles = getJSONAsync('roles');

    log('home1 roles: $roles');

    if (roles.isNotEmpty) {
      homeController?.complete();
      return;
    } else {
      _getRoles();
    }

    log('home1 onInit');
  }

  @override
  void onClose() {
    super.onClose();

    homeController?.dispose();
    homeController = null;
    log('home1 onClose');
  }

  void _getRoles() async {
    homeController?.loading();

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

    homeController?.complete();
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
    super.onDetached();
    log('home1 onDetached');
  }

  @override
  void onHidden() {
    super.onHidden();
    log('home1 onHidden');
  }

  @override
  void onInactive() {
    super.onInactive();
    log('home1 onInactive');
  }

  @override
  void onPaused() {
    super.onPaused();
    log('home1 onPaused');
  }

  @override
  void onResumed() {
    super.onResumed();
    log('home1 onResumed');
  }

  @override
  void onReady() {
    super.onReady();
    log('home1 onReady');
  }
}
