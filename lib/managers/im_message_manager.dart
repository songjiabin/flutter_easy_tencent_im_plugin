import '../index.dart';

///
/// IM消息管理类
///
/// Created by Jack Zhang on 12/19/20 .
///
class ImMessageManager {
  static ImMessageManager _instance;

  ImMessageManager._internal();

  factory ImMessageManager.getInstance() => _instance = _instance ?? ImMessageManager._internal();

  /// 发送消息
  /// [receiver] 消息接收者的 userID, 如果是发送 C2C 单聊消息，只需要指定 receiver 即可。
  /// [groupID] 目标群组 ID，如果是发送群聊消息，只需要指定 groupID 即可。
  /// [node] 消息节点
  /// [ol] 是否为在线消息(无痕)，如果为true，将使用 sendOnlineMessage 通道进行消息发送
  /// [localCustomInt] 自定义Int
  /// [localCustomStr] 自定义Str
  /// [atUserList] 需要 @ 的用户列表，暂不支持直接@ALL
  /// [priority] 消息优先级，仅针对群聊消息有效。请把重要消息设置为高优先级（比如红包、礼物消息），高频且不重要的消息设置为低优先级（比如点赞消息）。
  /// [offlinePushInfo] 离线推送时携带的标题和内容。
  /// [Return] 消息ID
  static Future<String> sendMessage({
    String receiver,
    String groupID,
    @required MessageNode node,
    bool ol: false,
    int localCustomInt,
    String localCustomStr,
    MessagePriorityEnum priority: MessagePriorityEnum.Default,
    OfflinePushInfoEntity offlinePushInfo,
  }) {
    return TencentImPlugin.sendMessage(
      receiver: receiver,
      groupID: groupID,
      node: node,
      ol: ol,
      localCustomInt: localCustomInt,
      localCustomStr: localCustomStr,
      priority: priority,
      offlinePushInfo: offlinePushInfo,
    );
  }

  /// 撤回消息
  /// [msgID] 消息ID
  static Future<void> revokeMessage({@required String msgID}) => TencentImPlugin.revokeMessage(message: FindMessageEntity(msgId: msgID));

  /// 获得历史记录，此方法为 getC2CHistoryMessageList + getGroupHistoryMessageList 提供的统一封装方法，(userID 和 group) 不能都为空
  /// [userId] 用户ID
  /// [groupID] 群聊ID
  /// [count] 拉取消息的个数，不宜太多，会影响消息拉取的速度，这里建议一次拉取 20 个，默认20
  /// [lastMsgID] 获取消息的起始消息ID，如果传 null，起始消息为会话的最新消息
  static Future<List<MessageEntity>> getHistoryMessageList({
    String userID,
    String groupID,
    int count = 20,
    String lastMsgID,
  }) {
    return TencentImPlugin.getHistoryMessageList(
      userID: userID,
      groupID: groupID,
      count: count,
      lastMsg: FindMessageEntity(msgId: lastMsgID),
    );
  }

  /// 设置聊天记录为已读，此为 markC2CMessageAsRead 和 markGroupMessageAsRead 的封装
  /// [userID] 用户ID
  /// [groupID] 群ID
  static Future<void> markMessageAsRead({String userID, String groupID}) => TencentImPlugin.markMessageAsRead(userID: userID, groupID: groupID);

  /// 删除本地消息
  /// [msgID] 消息ID
  static Future<void> deleteMessageFromLocalStorage({@required String msgID}) =>
      TencentImPlugin.deleteMessageFromLocalStorage(message: FindMessageEntity(msgId: msgID));

  /// 删除本地及漫游消息
  /// 该接口会删除本地历史的同时也会把漫游消息即保存在服务器上的消息也删除，卸载重装后无法再拉取到。需要注意的是：
  ///   1. 一次最多只能删除 30 条消息
  ///   2. 要删除的消息必须属于同一会话
  ///   3. 一秒钟最多只能调用一次该接口
  ///   4. 如果该账号在其他设备上拉取过这些消息，那么调用该接口删除后，这些消息仍然会保存在那些设备上，即删除消息不支持多端同步。
  /// [msgIDList] 消息ID集合
  static Future<void> deleteMessages({@required List<String> msgIDList}) =>
      TencentImPlugin.deleteMessages(message: msgIDList.map((msgID) => FindMessageEntity(msgId: msgID)).toList());

  /// 向群组消息列表中添加一条消息
  /// [groupID] 群ID
  /// [sender] 发送人
  /// [message] 消息对象
  static Future<void> insertGroupMessageToLocalStorage({
    @required String groupID,
    @required String sender,
    @required MessageNode node,
  }) {
    return TencentImPlugin.insertGroupMessageToLocalStorage(
      groupID: groupID,
      sender: sender,
      node: node,
    );
  }

  /// 下载视频
  /// [msgID] 消息ID
  /// [path] 下载路径
  static Future<void> downloadVideo({@required String msgID, @required String path}) =>
      TencentImPlugin.downloadVideo(message: FindMessageEntity(msgId: msgID), path: path);

  /// 下载视频缩略图
  /// [msgID] 消息ID
  /// [path] 下载路径
  static Future<void> downloadVideoThumbnail({@required String msgID, @required String path}) =>
      TencentImPlugin.downloadVideoThumbnail(message: FindMessageEntity(msgId: msgID), path: path);

  /// 下载语音
  /// [msgID] 消息ID
  /// [path] 下载路径
  static Future<void> downloadSound({@required String msgID, @required String path}) =>
      TencentImPlugin.downloadSound(message: FindMessageEntity(msgId: msgID), path: path);

  /// 设置消息本地Str
  /// [msgID] 消息ID
  /// [data] 数据对象
  static Future<void> setMessageLocalCustomStr({@required String msgID, @required String data}) =>
      TencentImPlugin.setMessageLocalCustomStr(message: FindMessageEntity(msgId: msgID), data: data);

  /// 设置消息本地Int
  /// [msgID] 消息ID
  /// [data] 数据对象
  static Future<void> setMessageLocalCustomInt({@required String msgID, @required int data}) =>
      TencentImPlugin.setMessageLocalCustomInt(message: FindMessageEntity(msgId: msgID), data: data);
}
