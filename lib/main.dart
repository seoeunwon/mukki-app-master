import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mukki/firstpage.dart';

void main() {
  KakaoSdk.init(nativeAppKey: "568f954c14540adb6c5972ea788bfcb7");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.blue),
      home: FirstPage(),
    );
  }
}
