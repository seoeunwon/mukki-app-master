import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10),
            Image.asset('lib/pictures/logo.png', width: 200, height: 200),
            SizedBox(height: 10),
            Text('Language Settings'),
            SizedBox(height: 20),
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
                        cursorColor: Color(0xFF2D4739)),
                  ),
                ),
                SizedBox(width: 10),
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
                    // 언어 설정 코드 추가
                  },
                  child: const Text('Set'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
