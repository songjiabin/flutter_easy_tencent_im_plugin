import '../index.dart';

///
/// IM群组管理类
///
/// Created by Jack Zhang on 12/19/20 .
///
class ImGroupManager {
  static ImGroupManager _instance;

  ImGroupManager._internal();

  factory ImGroupManager.getInstance() => _instance = _instance ?? ImGroupManager._internal();

  /// 创建群
  /// [info] 群信息对象
  /// [memberList] 指定初始的群成员（直播群 AVChatRoom 不支持指定初始群成员，memberList 请传 null）
  /// [Return] 群ID
  Future<String> createGroup({@required GroupInfoEntity info, List<GroupCreateMemberEntity> memberList}) =>
      TencentImPlugin.createGroup(info: info, memberList: memberList);

  /// 加入群
  /// [groupID] 群ID
  /// [message] 描述
  Future<void> joinGroup({@required String groupID, @required String message}) => TencentImPlugin.joinGroup(groupID: groupID, message: message);

  /// 退出群
  /// [groupID] 群ID
  Future<void> quitGroup({@required String groupID}) => TencentImPlugin.quitGroup(groupID: groupID);

  /// 解散群
  /// [groupID] 群ID
  Future<void> dismissGroup({@required String groupID}) => TencentImPlugin.dismissGroup(groupID: groupID);

  /// 获取已经加入的群列表（不包括已加入的直播群）
  Future<List<GroupInfoEntity>> getJoinedGroupList() => TencentImPlugin.getJoinedGroupList();

  /// 拉取群资料
  /// [groupIDList] 群ID列表
  Future<List<GroupInfoResultEntity>> getGroupsInfo({@required List<String> groupIDList}) => TencentImPlugin.getGroupsInfo(groupIDList: groupIDList);

  /// 修改群资料
  /// [info] 群信息
  Future<void> setGroupInfo({@required GroupInfoEntity info}) => TencentImPlugin.setGroupInfo(info: info);

  /// 修改群消息接收选项
  /// [groupID] 群ID
  /// [opt] 消息接收选项
  Future<void> setReceiveMessageOpt({@required String groupID, @required GroupReceiveMessageOptEnum opt}) =>
      TencentImPlugin.setReceiveMessageOpt(groupID: groupID, opt: opt);

  /// 初始化群属性，会清空原有的群属性列表
  /// [groupID] 群ID
  /// [attributes] 群属性
  ///   1. attributes 的使用限制如下：
  ///   2. 目前只支持 AVChatRoom
  ///   3. key 最多支持16个，长度限制为32字节
  ///   4. value 长度限制为4k
  ///   5. 总的 attributes（包括 key 和 value）限制为16k
  ///   6. initGroupAttributes、setGroupAttributes、deleteGroupAttributes 接口合并计算， SDK 限制为5秒10次，超过后回调8511错误码；后台限制1秒5次，超过后返回10049错误码
  ///   7. getGroupAttributes 接口 SDK 限制5秒20次
  Future<void> initGroupAttributes({@required String groupID, @required Map<String, String> attributes}) =>
      TencentImPlugin.initGroupAttributes(groupID: groupID, attributes: attributes);

  /// 设置群属性。已有该群属性则更新其 value 值，没有该群属性则添加该属性。
  /// [groupID] 群ID
  /// [attributes] 群属性
  Future<void> setGroupAttributes({@required String groupID, @required Map<String, String> attributes}) =>
      TencentImPlugin.setGroupAttributes(groupID: groupID, attributes: attributes);

  /// 删除指定群属性，keys 传 null 则清空所有群属性。
  /// [groupID] 群ID
  /// [keys] 群属性Key,keys 传 null 则清空所有群属性。
  Future<void> deleteGroupAttributes({@required String groupID, List<String> keys}) =>
      TencentImPlugin.deleteGroupAttributes(groupID: groupID, keys: keys);

  /// 获取指定群属性，keys 传 null 则获取所有群属性。
  /// [groupID] 群ID
  /// [keys] 群属性Key,keys 传 null 则清空所有群属性。
  Future<Map<String, String>> getGroupAttributes({@required String groupID, List<String> keys}) =>
      TencentImPlugin.getGroupAttributes(groupID: groupID, keys: keys);

  /// 获取指定群在线人数
  /// [groupID] 群ID
  Future<int> getGroupOnlineMemberCount({@required String groupID}) => TencentImPlugin.getGroupOnlineMemberCount(groupID: groupID);

  /// 获取群成员列表。
  /// [groupID] 群ID
  /// [filter] 指定群成员类型
  /// [nextSeq] 分页拉取标志，第一次拉取填0，回调成功如果 nextSeq 不为零，需要分页，传入再次拉取，直至为0。
  Future<GroupMemberInfoResultEntity> getGroupMemberList({
    @required String groupID,
    GroupMemberFilterEnum filter: GroupMemberFilterEnum.All,
    int nextSeq: 0,
  }) =>
      TencentImPlugin.getGroupMemberList(groupID: groupID, filter: filter, nextSeq: nextSeq);

  /// 获取指定的群成员资料。
  /// [groupID] 群ID
  /// [memberList] 群成员列表
  Future<List<GroupMemberEntity>> getGroupMembersInfo({@required String groupID, @required List<String> memberList}) =>
      TencentImPlugin.getGroupMembersInfo(groupID: groupID, memberList: memberList);

  /// 修改指定的群成员资料。
  /// [groupID] 群ID
  /// [info] 群成员对象
  Future<void> setGroupMemberInfo({@required String groupID, @required GroupMemberEntity info}) =>
      TencentImPlugin.setGroupMemberInfo(groupID: groupID, info: info);

  /// 禁言（只有管理员或群主能够调用）。
  /// [groupID] 群ID
  /// [userID] 用户ID
  /// [seconds] 禁言时长
  Future<void> muteGroupMember({
    @required String groupID,
    @required String userID,
    @required int seconds,
  }) =>
      TencentImPlugin.muteGroupMember(groupID: groupID, userID: userID, seconds: seconds);

  /// 邀请他人入群
  /// [groupID] 群ID
  /// [userList] 用户ID列表
  Future<List<GroupMemberOperationResultEntity>> inviteUserToGroup({@required String groupID, @required List<String> userList}) =>
      TencentImPlugin.inviteUserToGroup(groupID: groupID, userList: userList);

  /// 踢人
  /// [groupID] 群ID
  /// [memberList] 群成员ID列表
  /// [reason] 理由
  Future<List<GroupMemberOperationResultEntity>> kickGroupMember({
    @required String groupID,
    @required List<String> memberList,
    String reason: '',
  }) =>
      TencentImPlugin.kickGroupMember(groupID: groupID, memberList: memberList, reason: reason);

  /// 切换群成员的角色。
  /// [groupID] 群ID
  /// [userID] 用户ID
  /// [role] 角色
  Future<void> setGroupMemberRole({
    @required String groupID,
    @required String userID,
    @required GroupMemberRoleEnum role,
  }) =>
      TencentImPlugin.setGroupMemberRole(groupID: groupID, userID: userID, role: role);

  /// 转让群主
  /// [groupID] 群ID
  /// [userID] 用户ID
  Future<void> transferGroupOwner({@required String groupID, @required String userID}) =>
      TencentImPlugin.transferGroupOwner(groupID: groupID, userID: userID);

  /// 获取加群的申请列表
  Future<GroupApplicationResultEntity> getGroupApplicationList() => TencentImPlugin.getGroupApplicationList();

  /// 同意某一条加群申请
  /// [application] 申请对象
  /// [reason] 理由
  Future<void> acceptGroupApplication({@required FindGroupApplicationEntity application, String reason: ''}) =>
      TencentImPlugin.acceptGroupApplication(application: application, reason: reason);

  /// 拒绝某一条加群申请
  /// [application] 申请对象
  /// [reason] 理由
  Future<void> refuseGroupApplication({@required FindGroupApplicationEntity application, String reason: ''}) =>
      TencentImPlugin.refuseGroupApplication(application: application, reason: reason);

  /// 标记申请列表为已读
  Future<void> setGroupApplicationRead() => TencentImPlugin.setGroupApplicationRead();
}
