import 'package:flutter/material.dart';

class SignUpPreferences extends StatelessWidget {
  const SignUpPreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        // 스크롤 가능하도록 추가
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/pictures/logo.png', width: 100, height: 100),
              SizedBox(height: 50),
              Text('Name you want to be called'),
              SizedBox(height: 20),
              TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
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
              Text('Add your address'),
              SizedBox(height: 10),
              TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Search',
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
                    labelText: 'Additional address',
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
              Text('Pick your preferences or'),
              Text('Dietary Requirements'),
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
                    child: const Text('Vegan'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      // Add the code to sign up with Facebook
                    },
                    child: const Text('Halal'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      // Add the code to sign up with Apple
                    },
                    child: const Text('Vegetarian'),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text("Add food you don't eat"),
              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                            color: Color(0xFF2D4739),
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                            color: Color(0xFF2D4739),
                          )),
                        ),
                        cursorColor: Color(0xFF2D4739),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  // 버튼과의 간격 설정
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2D4739),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: Size(80, 40),
                    ),
                    onPressed: () {
                      // Add 버튼의 기능 추가
                    },
                    child: const Text('Add'),
                  ),
                ],
              ),

              SizedBox(height: 100),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2D4739),
                  foregroundColor: Color(0xFFF5F5F5),
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
            ],
          ),
        ),
      ),
    );
  }
}
