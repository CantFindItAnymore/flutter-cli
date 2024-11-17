import 'package:getx_scaffold/getx_scaffold.dart';
import '../../common/model/base_model.dart';

class ChatController extends GetxController with BaseControllerMixin {
  @override
  String get builderId => 'chat';

  LoadController? chatController = LoadController();

  ChatController();
  late int id;
  dynamic messages = [
    {'message': 'hi', 'sender': 'bot'},
    {'message': 'hello', 'sender': 'user'},
    {
      'message':
          'To add a margin of 32 pixels vertically (上下) and 16 pixels horizontally (左右) to the Row widget that contains the message cards, you can wrap the Row in a Container and set the margin property accordingly. Heres the updated code:',
      'sender': 'bot'
    },
  ].obs;

  var isSwitchOn = true.obs;
  var message = ''.obs;

  void setId(int newId) {
    id = newId;
    log('id: $id');
    _getChat();
  }

  @override
  void onInit() {
    super.onInit();
  }

  void _getChat() async {
    chatController?.loading();

    try {
      var response = await HttpService.to.get(
        'https://dog.ceo/api/breeds/image/random',
        // params: {'id': 11, 'pageSize': 10},
      );

      if (response != null) {
        var result = BaseModel.fromJson(response.data);
        log('_getRecent: $result');
      }
    } catch (e) {
      log('get roles error: $e');
    }

    chatController?.complete();
  }

  void sendMessage() async {
    final treatedValue = message.value;

    message.value = '';

    messages.add({'message': treatedValue, 'sender': 'user'});

    updateUi();
    _getBotMessage();

    // try {
    //   var response = await HttpService.to.get(
    //     'https://dog.ceo/api/breeds/image/random',
    //     // params: {'id': 11, 'pageSize': 10},
    //   );

    //   if (response != null) {
    //     var result = BaseModel.fromJson(response.data);
    //     log('_getRecent: $result');
    //   }
    // } catch (e) {
    //   log('get roles error: $e');
    // }
  }

  void _getBotMessage() async {
    await Future.delayed(const Duration(seconds: 2));

    messages.add({
      'message':
          'To make the TextField value responsive to controller.message.value, you can use a TextEditingController and update it whenever controller.message.value changes. Heres the updated code snippet.',
      'sender': 'bot'
    });

    updateUi();
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
