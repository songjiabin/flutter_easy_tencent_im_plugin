import '../index.dart';

///
/// IM初始化管理类
///
/// Created by Jack Zhang on 12/19/20 .
///
class ImInitManager {
  static ImInitManager _instance;

  ImInitManager._internal();

  factory ImInitManager.getInstance() => _instance = _instance ?? ImInitManager._internal();

  /// 初始化SDK
  /// [appid] 应用ID
  /// [logPrintLevel] 日志打印级别
  static Future<void> initSDK({@required String appid, LogPrintLevel logPrintLevel}) =>
      TencentImPlugin.initSDK(appid: appid, logPrintLevel: logPrintLevel);

  /// 反初始化SDK
  static Future<void> unInitSDK() => TencentImPlugin.unInitSDK();
}
