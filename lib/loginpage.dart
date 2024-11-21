import 'package:flutter/material.dart';
import 'package:mukki/signup_preferences.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
                    MaterialPageRoute(
                        builder: (context) => SignUpPreferences()),
                  );
                },
                child: Column(
                  children: [
                    Image.asset('lib/pictures/google_login.png'),
                  ],
                )),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  overlayColor: Colors.transparent,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SignUpPreferences()),
                  );
                },
                child: Column(
                  children: [
                    Image.asset('lib/pictures/kakao_login.png'),
                  ],
                )),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
