import '../index.dart';

///
/// 群组状态监听
///
/// Created by Jack Zhang on 12/19/20 .
///
abstract class ImGroupListener {
  /// 有用户加入群（全员能够收到）
  /// [entity] 群成员加入通知实体
  void onMemberEnter(GroupMemberEnterEntity entity);

  /// 有用户离开群（全员能够收到）
  /// [entity] 群成员离开通知实体
  void onMemberLeave(GroupMemberLeaveEntity entity);

  /// 某些人被拉入某群（全员能够收到）
  /// [entity] 群成员邀请或提出通知实体
  void onMemberInvited(GroupMemberInvitedOrKickedEntity entity);

  /// 某些人被踢出某群（全员能够收到）
  /// [entity] 群成员邀请或提出通知实体
  void onMemberKicked(GroupMemberInvitedOrKickedEntity entity);

  /// 群成员信息被修改（全员能收到）
  /// 会议群（Meeting）和直播群（AVChatRoom）默认无此回调，如需回调请提交工单配置
  /// [entity] 群成员改变通知实体
  void onMemberInfoChanged(GroupMemberChangedEntity entity);

  /// 创建群（主要用于多端同步）
  /// [groupID] 群ID
  void onGroupCreated(String groupID);

  /// 群被解散了（全员能收到）
  /// [entity] 群解散或被回收通知实体
  void onGroupDismissed(GroupDismissedOrRecycledEntity entity);

  /// 群被回收（全员能收到）
  /// [entity] 群解散或被回收通知实体
  void onGroupRecycled(GroupDismissedOrRecycledEntity entity);

  /// 群信息被修改（全员能收到）
  /// [changeInfos] 修改的群信息
  void onGroupInfoChanged(GroupChangedEntity entity);

  /// 有新的加群请求（只有群主或管理员会收到）
  /// [entity] 群加入申请实体
  void onReceiveJoinApplication(GroupReceiveJoinApplicationEntity entity);

  /// 加群请求已经被群主或管理员处理了（只有申请人能够收到）
  /// [entity] 群申请处理
  void onApplicationProcessed(GroupApplicationProcessedEntity entity);

  /// 指定管理员身份
  /// [entity] 群管理员操作通知实体
  void onGrantAdministrator(GroupAdministratorOpEntity entity);

  /// 取消管理员身份
  /// [entity] 群管理员操作通知实体
  void onRevokeAdministrator(GroupAdministratorOpEntity entity);

  /// 主动退出群组（主要用于多端同步，直播群（AVChatRoom）不支持）
  /// [groupID] 群ID
  void onQuitFromGroup(String groupID);

  /// 收到 RESTAPI 下发的自定义系统消息
  /// [entity] 群接收到REST自定义信息通知实体
  void onReceiveRESTCustomData(GroupReceiveRESTEntity entity);

  /// 收到群属性更新的回调
  /// [entity] 群属性更新实体
  void onGroupAttributeChanged(GroupAttributeChangedEntity entity);
}
