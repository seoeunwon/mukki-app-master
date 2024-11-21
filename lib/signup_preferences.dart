import 'package:flutter/material.dart';
import 'package:mukki/mainpage.dart';

class SignUpPreferences extends StatefulWidget {
  const SignUpPreferences({super.key});

  @override
  State<SignUpPreferences> createState() => _SignUpPreferencesState();
}

class _SignUpPreferencesState extends State<SignUpPreferences> {
  final _excludeFoodController = TextEditingController();
  var foodList = [];

  @override
  void dispose() {
    _excludeFoodController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildFoodButton(BuildContext context, String label) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {
          setState(() {
            foodList.remove(label);
          });
        },
        child: Text(
          label + '   ❎',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      );
    }

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
              SizedBox(height: 50),
              Text(
                'Name you want to be called',
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 18),
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
              SizedBox(height: 18),
              Text(
                'Add your address',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                  style: TextStyle(fontSize: 15),
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
              SizedBox(height: 18),
              TextField(
                  style: TextStyle(fontSize: 15),
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
              SizedBox(height: 18),
              Text(
                'Pick your preferences or',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                'Dietary Requirements',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDAF0EE),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Halal',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(width: 18),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFDAF0EE),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    onPressed: () {
                      // Add the code to sign up with Apple
                    },
                    child: const Text(
                      'Vegetarian',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Add food you don't eat",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _excludeFoodController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF2D4739),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xFF2D4739),
                          ),
                        ),
                      ),
                      cursorColor: Color(0xFF2D4739),
                    ),
                  ),
                  SizedBox(width: 18), // 버튼과의 간격 설정

                  // 버튼과의 간격 설정
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF2D4739),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      minimumSize: Size(80, 55),
                    ),
                    onPressed: () {
                      print(_excludeFoodController.text);
                      foodList.add(_excludeFoodController.text);
                      _excludeFoodController.text = '';
                      print(foodList);
                      setState(() {
                        foodList = foodList;
                      });
                    },
                    child: const Text(
                      'Add',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Wrap(
                spacing: 10,
                children: [
                  for (var f in foodList) buildFoodButton(context, f),
                ],
              ),
              SizedBox(height: 80),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF2D4739),
                  foregroundColor: Color(0xFFF5F5F5),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  //navigate to mainpage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: const Text(
                  'Sign In',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
