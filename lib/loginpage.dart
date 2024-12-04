import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:mukki/signup_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loadTokens();
  }

  // 토큰 로드
  Future<void> _loadTokens() async {
    final String? accessToken = await _secureStorage.read(key: 'access_token');
    final String? refreshToken =
        await _secureStorage.read(key: 'refresh_token');
    String? idToken = await _secureStorage.read(key: 'id_token');

    print('Access Token: $accessToken');
    print('Refresh Token: $refreshToken');
    print('ID Token: $idToken');
  }

  // 토큰 저장
  Future<void> _saveTokens() async {
    final code = await UserApi.instance.loginWithKakaoAccount();
    code.accessToken;
    await _secureStorage.write(key: 'access_token', value: code.accessToken);
    await _secureStorage.write(key: 'refresh_token', value: code.refreshToken);
    await _secureStorage.write(key: 'id_token', value: code.idToken);
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpPreferences()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/pictures/logo.png', width: 100, height: 100),
            SizedBox(height: 55),
            Text(
              '먹끼[muk-ki]',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 45),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                overlayColor: Colors.transparent,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPreferences()),
                );
              },
              child: Column(
                children: [
                  Image.asset('lib/pictures/google_login.png'),
                ],
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.transparent,
                overlayColor: Colors.transparent,
              ),
              onPressed: _saveTokens,
              child: Column(
                children: [
                  Image.asset('lib/pictures/kakao_login.png'),
                ],
              ),
            ),
            SizedBox(height: 20),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                  textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpPreferences()),
                  );
                },
                child: Text(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                    'Use without Log In')),
          ],
        ),
      ),
    );
  }
}
