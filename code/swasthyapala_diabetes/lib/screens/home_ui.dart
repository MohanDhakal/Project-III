import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/screens/contacts/emergency_contact.dart';
import 'package:swasthyapala_diabetes/screens/forms/user_form.dart';
import 'package:swasthyapala_diabetes/screens/profile.dart';
import 'package:swasthyapala_diabetes/services/http/meals.dart';
import 'package:swasthyapala_diabetes/services/notification/notification_service.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/session.dart';
import 'package:swasthyapala_diabetes/utility/setup_timezone.dart';
import '../widgets/home/bg_widget.dart';
import '../widgets/home/meal_widget.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  int _currentTabIndex = 0;
  bool isLoggedin = false;
  String name = "ABCD";
  List<dynamic> mealList = [];
  @override
  void initState() {
    super.initState();

    //make api call to fetch the meal list
    getMeals(1).then((value) {
      setState(() {
        mealList = value;
      });
    });
    getSession().then((value) {
      if (value.length >= 10) {
        setState(() {
          isLoggedin = true;
        });
      }
    });
    getNameFromSession().then((value) {
      setState(() {
        name = value;
      });
    });
    //notification service setup
    // initializationiSetup();
    // configureTimeZone();
    // Future.delayed(Duration(seconds: 2), () {
    //   scheduleMealFor(MealType.dinner);
    // });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return isLoggedin == false
        ? UserForm()
        : Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentTabIndex,
              type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: Colors.red,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: Colors.red),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group, color: Colors.red),
                  label: "Friends",
                )
              ],
              onTap: (num) {
                setState(() {
                  _currentTabIndex = num;
                });
              },
            ),
            body: Container(
              child: _currentTabIndex == 1
                  ? UserProfile()
                  : _currentTabIndex == 2
                      ? Contacts()
                      : SingleChildScrollView(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 100,
                                      margin:
                                          EdgeInsets.only(top: 20, left: 10),
                                      child: RichText(
                                          text: TextSpan(children: [
                                        TextSpan(
                                            text: '\t\tHello\n',
                                            style: TextStyle(
                                                fontSize: 24,
                                                color: Colors.black)),
                                        TextSpan(
                                            text: '\t\t $name',
                                            style: TextStyle(
                                                fontSize: big_text_size,
                                                fontWeight: FontWeight.bold,
                                                color: color1)),
                                      ])),
                                    ),
                                    BGWidget(),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: size.height * 0.30,
                                        child: Image.asset(
                                            'asset/images/nutritionist.png'),
                                      ),
                                      Container(
                                        width: size.width * 0.3,
                                        margin:
                                            EdgeInsets.only(left: 5, right: 5),
                                        child: AnimatedTextKit(
                                          pause: Duration(seconds: 2),
                                          animatedTexts: [
                                            TypewriterAnimatedText(
                                                "Let's get started with your breakfast",
                                                textAlign: TextAlign.center,
                                                textStyle: TextStyle(
                                                  fontSize: medium_text_size,
                                                ),
                                                speed: Duration(
                                                    milliseconds: 100)),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                (mealList.length < 1)
                                    ? Text('No Meal Available')
                                    : CarouselSlider(
                                        options: CarouselOptions(
                                          height: size.height * 0.25,
                                          initialPage: 0,
                                        ),
                                        items: [
                                          MealWidget(
                                            time: '07:30 AM',
                                            mealType: 'Breakfast',
                                            mealName:
                                                mealList.elementAt(0)['name'] ??
                                                    'N/A',
                                            meal: mealList.elementAt(0) ?? null,
                                          ),
                                          MealWidget(
                                            time: '10:30 AM',
                                            mealType: 'Lunch',
                                            mealName:
                                                mealList.elementAt(1)['name'] ??
                                                    'NA',
                                            meal: mealList.elementAt(1) ?? null,
                                          ),
                                          MealWidget(
                                            time: '6:30 PM',
                                            mealType: 'Dinner',
                                            mealName:
                                                mealList.elementAt(2)['name'] ??
                                                    'N/A',
                                            meal: mealList.elementAt(2) ?? null,
                                          ),
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
            ));
  }
}
