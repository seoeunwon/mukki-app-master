import 'package:flutter/material.dart';
import 'package:mukki/shared_data.dart';
import 'package:dio/dio.dart';

class Restaurant extends StatefulWidget {
  const Restaurant({super.key, required this.resId});
  final int resId;

  @override
  _RestaurantState createState() => _RestaurantState();
}

class _RestaurantState extends State<Restaurant> {
  List<dynamic> resData = [];
  String resName = '';
  String resAdd = '';
  Future<List<dynamic>> fetchRestaurant() async {
    try {
      final Dio dio = Dio();
      final response = await dio.get(url);

      if (response.statusCode == 200) {
        setState(() {
          resData = response.data as List<dynamic>;
        });
        var filteredData = resData
            .where((restaurant) => restaurant['restaurant_id'] == widget.resId)
            .toList();
        resName = filteredData[0]['name'];
        var filteredData1 = resData
            .where((restaurant) => restaurant['restaurant_id'] == widget.resId)
            .toList();
        resAdd = filteredData1[0]['address_gu'];
        return resData;
      } else {
        return [];
      }
    } catch (e) {
      print('Error fetching data: $e');
      return [];
    }
  }

  Future<void> fetchMenuData() async {
    try {
      final Dio dio = Dio();
      final response =
          await dio.get('http://13.124.180.13/menu/list/${widget.resId}');

      if (response.statusCode == 200) {
        setState(() {
          menuItems = response.data as List<dynamic>;
        });
      } else {
        setState(() {
          menuItems = response.data as List<dynamic>;
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
      setState(() {
        menuItems = [];
      });
    }
  }

  Widget menuButton(BuildContext context, String label) {
    return SizedBox(
      width: double.infinity,
      height: 35,
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
        onPressed: () {},
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
        onPressed: () {},
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

  @override
  void initState() {
    super.initState();
    fetchMenuData();
    fetchRestaurant();
    print(widget.resId);
  }

  @override
  Widget build(BuildContext context) {
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
                    resName,
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(height: 20),
                  Text(
                    resAdd,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Align(
                alignment: Alignment.centerLeft,
                child: Text("🟢: vegan, 🟡: halal, 🔴: peanut",
                    style: TextStyle(fontSize: 20))),
            SizedBox(height: 30),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("🍎 Food List", style: TextStyle(fontSize: 25)),
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
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              menuItems[i]['name'],
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${menuItems[i]['price']} ₩', // 문자열 보간법으로 값과 ₩ 결합
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                          Row(
                            children: [
                              if (menuItems[i]['is_menu_vegan'] == true)
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              if (menuItems[i]['is_menu_halal'] == true)
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              if (menuItems[i]['is_menu_peanut'] == true)
                                Container(
                                  margin: const EdgeInsets.only(left: 5),
                                  width: 15,
                                  height: 15,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
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
