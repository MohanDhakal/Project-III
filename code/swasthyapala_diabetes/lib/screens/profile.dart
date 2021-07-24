import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/sms_pref.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var _btnColor = color9;
  var _btnStatus = 'Enable';

  @override
  Widget build(BuildContext context) {
    statusCheck();
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Profile'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: EdgeInsets.only(top: 5, bottom: 50),
              decoration: BoxDecoration(
                color: color2,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.person),
                  Text(
                    'Mohan Kumar Dhakal',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () async {},
                        child: Container(
                          height: 50,
                          width: width * 0.4,
                          margin: EdgeInsets.only(top: 5),
                          decoration: BoxDecoration(
                              border: Border.all(color: normal_txt_color_black),
                              color: color9,
                              borderRadius: BorderRadius.circular(12)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('AGE:'),
                              Text('52'),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                            border: Border.all(color: normal_txt_color_black),
                            color: color9,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Activity:'),
                            Text('Moderate'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 50,
                        width: width * 0.4,
                        margin: EdgeInsets.only(bottom: 5, top: 5),
                        decoration: BoxDecoration(
                            border: Border.all(color: normal_txt_color_black),
                            color: color9,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Height:'),
                            Text('5.2'),
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        width: width * 0.4,
                        decoration: BoxDecoration(
                            border: Border.all(color: normal_txt_color_black),
                            color: color9,
                            borderRadius: BorderRadius.circular(12)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Weight:'),
                            Text('54'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'tap on the button to edit them',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
            ),
            Text(
              'Your Carbohydrate Limit: 500g',
              style: TextStyle(fontWeight: FontWeight.bold, color: color1),
            ),
            Container(
              margin: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  color: color9,
                  borderRadius: BorderRadius.circular(2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: width * 0.8,
                      height: 30,
                      margin: EdgeInsets.all(4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Today's Consumption",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "(2078/03/31)",
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
                      children: [Text('Calorie'), Text('1400Kcal')],
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
                        Text('150g'),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('Fat'), Text('70 g')],
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [Text('Protein'), Text('60 g')],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Warning Status: None',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
            ),
            Text(
              'Enable Important Message Delivery',
            ),
            Container(
                height: 30,
                width: width * 0.3,
                decoration: BoxDecoration(
                    border: Border.all(color: normal_txt_color_black),
                    color: _btnColor,
                    borderRadius: BorderRadius.circular(12)),
                child: Center(
                    child:
                        InkWell(onTap: ()  {
                          statusCheck();
                        }, child: Text(_btnStatus)))),
          ],
        ),
      ),
    );
  }

  void statusCheck() async{
    final status = await messageDeliverySet();
    if (status == false) {
      saveMessageDeliveryStatus(true);
    } else {
      setState(() {
        _btnStatus = 'Enabled';
        _btnColor = color2;
      });
    }
  }
}
