import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/input_type.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/enums-const/user.dart';
import 'package:swasthyapala_diabetes/services/http/profile.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/meal_today.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/session.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/sms_pref.dart';

class UserProfile extends StatefulWidget {
  final name;

  UserProfile(this.name);

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var _btnColor = color9;
  var _btnStatus = 'Enable';
  final myController = TextEditingController();
  DateTime _dateTime = DateTime.now();

  Map<String, dynamic> profile = {
    'name': 'N/A',
    'age': 'N/A',
    "activity": "N/A",
    "height": 0.0,
    "weight": 00,
  };
  Map<String, dynamic> totalNutrition = {
    'carbs': 0.0,
    'protein': 0.0,
    'fat': 0.0,
    'calorie': 0.0
  };


  @override
  void initState() {
    super.initState();
    getUserProfile().then((value) {
      setState(() {
        profile = value;
      });
    });

    getConsumedNutrition().then((value) {
      setState(() {
        totalNutrition = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    statusCheck();
    final width = MediaQuery.of(context).size.width;
    final height=MediaQuery.of(context).size.height;
    return Material(
      child: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            top: 0.05*height,
            left:10,
            right:10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text('Your Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: big_text_size),),

              ),
              Container(
                margin: EdgeInsets.only(top:10, bottom: 30),
                decoration: BoxDecoration(
                  // color: color2,
                  border: Border.all(width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(16))

                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.person),
                    Text(
                      widget.name,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            updateUser(
                                TextInputType.number, InputType.int, 'Age');
                          },
                          child: Container(
                            height: 50,
                            width: width * 0.4,
                            margin: EdgeInsets.only(top: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: normal_txt_color_black),
                                color: color1,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('AGE:'),
                                Text(profile['age'].toString()),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            updateUser(TextInputType.text, InputType.string,
                                'Activity');
                          },
                          child: Container(
                            height: 50,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: normal_txt_color_black),
                                color: color1,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Activity:'),
                                Text(profile['activity']),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            updateUser(TextInputType.number, InputType.double,
                                'Height');
                          },
                          child: Container(
                            height: 50,
                            width: width * 0.4,
                            margin: EdgeInsets.only(bottom: 5, top: 5),
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: normal_txt_color_black),
                                color: color1,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Height:'),
                                Text(profile['height'].toString()),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            updateUser(TextInputType.number, InputType.double,
                                'Weight');
                          },
                          child: Container(
                            height: 50,
                            width: width * 0.4,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: normal_txt_color_black),
                                color: color1,
                                borderRadius: BorderRadius.circular(12)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Weight:'),
                                Text(profile['weight'].toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:10.0,bottom: 5.0),
                      child: Text(
                        'tap on the button to edit them',
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                ),
              ),
              Center(
                child: Text(
                  'Your Carbohydrate Limit: 500g',
                  style: TextStyle(fontWeight: FontWeight.bold, color: color1),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top:5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    // color: color2,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width: width * 0.8,
                        height: 30,
                        margin: EdgeInsets.all(4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Today's Consumption",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Date: ${_dateTime.year}/${_dateTime.month}/${_dateTime.day}",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        )),
                    Container(
                      height: 2,
                      color: Colors.black,
                    ),
                    Container(
                      width: width * 0.8,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Calorie'), Text('${totalNutrition['calorie']}Kcal')],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    Container(
                      width: width * 0.8,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Carbohydrate'),
                          Text('${totalNutrition['carbs']}g'),
                        ],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    Container(
                      width: width * 0.8,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Fat'), Text('${totalNutrition['fat']}g')],
                      ),
                    ),
                    Container(
                      height: 1,
                      color: Colors.black,
                    ),
                    Container(
                      width: width * 0.8,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [Text('Protein'), Text('${totalNutrition['protein']}g')],
                      ),
                    ),
                  ],
                ),
              ),
               Padding(
                 padding: const EdgeInsets.only(top:8.0),
                 child: Center(
                   child: Text(
                      'Warning Status: None',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                    ),
                 ),
               ),
              Padding(
                padding: const EdgeInsets.only(top:10.0),
                child: Center(
                  child: Text(
                    'Enable Important Message Delivery',
                  ),
                ),
              ),
              Center(
                child: Container(
                    height: 30,
                    width: width * 0.3,
                    margin: EdgeInsets.only(top:10),
                    decoration: BoxDecoration(
                        border: Border.all(color: normal_txt_color_black),
                        color: _btnColor,
                        borderRadius: BorderRadius.circular(2)),
                    child: Center(
                        child: InkWell(
                            onTap: () {
                              statusCheck();
                            },
                            child: Text(_btnStatus)))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void updateUser(TextInputType inTp, InputType num, String type) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Type your $type'),
            content: SizedBox(
              height: 50,
              width: 100,
              child: TextField(
                keyboardType: inTp,
                controller: myController,
                decoration: InputDecoration(
                  hintText: 'eg.45',
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                ),
              ),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    switch (num) {
                      case InputType.double:
                        dynamic d = double.parse(myController.text);
                        print(myController.text);

                        if (type == "Height") {
                          updateHeight( d);
                          setState(() {
                            profile['height'] = d;
                          });
                        } else {
                          updateWeight( d);
                          setState(() {
                            profile['weight'] = d;
                          });
                        }

                        break;
                      case InputType.int:
                        int age = int.parse(myController.text);
                        updateAge( age);
                        setState(() {
                          profile['age'] = age;
                        });
                        break;
                      default:
                        print(myController.text);
                        updateActivity(myController.text);
                        setState(() {
                          profile['activity'] = myController.text;
                        });
                        break;
                    }
                    Navigator.pop(context);
                  },
                  child: Text('OK')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('CANCEL'))
            ],
          );
        });
  }

  void statusCheck() async {
    final status = await messageDeliverySet();
    if (status == false) {
      saveMessageDeliveryStatus(true);
    } else {
      setState(() {
        _btnStatus = 'Enabled';
        _btnColor = color1;
      });
    }
  }
}
