import '../index.dart';

///
/// 链接状态监听
///
/// Created by Jack Zhang on 12/19/20 .
///
abstract class ImConnectionListener {
  /// SDK 正在连接到腾讯云服务器
  void onConnecting();

  /// SDK 已经成功连接到腾讯云服务器
  void onConnected();

  /// SDK 连接腾讯云服务器失败
  /// [entity] 错误实体
  void onConnectFailed(ErrorEntity entity);

  /// 当前用户被踢下线，此时可以 UI 提示用户，并再次调用 V2TIMManager 的 login() 函数重新登录
  void onKickedOffline();

  /// 在线时票据过期：此时您需要生成新的 userSig 并再次调用 V2TIMManager 的 login() 函数重新登录
  void onUserSigExpired();

  /// 登录用户的资料发生了更新
  /// [entity] 用户实体
  void onSelfInfoUpdated(UserEntity entity);
}
