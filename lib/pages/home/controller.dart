import 'package:getx_scaffold/getx_scaffold.dart';

import '../../common/model/base_model.dart';

class HomeController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'home';

  LoadController? homeController = LoadController();

  HomeController();

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
        'http://54.166.200.78:7777/v1/user/sys/roleList',
        params: {'id': 11, 'pageSize': 10},
      );

      if (response != null) {
        dismissLoading();
        var result = BaseModel.fromJson(response.data);
        log('roles: $result');
      }
    } catch (e) {
      log('get roles error: $e');
    }

    // setValue('roles', ['admin', 'user']);

    homeController?.complete();
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
