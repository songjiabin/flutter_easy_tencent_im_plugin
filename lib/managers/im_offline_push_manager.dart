import '../index.dart';

///
/// IM离线推送管理类
///
/// Created by Jack Zhang on 12/19/20 .
///
class ImOfflinePushManager {
  static ImOfflinePushManager _instance;

  ImOfflinePushManager._internal();

  factory ImOfflinePushManager.getInstance() => _instance = _instance ?? ImOfflinePushManager._internal();

  /// 设置离线推送Token,Android使用setOfflinePushConfig，IOS使用setAPNS
  /// [token] Token
  /// [bussid] 推送证书 ID，是在 IM 控制台上生成的
  static Future<void> setOfflinePushConfig({@required String token, @required int bussid}) =>
      TencentImPlugin.setOfflinePushConfig(token: token, bussid: bussid);
}
