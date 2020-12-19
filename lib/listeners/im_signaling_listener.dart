import '../index.dart';

///
/// 信令信息监听
///
/// Created by Jack Zhang on 12/19/20 .
///
abstract class ImSignalingListener {
  /// 收到邀请
  /// [entity] 信令通用实体
  void onReceiveNewInvitation(SignalingCommonEntity entity);

  /// 被邀请者接受邀请
  /// [entity] 信令通用实体
  void onInviteeAccepted(SignalingCommonEntity entity);

  /// 被邀请者拒绝邀请
  /// [entity] 信令通用实体
  void onInviteeRejected(SignalingCommonEntity entity);

  /// 邀请被取消
  /// [entity] 信令通用实体
  void onInvitationCancelled(SignalingCommonEntity entity);

  /// 邀请超时
  /// [entity] 信令通用实体
  void onInvitationTimeout(SignalingCommonEntity entity);
}
