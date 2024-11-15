import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('lib/pictures/logo.png', width: 100, height: 100),
            SizedBox(height: 80),
            Text('Login to your account'),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your username',
                  labelStyle: TextStyle(
                    color: Color(0xFF2D4739),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFF2D4739),
                  )),
                ),
                cursorColor: Color(0xFF2D4739)),
            SizedBox(height: 20),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                  labelStyle: TextStyle(
                    color: Color(0xFF2D4739),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xFF2D4739),
                  )),
                ),
                cursorColor: Color(0xFF2D4739)),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2D4739),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              onPressed: () {
                // 로그인 처리 코드 추가
              },
              child: const Text('Sign In'),
            ),
            //다른 방법으로 로그인
            SizedBox(height: 20),
            Text('Or sign in with...'),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  onPressed: () {
                    // Add the code to sign up with Google
                  },
                  child: const Text('Google'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // 배경색 설정
                    foregroundColor: Colors.black, // 텍스트 색상 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // 버튼 모서리 둥글게 설정
                    ),
                  ),
                  onPressed: () {
                    // Add the code to sign up with Facebook
                  },
                  child: const Text('Facebook'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white, // 배경색 설정
                    foregroundColor: Colors.black, // 텍스트 색상 설정
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // 버튼 모서리 둥글게 설정
                    ),
                  ),
                  onPressed: () {
                    // Add the code to sign up with Apple
                  },
                  child: const Text('Apple'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
