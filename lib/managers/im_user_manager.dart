import '../index.dart';

///
/// IM用户管理类
///
/// Created by Jack Zhang on 12/19/20 .
///
class ImUserManager {
  static ImUserManager _instance;

  ImUserManager._internal();

  factory ImUserManager.getInstance() => _instance = _instance ?? ImUserManager._internal();

  /// 获取用户资料
  /// [userList] 用户ID列表
  static Future<List<UserEntity>> getUsersInfo({@required List<String> userIDList}) => TencentImPlugin.getUsersInfo(userIDList: userIDList);

  /// 修改个人资料
  /// [info] 资料对象
  static Future<void> setSelfInfo({@required UserEntity info}) => TencentImPlugin.setSelfInfo(info: info);

  /// 添加用户到黑名单
  /// [userIDList] 用户ID列表
  static Future<List<FriendOperationResultEntity>> addToBlackList({@required List<String> userIDList}) =>
      TencentImPlugin.addToBlackList(userIDList: userIDList);

  /// 从黑名单中删除
  /// [userIDList] 用户ID列表
  static Future<List<FriendOperationResultEntity>> deleteFromBlackList({@required List<String> userIDList}) =>
      TencentImPlugin.deleteFromBlackList(userIDList: userIDList);

  /// 获得黑名单列表
  static Future<List<FriendInfoEntity>> getBlackList() => TencentImPlugin.getBlackList();
}
