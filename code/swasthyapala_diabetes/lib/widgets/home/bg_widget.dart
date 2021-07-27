import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/services/http/bg.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/bg_level.dart';

class BGWidget extends StatefulWidget {
  @override
  _BGWidgetState createState() => _BGWidgetState();
}

class _BGWidgetState extends State<BGWidget> {
  final myController = TextEditingController();
  var currenBG = 00;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    getCurrentBgValue().then((value) {
      setState(() {
        currenBG = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                      'Type your BG'), // To display the title it is optional
                  content: SizedBox(
                    height: 50,
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: myController,
                      decoration: InputDecoration(
                        hintText: 'eg.45',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 1)),
                      ),
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          // DateTime dt = DateTime.now();
                          // final date = dt.year.toString() +
                          //     '/' +
                          //     dt.month.toString() +
                          //     '/' +
                          //     dt.day.toString();
                          // // print(date);
                          // print(currenBG);

                          addBgValue(int.parse(myController.text));
                          sendBgValueToServer(int.parse(myController.text));
                          setState(() {
                            currenBG = int.parse(myController.text);
                          });
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
        },
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$currenBG",
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Text(
                "BG LEVEL",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          width: 150,
          height: 150,
          margin: EdgeInsets.fromLTRB(50, 50, 10, 0),
          decoration: BoxDecoration(
              color: color1,
              border: Border.all(width: 4, color: Colors.black12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset.lerp(Offset(1, 1), Offset.zero, 0)!,
                  blurRadius: 1.0,
                  spreadRadius: 1.0,
                )
              ],
              borderRadius: BorderRadius.circular(75)),
        ),
      ),
    );
  }
}
