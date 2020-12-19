import 'package:flutter_easy_tencent_im_plugin/index.dart';

///
///  IM客户端，调用入口
///
///  Created by Jack Zhang on 12/19/20 .
///
class ImClient {
  static ImClient _instance;

  ImClient._internal();

  factory ImClient.getInstance() => _instance = _instance ?? ImClient._internal();

  final ImInitManager _initManager = ImInitManager.getInstance();
  final ImLoginManager _loginManager = ImLoginManager.getInstance();
  final ImConversationManager _conversationManager = ImConversationManager.getInstance();
  final ImMessageManager _messageManager = ImMessageManager.getInstance();
  final ImGroupManager _groupManager = ImGroupManager.getInstance();
  final ImUserManager _userManager = ImUserManager.getInstance();
  final ImFriendManager _friendManager = ImFriendManager.getInstance();
  final ImSignalingManager _signalingManager = ImSignalingManager.getInstance();
  final ImOfflinePushManager _offlinePushManager = ImOfflinePushManager.getInstance();
  final ImOtherManager _otherManager = ImOtherManager.getInstance();

  final List<ImConnectionListener> _connectionListeners = List<ImConnectionListener>();
  final List<ImConversationListener> _conversationListeners = List<ImConversationListener>();
  final List<ImMessageListener> _messageListeners = List<ImMessageListener>();
  final List<ImGroupListener> _groupListeners = List<ImGroupListener>();
  final List<ImFriendListener> _friendListeners = List<ImFriendListener>();
  final List<ImSignalingListener> _signalingListeners = List<ImSignalingListener>();

  /// IM链接状态
  bool _connected = false;

  /// 获取IM链接状态
  bool get connected => _connected;

  /// 获取IM初始化管理类
  ImInitManager get initManager => _initManager;

  /// 获取IM登录管理类
  ImLoginManager get loginManager => _loginManager;

  /// 获取IM会话管理类
  ImConversationManager get conversationManager => _conversationManager;

  /// 获取IM消息管理类
  ImMessageManager get messageManager => _messageManager;

  /// 获取IM群组管理类
  ImGroupManager get groupManager => _groupManager;

  /// 获取IM用户管理类
  ImUserManager get userManager => _userManager;

  /// IM好友管理类
  ImFriendManager get friendManager => _friendManager;

  /// 获取IM信令信息管理类
  ImSignalingManager get signalingManager => _signalingManager;

  /// IM离线推送管理类
  ImOfflinePushManager get offlinePushManager => _offlinePushManager;

  /// IM其他方法管理类
  ImOtherManager get otherManager => _otherManager;

  /// 初始化腾讯IM监听器
  void initTencentListener() => TencentImPlugin.addListener(_tencentImListener);

  /// 反初始化腾讯IM监听器
  void unInitTencentListener() => TencentImPlugin.removeListener(_tencentImListener);

  /// 添加链接状态监听的接口
  /// [listener] 链接状态监听
  void addConnectionListener(ImConnectionListener listener) {
    assert(listener != null);
    _connectionListeners.add(listener);
  }

  /// 移除链接状态监听的接口
  /// [listener] 链接状态监听
  void removeConnectionListener(ImConnectionListener listener) {
    assert(listener != null);
    _connectionListeners.remove(listener);
  }

  /// 添加会话状态监听的接口
  /// [listener] 会话状态监听
  void addConversationListener(ImConversationListener listener) {
    assert(listener != null);
    _conversationListeners.add(listener);
  }

  /// 移除会话状态监听的接口
  /// [listener] 会话状态监听
  void removeConversationListener(ImConversationListener listener) {
    assert(listener != null);
    _conversationListeners.remove(listener);
  }

  /// 添加消息状态监听的接口
  /// [listener] 消息状态监听
  void addMessageListener(ImMessageListener listener) {
    assert(listener != null);
    _messageListeners.add(listener);
  }

  /// 移除消息状态监听的接口
  /// [listener] 消息状态监听
  void removeMessageListener(ImMessageListener listener) {
    assert(listener != null);
    _messageListeners.remove(listener);
  }

  /// 添加群组状态监听的接口
  /// [listener] 群组状态监听
  void addGroupListener(ImGroupListener listener) {
    assert(listener != null);
    _groupListeners.add(listener);
  }

  /// 移除群组状态监听的接口
  /// [listener] 群组状态监听
  void removeGroupListener(ImGroupListener listener) {
    assert(listener != null);
    _groupListeners.remove(listener);
  }

  /// 添加好友状态监听的接口
  /// [listener] 好友状态监听
  void addFriendListener(ImFriendListener listener) {
    assert(listener != null);
    _friendListeners.add(listener);
  }

  /// 移除好友状态监听的接口
  /// [listener] 好友状态监听
  void removeFriendListener(ImFriendListener listener) {
    assert(listener != null);
    _friendListeners.remove(listener);
  }

  /// 添加信令消息监听的接口
  /// [listener] 信令消息监听
  void addSignalingListener(ImSignalingListener listener) {
    assert(listener != null);
    _signalingListeners.add(listener);
  }

  /// 移除信令消息监听的接口
  /// [listener] 信令消息监听
  void removeSignalingListener(ImSignalingListener listener) {
    assert(listener != null);
    _signalingListeners.remove(listener);
  }

  /// 腾讯IM监听
  void _tencentImListener(TencentImListenerTypeEnum type, params) {
    switch (type) {
      case TencentImListenerTypeEnum.Connecting:
        _connected = false;
        _connectionListeners.forEach((listener) => listener.onConnecting());
        break;

      case TencentImListenerTypeEnum.ConnectSuccess:
        _connected = true;
        _connectionListeners.forEach((listener) => listener.onConnected());
        break;

      case TencentImListenerTypeEnum.ConnectFailed:
        _connected = false;
        _connectionListeners.forEach((listener) => listener.onConnectFailed(params));
        break;

      case TencentImListenerTypeEnum.KickedOffline:
        _connected = false;
        _connectionListeners.forEach((listener) => listener.onKickedOffline());
        break;

      case TencentImListenerTypeEnum.UserSigExpired:
        _connected = false;
        _connectionListeners.forEach((listener) => listener.onUserSigExpired());
        break;

      case TencentImListenerTypeEnum.SelfInfoUpdated:
        _connectionListeners.forEach((listener) => listener.onSelfInfoUpdated(params));
        break;

      case TencentImListenerTypeEnum.SyncServerStart:
        _conversationListeners.forEach((listener) => listener.onSyncServerStart());
        break;

      case TencentImListenerTypeEnum.SyncServerFinish:
        _conversationListeners.forEach((listener) => listener.onSyncServerFinish());
        break;

      case TencentImListenerTypeEnum.SyncServerFailed:
        _conversationListeners.forEach((listener) => listener.onSyncServerFailed());
        break;

      case TencentImListenerTypeEnum.NewConversation:
        _conversationListeners.forEach((listener) => listener.onNewConversation(params));
        break;

      case TencentImListenerTypeEnum.ConversationChanged:
        _conversationListeners.forEach((listener) => listener.onConversationChanged(params));
        break;

      case TencentImListenerTypeEnum.NewMessage:
        _messageListeners.forEach((listener) => listener.onNewMessage(params));
        break;

      case TencentImListenerTypeEnum.C2CReadReceipt:
        _messageListeners.forEach((listener) => listener.onC2CReadReceipt(params));
        break;

      case TencentImListenerTypeEnum.MessageRevoked:
        _messageListeners.forEach((listener) => listener.onMessageRevoked(params));
        break;

      case TencentImListenerTypeEnum.MessageSendSucc:
        _messageListeners.forEach((listener) => listener.onMessageSendSucc(params));
        break;

      case TencentImListenerTypeEnum.MessageSendFail:
        _messageListeners.forEach((listener) => listener.onMessageSendFail(params));
        break;

      case TencentImListenerTypeEnum.MessageSendProgress:
        _messageListeners.forEach((listener) => listener.onMessageSendProgress(params));
        break;

      case TencentImListenerTypeEnum.DownloadProgress:
        _messageListeners.forEach((listener) => listener.onDownloadProgress(params));
        break;

      case TencentImListenerTypeEnum.MemberEnter:
        _groupListeners.forEach((listener) => listener.onMemberEnter(params));
        break;

      case TencentImListenerTypeEnum.MemberLeave:
        _groupListeners.forEach((listener) => listener.onMemberLeave(params));
        break;

      case TencentImListenerTypeEnum.MemberInvited:
        _groupListeners.forEach((listener) => listener.onMemberInvited(params));
        break;

      case TencentImListenerTypeEnum.MemberKicked:
        _groupListeners.forEach((listener) => listener.onMemberKicked(params));
        break;

      case TencentImListenerTypeEnum.MemberInfoChanged:
        _groupListeners.forEach((listener) => listener.onMemberInfoChanged(params));
        break;

      case TencentImListenerTypeEnum.GroupCreated:
        _groupListeners.forEach((listener) => listener.onGroupCreated(params));
        break;

      case TencentImListenerTypeEnum.GroupDismissed:
        _groupListeners.forEach((listener) => listener.onGroupDismissed(params));
        break;

      case TencentImListenerTypeEnum.GroupRecycled:
        _groupListeners.forEach((listener) => listener.onGroupRecycled(params));
        break;

      case TencentImListenerTypeEnum.GroupInfoChanged:
        _groupListeners.forEach((listener) => listener.onGroupInfoChanged(params));
        break;

      case TencentImListenerTypeEnum.ReceiveJoinApplication:
        _groupListeners.forEach((listener) => listener.onReceiveJoinApplication(params));
        break;

      case TencentImListenerTypeEnum.ApplicationProcessed:
        _groupListeners.forEach((listener) => listener.onApplicationProcessed(params));
        break;

      case TencentImListenerTypeEnum.GrantAdministrator:
        _groupListeners.forEach((listener) => listener.onGrantAdministrator(params));
        break;

      case TencentImListenerTypeEnum.RevokeAdministrator:
        _groupListeners.forEach((listener) => listener.onRevokeAdministrator(params));
        break;

      case TencentImListenerTypeEnum.QuitFromGroup:
        _groupListeners.forEach((listener) => listener.onQuitFromGroup(params));
        break;

      case TencentImListenerTypeEnum.ReceiveRESTCustomData:
        _groupListeners.forEach((listener) => listener.onReceiveRESTCustomData(params));
        break;

      case TencentImListenerTypeEnum.GroupAttributeChanged:
        _groupListeners.forEach((listener) => listener.onGroupAttributeChanged(params));
        break;

      case TencentImListenerTypeEnum.FriendApplicationListAdded:
        _friendListeners.forEach((listener) => listener.onFriendApplicationListAdded(params));
        break;

      case TencentImListenerTypeEnum.FriendApplicationListDeleted:
        _friendListeners.forEach((listener) => listener.onFriendApplicationListDeleted(params));
        break;

      case TencentImListenerTypeEnum.FriendApplicationListRead:
        _friendListeners.forEach((listener) => listener.onFriendApplicationListRead());
        break;

      case TencentImListenerTypeEnum.FriendListAdded:
        _friendListeners.forEach((listener) => listener.onFriendListAdded(params));
        break;

      case TencentImListenerTypeEnum.FriendListDeleted:
        _friendListeners.forEach((listener) => listener.onFriendListDeleted(params));
        break;

      case TencentImListenerTypeEnum.BlackListAdd:
        _friendListeners.forEach((listener) => listener.onBlackListAdd(params));
        break;

      case TencentImListenerTypeEnum.BlackListDeleted:
        _friendListeners.forEach((listener) => listener.onBlackListDeleted(params));
        break;

      case TencentImListenerTypeEnum.FriendInfoChanged:
        _friendListeners.forEach((listener) => listener.onFriendInfoChanged(params));
        break;

      case TencentImListenerTypeEnum.ReceiveNewInvitation:
        _signalingListeners.forEach((listener) => listener.onReceiveNewInvitation(params));
        break;

      case TencentImListenerTypeEnum.InviteeAccepted:
        _signalingListeners.forEach((listener) => listener.onInviteeAccepted(params));
        break;

      case TencentImListenerTypeEnum.InviteeRejected:
        _signalingListeners.forEach((listener) => listener.onInviteeRejected(params));
        break;

      case TencentImListenerTypeEnum.InvitationCancelled:
        _signalingListeners.forEach((listener) => listener.onInvitationCancelled(params));
        break;

      case TencentImListenerTypeEnum.InvitationTimeout:
        _signalingListeners.forEach((listener) => listener.onInvitationTimeout(params));
        break;
    }
  }
}
