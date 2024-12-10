import 'package:flutter/material.dart';
import 'package:mukki/shared_data.dart';
import 'package:dio/dio.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key});

  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  Future<List<dynamic>> fetchMenuData() async {
    try {
      final Dio dio = Dio();
      final response = await dio.get('http://13.124.180.13/menu/list/$resId');

      if (response.statusCode == 200) {
        menuItems = response.data as List<dynamic>;
        print(menuItems);
        return menuItems;
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Widget menuButton(BuildContext context, String label) {
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
          onPressed: () {},
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(label),
          )),
    );
  }

  Widget bigFoodPic(BuildContext context, String imagePath) {
    return SizedBox(
      width: 200,
      height: 150,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          print(resId);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Restaurant()),
          );
        },
        child: imagePath.isNotEmpty
            ? ClipRRect(
                child: Image.network(
                  imagePath,
                  fit: BoxFit.fitWidth,
                  width: 200,
                  height: 150,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.broken_image_outlined,
                      size: 50,
                      color: Colors.black, // 아이콘 색상을 검은색으로 설정
                    );
                  },
                ),
              )
            : Icon(Icons.image_not_supported, size: 50), // 경로가 없을 때 아이콘 표시
      ),
    );
  }

  Widget foodPic(BuildContext context, String imagePath) {
    return SizedBox(
      width: 120,
      height: 90,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          print(resId);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Restaurant()),
          );
        },
        child: imagePath.isNotEmpty
            ? ClipRRect(
                child: Image.network(
                  imagePath,
                  fit: BoxFit.fitWidth,
                  width: 200,
                  height: 90,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.broken_image_outlined,
                      size: 50,
                      color: Colors.black, // 아이콘 색상을 검은색으로 설정
                    );
                  },
                ),
              )
            : Icon(Icons.image_not_supported, size: 50), // 경로가 없을 때 아이콘 표시
      ),
    );
  }

  // Widget bigfoodPic(BuildContext context, String label) {
  //   return SizedBox(
  //     width: 200,
  //     height: 150,
  //     child: TextButton(
  //       style: TextButton.styleFrom(
  //         backgroundColor: Colors.blueGrey,
  //         foregroundColor: Colors.white,
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(5),
  //         ),
  //       ),
  //       onPressed: () {},
  //       child: Text(label),
  //     ),
  //   );
  // }

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
    fetchMenuData();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
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
                  for (int i = 0; i < 3; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: SizedBox(width: 10),
                    ),
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
            for (int i = 0; i < menuItems.length; i++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    foodPic(context, menuItems[i]['photo']['file_path']),
                    SizedBox(width: 10),
                    Expanded(child: menuButton(context, menuItems[i]['name'])),
                  ],
                ),
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
