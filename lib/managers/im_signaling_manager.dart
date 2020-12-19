import '../index.dart';

///
/// IM信令信息管理类
///
/// Created by Jack Zhang on 12/19/20 .
///
class ImSignalingManager {
  static ImSignalingManager _instance;

  ImSignalingManager._internal();

  factory ImSignalingManager.getInstance() => _instance = _instance ?? ImSignalingManager._internal();

  /// 邀请某个人
  /// [invitee] 被邀请人用户 ID
  /// [data] 自定义数据
  /// [onlineUserOnly] 是否只有在线用户才能收到邀请，如果设置为 true，只有在线用户才能收到， 并且 invite 操作也不会产生历史消息（针对该次 invite 的后续 cancel、accept、reject、timeout 操作也同样不会产生历史消息）。
  /// [offlinePushInfo] 离线推送信息，其中 desc 为必填字段，推送的时候会默认展示 desc 信息。
  /// [timeout] 超时时间，单位秒，如果设置为 0，SDK 不会做超时检测，也不会触发 onInvitationTimeout 回调
  /// [Return] 邀请 ID，如果邀请失败，返回 null
  static Future<String> invite({
    @required String invitee,
    @required String data,
    OfflinePushInfoEntity offlinePushInfo,
    bool onlineUserOnly: false,
    int timeout: 0,
  }) {
    return TencentImPlugin.invite(
      invitee: invitee,
      data: data,
      offlinePushInfo: offlinePushInfo,
      onlineUserOnly: onlineUserOnly,
      timeout: timeout,
    );
  }

  /// 邀请群内的某些人
  /// [groupID] 发起邀请所在群组
  /// [inviteeList] 被邀请人列表，inviteeList 必须已经在 groupID 群里，否则邀请无效
  /// [data] 自定义数据
  /// [onlineUserOnly] 是否只有在线用户才能收到邀请，如果设置为 true，只有在线用户才能收到， 并且 invite 操作也不会产生历史消息（针对该次 invite 的后续 cancel、accept、reject、timeout 操作也同样不会产生历史消息）。
  /// [timeout] 超时时间，单位秒，如果设置为 0，SDK 不会做超时检测，也不会触发 onInvitationTimeout 回调
  /// [Return] 邀请 ID，如果邀请失败，返回 null
  static Future<String> inviteInGroup({
    @required String groupID,
    @required List<String> inviteeList,
    @required String data,
    bool onlineUserOnly: false,
    int timeout: 0,
  }) {
    return TencentImPlugin.inviteInGroup(
      groupID: groupID,
      inviteeList: inviteeList,
      data: data,
      onlineUserOnly: onlineUserOnly,
      timeout: timeout,
    );
  }

  /// 邀请方取消邀请
  /// [inviteID] 邀请ID
  /// [data] 自定义数据
  static Future<String> cancel({@required String inviteID, @required String data}) => TencentImPlugin.cancel(inviteID: inviteID, data: data);

  /// 接收方接收邀请
  /// [inviteID] 邀请ID
  /// [data] 自定义数据
  static Future<String> accept({@required String inviteID, @required String data}) => TencentImPlugin.accept(inviteID: inviteID, data: data);

  /// 接收方拒绝邀请
  /// [inviteID] 邀请ID
  /// [data] 自定义数据
  static Future<String> reject({@required String inviteID, @required String data}) => TencentImPlugin.reject(inviteID: inviteID, data: data);

  /// 获取信令信息
  /// [msgID] 消息ID
  /// [Return] V2TIMSignalingInfo 信令信息，如果为 null，则 msg 不是一条信令消息。
  static Future<SignalingInfoEntity> getSignalingInfo({@required String msgID}) =>
      TencentImPlugin.getSignalingInfo(message: FindMessageEntity(msgId: msgID));

  /// 添加邀请信令（可以用于群离线推送消息触发的邀请信令）
  /// [info] 信令信息对象
  static Future<void> addInvitedSignaling({@required SignalingInfoEntity info}) => TencentImPlugin.addInvitedSignaling(info: info);
}
