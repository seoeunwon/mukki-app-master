import 'package:flutter/material.dart';
import 'package:mukki/mainpage.dart';
import 'package:mukki/shared_data.dart';
import 'package:dio/dio.dart';

class SignUpPreferences extends StatefulWidget {
  const SignUpPreferences({super.key});

  @override
  State<SignUpPreferences> createState() => _SignUpPreferencesState();
}

class _SignUpPreferencesState extends State<SignUpPreferences> {
  final List<String> _options = ['Halal', 'Vegetarian', 'Allergy'];
  final List<String> _selectedOptions = [];
  final TextEditingController _excludeFoodController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  bool vegan = false;
  bool halal = false;
  bool peanut = false;

  @override
  void dispose() {
    _excludeFoodController.dispose();
    super.dispose();
  }

  Future<void> fetchFilteredRestaurants() async {
    // 옵션에 따라 필터 값 설정
    vegan = _selectedOptions.contains('Vegetarian');
    halal = _selectedOptions.contains('Halal');
    peanut = _selectedOptions.contains('Allergy');
    final String url =
        'http://localhost:3000/restaurants/filteredLIst?vegan=$vegan&halal=$halal&peanut=$peanut';
    try {
      // dio를 사용하여 GET 요청 보내기
      Dio dio = Dio();
      Response response = await dio.get(url);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        print('API Response: $data'); // 응답 확인
      } else {
        print('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset('lib/pictures/logo.png', width: 100, height: 100),
              const SizedBox(height: 50),
              const Text(
                'Name you want to be called',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(color: Color(0xFF2D4739)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2D4739)),
                        ),
                      ),
                      cursorColor: Color(0xFF2D4739),
                    ),
                  ),
                  SizedBox(width: 10), // TextField와 Button 사이 간격 추가
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2D4739),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: const Size(70, 55),
                    ),
                    onPressed: () {
                      setState(() {
                        username = _usernameController.text;
                        print('Username: $username');
                        username = username;
                      });
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const Text(
                'Add your address',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(fontSize: 15),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search',
                        labelStyle: TextStyle(color: Color(0xFF2D4739)),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2D4739)),
                        ),
                      ),
                      cursorColor: const Color(0xFF2D4739),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2D4739),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: const Size(70, 55),
                    ),
                    onPressed: () {
                      // 주소 검색 API 연동 로직
                    },
                    child: const Text('Search'),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const TextField(
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Additional address',
                  labelStyle: TextStyle(color: Color(0xFF2D4739)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2D4739)),
                  ),
                ),
                cursorColor: Color(0xFF2D4739),
              ),
              const SizedBox(height: 18),
              const Text(
                'Pick your preferences or',
                style: TextStyle(fontSize: 18),
              ),
              const Text(
                'Dietary Requirements',
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 18),
              // Checkbox로 여러 옵션 선택 가능
              for (String option in _options)
                Row(
                  children: [
                    Checkbox(
                      value: _selectedOptions.contains(option),
                      onChanged: (bool? value) {
                        setState(() {
                          if (value == true) {
                            _selectedOptions.add(option);
                          } else {
                            _selectedOptions.remove(option);
                          }
                          // selectedOptions 업데이트
                          selectedOptions = List.from(_selectedOptions);
                          print('Selected Options: $selectedOptions');
                          fetchFilteredRestaurants();
                        });
                      },
                    ),
                    Text(option),
                  ],
                ),

              const SizedBox(height: 20),
              const Text(
                "Allergic Food",
                style: TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _excludeFoodController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2D4739)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2D4739)),
                        ),
                      ),
                      cursorColor: const Color(0xFF2D4739),
                    ),
                  ),
                  const SizedBox(width: 18),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF2D4739),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: const Size(80, 55),
                    ),
                    onPressed: () {
                      if (_excludeFoodController.text.isNotEmpty) {
                        setState(() {
                          foodList.add(_excludeFoodController.text);
                          _excludeFoodController.text = '';
                        });
                      }
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2D4739),
                  foregroundColor: const Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainPage()),
                  );
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
