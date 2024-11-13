import 'dart:math';
import 'package:flutter/material.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

final userId = Random().nextInt(9999);

class CallPage extends StatelessWidget {
  final String callId;

  const CallPage({Key? key, required this.callId, required String videoId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Call'),
      ),
      body: ZegoUIKitPrebuiltCall(
        appID: AppInfo.appid ?? 875202945,
        appSign: AppInfo.appsign ??
            '85fe5e58e17b7038d66a30f59fa0ad45fa36879cfad753d579b9b4189eb6a3f8',
        userID: userId.toString(),
        userName: 'userName$userId',
        callID: callId,
        config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall(),
      ),
    );
  }

  ZegoUIKitPrebuiltCall(
      {required int appID,
      required String appSign,
      required String userID,
      required String userName,
      required String callID,
      required config}) {}
}

class AppInfo {
  static int? appid = 875202945;
  static String? appsign =
      '85fe5e58e17b7038d66a30f59fa0ad45fa36879cfad753d579b9b4189eb6a3f8';
}
