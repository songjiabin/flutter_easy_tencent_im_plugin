import '../index.dart';

///
/// IM登录管理类
///
/// Created by Jack Zhang on 12/19/20 .
///
class ImLoginManager {
  static ImLoginManager _instance;

  ImLoginManager._internal();

  factory ImLoginManager.getInstance() => _instance = _instance ?? ImLoginManager._internal();

  /// 登录腾讯云IM
  /// [userID] 用户ID
  /// [userSig] 用户签名
  static Future<void> login({@required String userID, @required String userSig}) => TencentImPlugin.login(userID: userID, userSig: userSig);

  /// 退出登录腾讯云IM
  static Future<void> logout() => TencentImPlugin.logout();

  /// 获得用户登录状态
  /// [Return] 用户当前登录状态
  static Future<LoginStatusEnum> getLoginStatus() => TencentImPlugin.getLoginStatus();

  /// 获得当前登录用户
  /// [Return] 当前用户ID
  static Future<String> getLoginUser() => TencentImPlugin.getLoginUser();
}
