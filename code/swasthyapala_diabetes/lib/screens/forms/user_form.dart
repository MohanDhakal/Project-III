import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/screens/forms/survey_form.dart';
import 'package:swasthyapala_diabetes/screens/home_ui.dart';
import 'package:swasthyapala_diabetes/services/http/user.dart';
import 'package:swasthyapala_diabetes/services/shared_pref/session.dart';

class UserForm extends StatefulWidget {
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final myNameController = new TextEditingController();

  final myPhoneController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                    child: SizedBox(
                      height: size.height * 0.3,
                      child: Image.asset('asset/images/nutritionist.png'),
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 8.0,
                    ),
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: "Let's \nRegister \nFirst",
                        style: TextStyle(
                            color: normal_txt_color_black,
                            fontSize: big_text_size,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 28.0, left: 8.0, right: 8.0),
                child: TextFormField(
                  keyboardType: TextInputType.multiline,
                  controller: myNameController,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), gapPadding: 4),
                    labelText: "username",
                    labelStyle: TextStyle(
                      fontSize: medium_text_size,
                    ),
                    errorMaxLines: 2,
                    hintText: " enter your user name",
                    hintStyle: TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 6) {
                      return "invalid format";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 28.0, left: 8.0, right: 8.0, bottom: 10.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  controller: myPhoneController,
                  textDirection: TextDirection.ltr,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10), gapPadding: 4),
                    labelText: "phone number",
                    labelStyle: TextStyle(fontSize: medium_text_size),
                    errorMaxLines: 2,
                    hintText: "9865***432",
                    hintStyle: TextStyle(fontSize: 15, color: Colors.black12),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    if (value.length < 10) {
                      return "please input number in correct format";
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    //SEND USER TO SERVER
                    addUser(myNameController.text, myPhoneController.text);

                    //ADD TO SEESSION
                    addSession(myNameController.text, myPhoneController.text);
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => SurveyForm()));
                    // print(myNameController.text);
                    // print(myPhoneController.text);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form not validate')));
                  }
                },
                child: Container(
                  width: size.width * 0.8,
                  height: size.height * 0.05,
                  child: Center(
                    child: Text(
                      'save',
                      style: TextStyle(
                          fontSize: medium_text_size,
                          color: normal_txt_color_black),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  onSurface: color1,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(24),
                    side: BorderSide(color: Colors.black38),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
