import 'package:flutter/material.dart';
import 'package:mukki/mainpage.dart';

class SignUpPreferences extends StatefulWidget {
  const SignUpPreferences({super.key});

  @override
  State<SignUpPreferences> createState() => _SignUpPreferencesState();
}

class _SignUpPreferencesState extends State<SignUpPreferences> {
  String? _selectedOption; // 드롭다운 선택 항목 저장
  final List<String> _options = ['Halal', 'Vegetarian', 'Allergy']; // 드롭다운 항목
  final TextEditingController _excludeFoodController = TextEditingController();
  List<String> foodList = []; // 제외 음식 목록

  @override
  void dispose() {
    _excludeFoodController.dispose();
    super.dispose();
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
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(color: Color(0xFF2D4739)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF2D4739)),
                  ),
                ),
                cursorColor: Color(0xFF2D4739),
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
              DropdownButton<String>(
                value: _selectedOption,
                hint: const Text('Select an option'),
                items: _options.map((String option) {
                  return DropdownMenuItem<String>(
                    value: option,
                    child: Text(option),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedOption = newValue;
                  });
                },
              ),
              const SizedBox(height: 20),
              const Text(
                "Add food you don't eat",
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
