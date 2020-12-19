import '../index.dart';

///
/// IM其他方法管理类
///
/// Created by Jack Zhang on 12/19/20 .
///
class ImOtherManager {
  static ImOtherManager _instance;

  ImOtherManager._internal();

  factory ImOtherManager.getInstance() => _instance = _instance ?? ImOtherManager._internal();

  /// 设置未读桌标，Android使用doBackground，IOS更改setAPNSListener值
  /// [number] 桌标数量
  Future<void> setUnreadBadge({@required int number}) => TencentImPlugin.setUnreadBadge(number: number);
}
