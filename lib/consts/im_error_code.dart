///
/// IM 错误码
///
/// Created by Jack Zhang on 2/3/21 .
///
class IMErrorCode {
  /// ****************************************************
  /// **********************通用错误码*********************
  /// ****************************************************

  /// 无错误
  static const String no_error = '0';

  /// 参数无效，请检查参数是否符合要求，具体可查看错误信息进一步定义哪个字段。
  static const String error_code_6017 = '6017';

  /// 操作本地 IO 错误，检查是否有读写权限，磁盘是否已满。
  static const String error_code_6022 = '6022';

  /// 错误的 JSON 格式，请检查参数是否符合接口的要求，具体可查看错误信息进一步定义哪个字段。
  static const String error_code_6027 = '6027';

  /// 内存不足，可能存在内存泄漏，iOS 平台使用 Instrument 工具，Android 平台使用 Profiler 工具，分析出什么地方的内存占用高。
  static const String error_code_6028 = '6028';

  /// PB 解析失败，内部错误。
  static const String error_code_6001 = '6001';

  /// PB 序列化失败，内部错误。
  static const String error_code_6002 = '6002';

  /// IM SDK 未初始化，初始化成功回调之后重试。
  static const String error_code_6013 = '6013';

  /// 加载本地数据库操作失败，可能存储文件有损坏。
  static const String error_code_6005 = '6005';

  /// 本地数据库操作失败，可能是部分目录无权限或者数据库文件已损坏。
  static const String error_code_6019 = '6019';

  /// 跨线程错误，不能在跨越不同线程中执行，内部错误。
  static const String error_code_7001 = '7001';

  /// TinyId 为空，内部错误。
  static const String error_code_7002 = '7002';

  /// UserID 非法，必须不为空，要求可打印 ASCII 字符（0x20-0x7e），长度不超过32字节。
  static const String error_code_7003 = '7003';

  /// 文件不存在，请检查文件路径是否正确。
  static const String error_code_7004 = '7004';

  /// 文件大小超出了限制，如果上传文件，最大限制是100MB。
  static const String error_code_7005 = '7005';

  /// 空文件，要求文件大小不是0字节，如果上传图片、语音、视频或文件，请检查文件是否正确生成。
  static const String error_code_7006 = '7006';

  /// 文件打开失败，请检查文件是否存在，或者已被独占打开，引起 SDK 打开失败。
  static const String error_code_7007 = '7007';

  /// ****************************************************
  /// **********************帐号错误码*********************
  /// ****************************************************

  /// IM SDK 未登录，请先登录，成功回调之后重试，或者已被踢下线，可使用 TIMManager getLoginUser 检查当前是否在线。
  static const String error_code_6014 = '6014';

  /// 自动登录时，并没有登录过该用户，这时候请调用 login 接口重新登录。
  static const String error_code_6026 = '6026';

  /// UserSig 过期，请重新获取有效的 UserSig 后再重新登录，获取方法请参见 生成 UserSig。
  static const String error_code_6206 = '6206';

  /// 其他终端登录同一个帐号，引起已登录的帐号被踢，需重新登录。
  static const String error_code_6208 = '6208';

  /// 登录正在执行中，例如，第一次 login 或 autoLogin 操作在回调前，后续的 login 或 autoLogin 操作会返回该错误码。
  static const String error_code_7501 = '7501';

  /// 登出正在执行中，例如，第一次 logout 操作在回调前，后续的 logout 操作会返回该错误码。
  static const String error_code_7502 = '7502';

  /// TLS SDK 初始化失败，内部错误。
  static const String error_code_7503 = '7503';

  /// TLS SDK 未初始化，内部错误。
  static const String error_code_7504 = '7504';

  /// TLS SDK TRANS 包格式错误，内部错误。
  static const String error_code_7505 = '7505';

  /// TLS SDK 解密失败，内部错误。
  static const String error_code_7506 = '7506';

  /// TLS SDK 请求失败，内部错误。
  static const String error_code_7507 = '7507';

  /// TLS SDK 请求超时，内部错误。
  static const String error_code_7508 = '7508';

  /// ****************************************************
  /// **********************消息错误码*********************
  /// ****************************************************

  /// 会话无效，getConversation 时检查是否已经登录，如未登录获取会话，会有此错误码返回。
  static const String error_code_6004 = '6004';

  /// 文件传输鉴权失败，建议检查文件格式是否正确。
  static const String error_code_6006 = '6006';

  /// 文件传输获取 Server 列表失败。
  static const String error_code_6007 = '6007';

  /// 文件传输上传失败，请检查网络是否连接，如果上传的是图片，确认图片能够正常打开。
  static const String error_code_6008 = '6008';

  /// 文件传输下载失败，请检查网络，或者文件、语音是否已经过期，目前资源文件存储7天。
  static const String error_code_6009 = '6009';

  /// HTTP 请求失败，请检查 URL 地址是否合法，可在网页浏览器尝试访问该 URL 地址。
  static const String error_code_6010 = '6010';

  /// IM SDK 无效消息 elem，具体可查看错误信息进一步定义哪个字段。
  static const String error_code_6016 = '6016';

  /// 无效的对象，例如用户自己生成 TIMImage 对象，或内部赋值错误导致对象无效。
  static const String error_code_6021 = '6021';

  /// 消息长度超出限制，消息长度不要超过8k，消息长度是各个 elem 长度的总和，elem 长度是所有 elem 字段的长度总和。
  static const String error_code_8001 = '8001';

  /// 消息 KEY 错误，内部错误，网络请求包的 KEY 和 回复包的不一致。
  static const String error_code_8002 = '8002';

  /// 图片转换 HTTP 请求失败。
  static const String error_code_8003 = '8003';

  /// ****************************************************
  /// **********************群组错误码*********************
  /// ****************************************************

  /// 群组 ID 非法，自定义群组 ID 必须为可打印 ASCII 字符（0x20-0x7e），最长48个字节，且前缀不能为 @TGS#（避免与服务端默认分配的群组 ID 混淆）。
  static const String error_code_8501 = '8501';

  /// 群名称非法，群名称最长30字节，字符编码必须是 UTF-8 ，如果包含中文，可能用多个字节表示一个中文字符，请注意检查字符串的字节长度。
  static const String error_code_8502 = '8502';

  /// 群简介非法，群简介最长240字节，字符编码必须是 UTF-8 ，如果包含中文，可能用多个字节表示一个中文字符，请注意检查字符串的字节长度。
  static const String error_code_8503 = '8503';

  /// 群公告非法，群公告最长300字节，字符编码必须是 UTF-8 ，如果包含中文，可能用多个字节表示一个中文字符，请注意检查字符串的字节长度。
  static const String error_code_8504 = '8504';

  /// 群头像 URL 非法，群头像 URL 最长100字节，可在网页浏览器尝试访问该 URL 地址。
  static const String error_code_8505 = '8505';

  /// 群名片非法，群名片最长50字节，字符编码必须是 UTF-8 ，如果包含中文，可能用多个字节表示一个中文字符，请注意检查字符串的字节长度。
  static const String error_code_8506 = '8506';

  /// 超过群组成员数的限制，在创建群和邀请成员时，指定的成员数超出限制，最大群成员数量：专业版是200人；增值服务可扩展至2000人，旗舰版是2000人；增值服务可扩展至6000人，音视频聊天室和在线成员广播大群无限制。
  static const String error_code_8507 = '8507';

  /// 不允许申请加入 Private 群组，任意群成员可邀请入群，且无需被邀请人同意。
  static const String error_code_8508 = '8508';

  /// 不允许邀请角色为群主的成员，请检查角色字段是否填写正确。
  static const String error_code_8509 = '8509';

  /// 不允许邀请0个成员，请检查成员字段是否填写正确。
  static const String error_code_8510 = '8510';

  /// ****************************************************
  /// *********************关系链错误码********************
  /// ****************************************************

  /// 不允许邀请0个成员，请检查成员字段是否填写正确。
  static const String error_code_9001 = '9001';

  /// 备注字段非法，最大96字节，字符编码必须是 UTF-8 ，如果包含中文，可能用多个字节表示一个中文字符，请注意检查字符串的字节长度。
  static const String error_code_9002 = '9002';

  /// 请求添加好友的请求说明字段非法，最大120字节，字符编码必须是 UTF-8 ，如果包含中文，可能用多个字节表示一个中文字符，请注意检查字符串的字节长度。
  static const String error_code_9003 = '9003';

  /// 请求添加好友的添加来源字段非法，来源需要添加“AddSource_Type_”前缀。
  static const String error_code_9004 = '9004';

  /// 好友分组字段非法，必须不为空，每个分组的名称最长30字节，字符编码必须是 UTF-8 ，如果包含中文，可能用多个字节表示一个中文字符，请注意检查字符串的字节长度。
  static const String error_code_9005 = '9005';

  /// ****************************************************
  /// **********************网络错误码*********************
  /// ****************************************************

  /// SSO 加密失败，内部错误。
  static const String error_code_9501 = '9501';

  /// SSO 解密失败，内部错误。
  static const String error_code_9502 = '9502';

  /// SSO 未完成鉴权，可能登录未完成，请在登录完成后再操作。
  static const String error_code_9503 = '9503';

  /// 数据包压缩失败，内部错误。
  static const String error_code_9504 = '9504';

  /// 数据包解压失败，内部错误。
  static const String error_code_9505 = '9505';

  /// 调用频率限制，最大每秒发起5次请求。
  static const String error_code_9506 = '9506';

  /// 网络请求队列超过同时请求数量的最大限制，最大请求数量为1000个。例如，网络异常时仍然在不停地发消息，网络请求队列只有入队没有消耗，请求数量很快就会达到最大。
  static const String error_code_9507 = '9507';

  /// 网络已断开，未建立连接，或者建立 socket 连接时，检测到无网络。
  static const String error_code_9508 = '9508';

  /// 网络连接已建立，重复创建连接，内部错误。
  static const String error_code_9509 = '9509';

  /// 建立网络连接超时，请等网络恢复后重试。
  static const String error_code_9510 = '9510';

  /// 网络连接已被拒绝，请求过于频繁，服务端拒绝服务。
  static const String error_code_9511 = '9511';

  /// 没有到达网络的可用路由，请等网络恢复后重试。
  static const String error_code_9512 = '9512';

  /// 系统中没有足够的缓冲区空间资源可用来完成调用，系统过于繁忙，内部错误。
  static const String error_code_9513 = '9513';

  /// 对端重置了连接，可能服务端过载，SDK 内部会自动重连，请等网络连接成功 onConnSucc （ iOS ） 或 onConnected （ Android ） 回调后重试。
  static const String error_code_9514 = '9514';

  /// socket 套接字无效，内部错误。
  static const String error_code_9515 = '9515';

  /// IP 地址解析失败，内部错误，可能是本地 imsdk_config 配置文件被损坏，读取到 IP 地址非法。
  static const String error_code_9516 = '9516';

  /// 网络连接到中间节点或服务端重置，引起连接失效，内部错误，SDK 内部会自动重连，请等网络连接成功 onConnSucc （ iOS ） 或 onConnected （ Android ） 回调后重试。
  static const String error_code_9517 = '9517';

  /// 请求包等待进入待发送队列超时，发送时网络连接建立比较慢 或 频繁断网重连时，会出现该错误，请检查网络连接是否正常。
  static const String error_code_9518 = '9518';

  /// 请求包已进入 IM SDK 待发送队列，等待进入操作系统的网络层时超时。一般可能原因是本地网络受限/不通或本地网络与 IM SDK 后台连接不通。建议用不同的网络环境分别运行 IM SDK 来确认是否因当前网络环境问题引起。
  static const String error_code_9519 = '9519';

  /// 请求包已由 IM SDK 待发送队列进入操作系统网络层，等待服务端回包超时。一般可能原因是本地网络受限/不通或本地网络与 IM SDK 后台连接不通。建议用不同的网络环境分别运行 IM SDK 来确认是否因当前网络环境问题引起。
  static const String error_code_9520 = '9520';

  /// ****************************************************
  /// **********************其他错误码*********************
  /// ****************************************************

  /// 发送方被禁言，该条消息被禁止发送。
  static const String error_code_20012 = '20012';

  /// 群组 ID 非法，请检查群组 ID 是否填写正确。
  static const String error_code_10015 = '10015';
}
