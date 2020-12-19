import '../index.dart';

///
/// IM会话列表管理类
///
/// Created by Jack Zhang on 12/19/20 .
///
class ImConversationManager {
  static ImConversationManager _instance;

  ImConversationManager._internal();

  factory ImConversationManager.getInstance() => _instance = _instance ?? ImConversationManager._internal();

  /// 获取会话列表
  /// [nextSeq] 分页拉取的游标，第一次默认取传 0，后续分页拉传上一次分页拉取成功回调里的 nextSeq
  /// [count] 分页拉取的个数，一次分页拉取不宜太多，会影响拉取的速度，建议每次拉取 100 个会话
  Future<ConversationResultEntity> getConversationList({int nextSeq: 0, int count: 100}) =>
      TencentImPlugin.getConversationList(nextSeq: nextSeq, count: count);

  /// 获得指定会话（[conversationID] | [userID] | [groupID] 参数三选一）
  /// [conversationID] 会话ID
  /// [userID] 用户ID
  /// [groupID] 群ID
  Future<ConversationEntity> getConversation({String conversationID, String userID, String groupID}) =>
      TencentImPlugin.getConversation(conversationID: conversationID, userID: userID, groupID: groupID);

  /// 删除会话（[conversationID] | [userID] | [groupID] 参数三选一）
  /// [conversationID] 会话ID
  /// [userID] 用户ID
  /// [groupID] 群ID
  Future<void> deleteConversation({String conversationID, String userID, String groupID}) =>
      TencentImPlugin.deleteConversation(conversationID: conversationID, userID: userID, groupID: groupID);

  /// 设置会话草稿（[conversationID] | [userID] | [groupID] 参数三选一）
  /// [conversationID] 会话ID
  /// [userID] 用户ID
  /// [groupID] 群ID
  /// [draftText] 草稿内容，null代表取消设置
  Future<void> setConversationDraft({
    String conversationID,
    String userID,
    String groupID,
    String draftText,
  }) {
    return TencentImPlugin.setConversationDraft(
      conversationID: conversationID,
      userID: userID,
      groupID: groupID,
      draftText: draftText,
    );
  }
}
