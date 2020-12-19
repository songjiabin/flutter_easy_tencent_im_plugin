import '../index.dart';

///
/// IM好友管理类
///
/// Created by Jack Zhang on 12/19/20 .
///
class ImFriendManager {
  static ImFriendManager _instance;

  ImFriendManager._internal();

  factory ImFriendManager.getInstance() => _instance = _instance ?? ImFriendManager._internal();

  /// 获得好友列表
  Future<List<FriendInfoEntity>> getFriendList() => TencentImPlugin.getFriendList();

  /// 获得指定好友信息
  /// [userIDList] 好友ID列表
  Future<List<FriendInfoResultEntity>> getFriendsInfo({@required List<String> userIDList}) => TencentImPlugin.getFriendsInfo(userIDList: userIDList);

  /// 设置好友资料
  /// [info] 好友资料
  Future<void> setFriendInfo({@required FriendInfoEntity info}) => TencentImPlugin.setFriendInfo(info: info);

  /// 添加好友
  /// [info] 申请对象
  Future<FriendOperationResultEntity> addFriend({@required FriendAddApplicationEntity info}) => TencentImPlugin.addFriend(info: info);

  /// 删除好友
  /// [userIDList] 好友ID列表，ID 建议一次最大 100 个，因为数量过多可能会导致数据包太大被后台拒绝，后台限制数据包最大为 1M
  /// [deleteType] 删除类型
  Future<List<FriendOperationResultEntity>> deleteFromFriendList({@required List<String> userIDList, @required FriendTypeEnum deleteType}) =>
      TencentImPlugin.deleteFromFriendList(userIDList: userIDList, deleteType: deleteType);

  /// 检查好友关系
  /// [userID] 用户ID
  /// [checkType] 检测类型类型
  Future<FriendCheckResultEntity> checkFriend({@required String userID, @required FriendTypeEnum checkType}) =>
      TencentImPlugin.checkFriend(userID: userID, checkType: checkType);

  /// 获取好友申请列表
  Future<FriendApplicationResultEntity> getFriendApplicationList() => TencentImPlugin.getFriendApplicationList();

  /// 同意好友申请
  /// [application] 查找好友申请对象实体
  /// [responseType] 建立关系类型
  Future<FriendOperationResultEntity> acceptFriendApplication(
          {@required FindFriendApplicationEntity application, @required FriendApplicationAgreeTypeEnum responseType}) =>
      TencentImPlugin.acceptFriendApplication(application: application, responseType: responseType);

  /// 拒绝好友申请
  /// [application] 查找好友申请对象实体
  Future<FriendOperationResultEntity> refuseFriendApplication({@required FindFriendApplicationEntity application}) =>
      TencentImPlugin.refuseFriendApplication(application: application);

  /// 删除好友申请
  /// [application] 查找好友申请对象实体
  Future<void> deleteFriendApplication({@required FindFriendApplicationEntity application}) =>
      TencentImPlugin.deleteFriendApplication(application: application);

  /// 设置好友申请为已读
  Future<void> setFriendApplicationRead() => TencentImPlugin.setFriendApplicationRead();

  /// 新建好友分组
  /// [groupName] 组名
  /// [userIDList] 用户列表
  Future<List<FriendOperationResultEntity>> createFriendGroup({@required String groupName, @required List<String> userIDList}) =>
      TencentImPlugin.createFriendGroup(groupName: groupName, userIDList: userIDList);

  /// 获取分组信息
  /// [groupNameList] 分组名称
  Future<List<FriendGroupEntity>> getFriendGroups({List<String> groupNameList}) => TencentImPlugin.getFriendGroups(groupNameList: groupNameList);

  /// 删除好友分组
  /// [groupNameList] 分组名称
  Future<void> deleteFriendGroup({@required List<String> groupNameList}) => TencentImPlugin.deleteFriendGroup(groupNameList: groupNameList);

  /// 修改分组名称
  /// [oldName] 旧名称
  /// [newName] 新名称
  Future<void> renameFriendGroup({@required String oldName, @required String newName}) =>
      TencentImPlugin.renameFriendGroup(oldName: oldName, newName: newName);

  /// 添加好友到分组
  /// [groupName] 组名
  /// [userIDList] 好友ID
  Future<List<FriendOperationResultEntity>> addFriendsToFriendGroup({@required String groupName, @required List<String> userIDList}) =>
      TencentImPlugin.addFriendsToFriendGroup(groupName: groupName, userIDList: userIDList);

  /// 从分组中删除好友
  /// [groupName] 组名
  /// [userIDList] 好友ID
  Future<List<FriendOperationResultEntity>> deleteFriendsFromFriendGroup({@required String groupName, @required List<String> userIDList}) =>
      TencentImPlugin.deleteFriendsFromFriendGroup(groupName: groupName, userIDList: userIDList);
}
