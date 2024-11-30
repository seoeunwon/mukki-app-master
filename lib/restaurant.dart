import 'package:flutter/material.dart';
import 'package:mukki/mainpage.dart';
import 'package:mukki/setting.dart';

class Restaurant extends StatelessWidget {
  const Restaurant({super.key});

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
          MaterialPageRoute(builder: (context) => MainPage()),
        );
      },
      child: Text(label),
    );
  }

  Widget foodPic(BuildContext context, String label) {
    return SizedBox(
      width: 120,
      height: 90,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {},
        child: Text(label),
      ),
    );
  }

  Widget bigfoodPic(BuildContext context, String label) {
    return SizedBox(
      width: 200,
      height: 150,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.blueGrey,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {},
        child: Text(label),
      ),
    );
  }

  Widget restaurantButton(BuildContext context, String label) {
    return SizedBox(
      width: double.infinity, // 버튼이 가로로 꽉 차도록 설정
      height: 90, // 버튼의 높이 설정
      child: TextButton(
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "This food\ndoesn't exist",
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
        title: Text('Hi, 은원'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            SizedBox(height: 80),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Restaurant',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  Text(
                    '📍 Address data',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Signature Food',
                style: TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  bigfoodPic(context, 'food1'),
                  SizedBox(width: 10),
                  bigfoodPic(context, 'food2'),
                  SizedBox(width: 10),
                  bigfoodPic(context, 'food3'),
                  SizedBox(width: 10),
                  bigfoodPic(context, 'food4'),
                ],
              ),
            ),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("All food", style: TextStyle(fontSize: 25)),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                foodPic(context, 'res1'),
                SizedBox(width: 10),
                Expanded(child: restaurantButton(context, 'res1')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                foodPic(context, 'res2'),
                SizedBox(width: 10),
                Expanded(child: restaurantButton(context, 'res2')),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                foodPic(context, 'res3'),
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
