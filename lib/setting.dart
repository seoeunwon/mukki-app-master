import 'package:flutter/material.dart';
import 'package:mukki/loginpage.dart';
import 'package:mukki/shared_data.dart';
import 'package:flutter/cupertino.dart';

bool _isChecked = false;
final _excludeFoodController = excludeFoodController;

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
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
          '먹끼[Muk-ki]',
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black),
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.black,
                    ),
                    SizedBox(width: 30),
                    Text(
                      '은원님\n환영합니다!',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ],
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Change your address',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
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
              SizedBox(height: 60),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'APP PUSH',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Row(children: [
                Text(
                  'Do you want to receive\npush notifications?',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(width: 60),
                CupertinoSwitch(
                  value: _isChecked,
                  activeColor: CupertinoColors.activeBlue,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
              ]),
              SizedBox(height: 60),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Follow us at the Instagram!🔗',
                    style: TextStyle(fontSize: 20),
                  )),
              SizedBox(height: 40),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: () {
                  //navigate to mainpage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: const Text(
                  'Log Out',
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
