import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/paths.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/middleware/serve_meal.dart';
import 'package:swasthyapala_diabetes/models/warning.dart';
import 'package:swasthyapala_diabetes/screens/contacts/emergency_contact.dart';
import 'package:swasthyapala_diabetes/screens/forms/user_form.dart';
import 'package:swasthyapala_diabetes/screens/profile.dart';
import 'package:swasthyapala_diabetes/screens/test/push_notification_test.dart';
import 'package:swasthyapala_diabetes/screens/warning_list.dart';
import 'package:swasthyapala_diabetes/services/db_storage/messages.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/session.dart';
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

//for firebase notification system

  late final FirebaseMessaging _messaging;

  @override
  void initState() {
    //display notiication when the app is in foreground
    registerNotification();

    //get meal from the middleware by getting id from shared pref
    getID().then((value) {
      getMealToday(value).then((value) {
        setState(() {
          mealList = value;
        });
      });
    });

    //check if the user already exists in the session
    getSessionPhoneAndName().then((value) {
      //if phone number is valid, it exists
      if (value[0].length >= 10) {
        setState(() {
          isLoggedin = true;
          name = value[1];
        });
      }
    });

    // For handling notification when the app is in background
    // but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      WarningMessage notification = WarningMessage(
        message.notification?.title,
        message.notification?.body,
      );

      //add the notification to the database
      addNotificationMessage(notification);
    });

    //when the app is in terminated state
    checkForInitialMessage();
    super.initState();

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
                    color: color1,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person, color: color1),
                  label: "Profile",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.group, color: color1),
                  label: "Friends",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notification_important, color: color1),
                  label: "Messages",
                ),
              ],
              onTap: (num) {
                setState(() {
                  _currentTabIndex = num;
                });
              },
            ),
            body: Container(
              child: _currentTabIndex == 1
                  ? UserProfile(name)
                  : _currentTabIndex == 2
                      ? Contacts()
                      : _currentTabIndex == 3
                          ? WarningList()
                          : SingleChildScrollView(
                              child: Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 100,
                                          margin: EdgeInsets.only(
                                              top: 20, left: 10),
                                          child: RichText(
                                              text: TextSpan(children: [
                                            TextSpan(
                                                text: '\tHello\n',
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
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: size.height * 0.30,
                                            child: Image.asset(
                                                '$assetImage/nutritionist.png'),
                                          ),
                                          Container(
                                            width: size.width * 0.3,
                                            margin: EdgeInsets.only(
                                                left: 5, right: 5),
                                            child: AnimatedTextKit(
                                              pause: Duration(seconds: 2),
                                              animatedTexts: [
                                                TypewriterAnimatedText(
                                                    "It is time for some\t${getMealType()}",
                                                    textAlign: TextAlign.center,
                                                    textStyle: TextStyle(
                                                      fontSize:
                                                          medium_text_size,
                                                    ),
                                                    speed: Duration(
                                                        milliseconds: 100)),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    (mealList.length < 3)
                                        ? Center(
                                            child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                          )
                                        : CarouselSlider(
                                            options: CarouselOptions(
                                              height: size.height * 0.25,
                                              initialPage: 0,
                                            ),
                                            items: [
                                              MealWidget(
                                                time: '07:30 AM',
                                                mealType: 'Breakfast',
                                                mealName: mealList
                                                        .elementAt(0)['name'] ??
                                                    'N/A',
                                                meal: mealList.elementAt(0) ??
                                                    null,
                                              ),
                                              MealWidget(
                                                time: '10:30 AM',
                                                mealType: 'Lunch',
                                                mealName: mealList
                                                        .elementAt(1)['name'] ??
                                                    'NA',
                                                meal: mealList.elementAt(1) ??
                                                    null,
                                              ),
                                              MealWidget(
                                                time: '6:30 PM',
                                                mealType: 'Dinner',
                                                mealName: mealList
                                                        .elementAt(2)['name'] ??
                                                    'N/A',
                                                meal: mealList.elementAt(2) ??
                                                    null,
                                              ),
                                            ],
                                          ),
                                  ],
                                ),
                              ),
                            ),
            ));
  }

  String getMealType() {
    int time = DateTime.now().hour;
    print(time);
    if (time <= 9) {
      return 'Breakfast';
    } else if (time >= 9 && time <= 12) {
      return 'Lunch';
    } else if (time >= 12 && time <= 18) {
      return 'Snacks';
    } else if (time >= 18 && time <= 22) {
      return 'Dinner';
    }
    return 'Breakfast';
  }

  //registering notification that is coming from the firebase cloud messaging service
  void registerNotification() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();

    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
      // For handling the received notifications
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Parse the message received
        WarningMessage notification = WarningMessage(
          message.notification?.title,
          message.notification?.body,
        );
        // For displaying the notification as an overlay
        showSimpleNotification(
          Text(notification.title),
          subtitle: Text(notification.content),
          background: Colors.cyan.shade700,
          duration: Duration(seconds: 2),
        );

        //add the notification to the database
        addNotificationMessage(notification);
      });
    } else {
      print('User declined or has not accepted permission');
    }
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  // For handling notification when the app is in terminated state

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      WarningMessage notification = WarningMessage(
        initialMessage.notification?.title,
        initialMessage.notification?.body,
      );
      //add the notification to the database
      addNotificationMessage(notification);
    }
  }
}
