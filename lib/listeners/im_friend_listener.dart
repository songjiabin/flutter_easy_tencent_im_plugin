import '../index.dart';

///
/// 好友相关状态监听
///
/// Created by Jack Zhang on 12/19/20 .
///
abstract class ImFriendListener {
  /// 好友申请新增通知，两种情况会收到这个回调：
  /// 1.自己申请加别人好友
  /// 2.别人申请加自己好友
  /// [list] 好友申请实体集合
  void onFriendApplicationListAdded(List<FriendApplicationEntity> list);

  /// 好友申请删除通知，四种情况会收到这个回调
  /// 1.调用 deleteFriendApplication 主动删除好友申请
  /// 2.调用 refuseFriendApplication 拒绝好友申请
  /// 3.调用 acceptFriendApplication 同意好友申请且同意类型为 V2TIM_FRIEND_ACCEPT_AGREE 时
  /// 4.申请加别人好友被拒绝
  void onFriendApplicationListDeleted(List<String> userIDList);

  /// 好友申请已读通知，如果调用 setFriendApplicationRead 设置好友申请列表已读，会收到这个回调（主要用于多端同步）
  void onFriendApplicationListRead();

  /// 好友新增通知
  /// [list] 好友信息实体集合
  void onFriendListAdded(List<FriendInfoEntity> list);

  /// 好友删除通知，，两种情况会收到这个回调：
  /// 1.自己删除好友（单向和双向删除都会收到回调）
  /// 2.好友把自己删除（双向删除会收到）
  void onFriendListDeleted(List<String> userIDList);

  /// 黑名单新增通知
  /// [list] 黑名单实体集合
  void onBlackListAdd(List<FriendInfoEntity> list);

  /// 黑名单删除通知
  void onBlackListDeleted(List<String> userIDList);

  /// 好友资料更新通知
  /// [list] 好友信息实体集合
  void onFriendInfoChanged(List<FriendInfoEntity> list);
}
