import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mukki/firstpage.dart';
import 'package:mukki/l10n/language_provider.dart';

Future<void> main() async {
  KakaoSdk.init(nativeAppKey: "568f954c14540adb6c5972ea788bfcb7");
  String languageCode = await LanguageProvider().getLanguage();
  runApp(MyApp(languageCode));
}

class MyApp extends StatelessWidget {
  final String languageCode;
  MyApp(this.languageCode);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      supportedLocales: [
        Locale('en', 'US'), // 영어
        Locale('ko', 'KR'), // 한국어
        Locale('ru', 'RU'), // 러시아어
      ],
      locale: Locale(languageCode), // 앱의 로케일 설정
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, primaryColor: Colors.blue),
      home: FirstPage(),
    );
  }
}
