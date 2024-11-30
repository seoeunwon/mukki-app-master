import 'package:flutter/material.dart';
import 'package:mukki/setting.dart';
import 'package:mukki/restaurant.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final TextEditingController _textController = TextEditingController();
  Widget buildRecommendButton(BuildContext context, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
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
      width: double.infinity,
      height: 90,
      child: TextButton(
          style: TextButton.styleFrom(
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
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "This restaurant\ndoesn't exist",
            ),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Setting()),
            );
          },
          icon: Icon(
            size: 35,
            Icons.menu,
            color: Colors.black,
          ),
        ),
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
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
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
                    print("검색: ${_textController.text}");
                  },
                  child: const Text('Search'),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _textController.text = "menu1";
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  child: Text(
                    "menu1",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _textController.text = "menu2";
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                  child: Text(
                    "menu2",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      _textController.text = "menu3";
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12), // 내부 여백
                  ),
                  child: Text(
                    "menu3",
                    style: TextStyle(color: Colors.grey), // 텍스트 색상 설정
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              '🍽️ Find the restaurant nearby',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 400,
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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, color: Colors.black),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu, color: Colors.black),
            label: '',
          ),
        ],
        backgroundColor: Colors.white,
        onTap: (index) {},
      ),
    );
  }
}
