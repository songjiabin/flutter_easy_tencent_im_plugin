import '../index.dart';

///
/// 消息相关状态监听
///
/// Created by Jack Zhang on 12/19/20 .
///
abstract class ImMessageListener {
  /// 收到新消息
  /// [entity] 消息实体
  void onNewMessage(MessageEntity entity);

  /// 收到 C2C 消息已读回执
  /// [receiptList] 已读回执列表
  void onC2CReadReceipt(List<MessageReceiptEntity> receiptList);

  /// 收到消息撤回的通知
  /// [msgID] 消息唯一标识
  void onMessageRevoked(String msgID);

  /// 发消息成功回调
  /// [entity] 消息实体
  void onMessageSendSucc(MessageEntity entity);

  /// 发消息失败回调
  /// [entity] 消息发送失败实体
  void onMessageSendFail(MessageSendFailEntity entity);

  /// 文件消息发送进度
  /// [entity] 消息发送进度实体
  void onMessageSendProgress(MessageSendProgressEntity entity);

  /// 文件下载进度
  /// [entity] 下载进度实体
  void onDownloadProgress(DownloadProgressEntity entity);
}
