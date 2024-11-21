import 'package:flutter/material.dart';
import 'package:mukki/restaurant.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  Widget buildRecommendButton(BuildContext context, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        minimumSize: Size(200, 160),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Restaurant()),
        );
      },
      child: Text(label),
    );
  }

  Widget resPic(BuildContext context, String label) {
    return SizedBox(
      width: 120,
      height: 90,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Restaurant()),
          );
        },
        child: Text(label),
      ),
    );
  }

  Widget restaurantButton(BuildContext context, String label) {
    return SizedBox(
      width: double.infinity, // 버튼이 가로로 꽉 차도록 설정
      height: 90, // 버튼의 높이 설정
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Restaurant()),
          );
        },
        child: Text(label),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Hi, Username!'),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '📍 Address data',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20), // Text와 TextField 사이에 여백 추가
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(fontSize: 15),
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
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF2D4739),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    minimumSize: Size(70, 55),
                  ),
                  onPressed: () {
                    // 주소 검색 코드 추가
                  },
                  child: const Text('Search'),
                ),
              ],
            ),
            SizedBox(height: 20), // TextField와 ElevatedButton 사이에 여백 추가
            Text(
              "🍽️ Today's recommendation",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    buildRecommendButton(context, 'Recommend1'),
                    SizedBox(width: 15),
                    buildRecommendButton(context, 'Recommend2'),
                    SizedBox(width: 15),
                    buildRecommendButton(context, 'Recommend3'),
                    SizedBox(width: 15),
                    buildRecommendButton(context, 'Recommend4'),
                  ],
                )),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 200,
              color: const Color.fromARGB(242, 1, 52, 77),
              child: Text(
                '지도',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                resPic(context, 'res1'),
                SizedBox(width: 10),
                Expanded(child: restaurantButton(context, 'res1')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                resPic(context, 'res2'),
                SizedBox(width: 10),
                Expanded(child: restaurantButton(context, 'res2')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                resPic(context, 'res3'),
                SizedBox(width: 10),
                Expanded(child: restaurantButton(context, 'res3')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
