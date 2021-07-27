import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/models/contact_pref.dart';
import 'package:swasthyapala_diabetes/services/db_storage/contact_preference.dart';
import 'package:swasthyapala_diabetes/services/sms/sms_service.dart';

class ContactAuthorizationBtn extends StatefulWidget {
  final text, phone;

  ContactAuthorizationBtn(this.text, this.phone);

  @override
  _ContactAuthorizationBtnState createState() =>
      _ContactAuthorizationBtnState();
}

class _ContactAuthorizationBtnState extends State<ContactAuthorizationBtn> {
  ContactPref cpf = ContactPref();

  @override
  void initState() {
    super.initState();
    getPreferences(widget.phone).then((value) {
      if (value.length > 0) {
        setState(() {
          cpf = ContactPref().fromJson(value.elementAt(0));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: handleTap,
      child: Container(
        height: 50,
        width: 150,
        margin: EdgeInsets.only(top: 10),
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(widget.text),
        )),
        decoration: BoxDecoration(
            border: Border.all(color: normal_txt_color_black),
            color: _assignColor(),
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  void handleTap() {
    if (widget.text == 'Send Meal Info') {
      if (cpf.mealPref == 0) {
        updateMealInfo(1, widget.phone);
        sendSmsToUser();
        setState(() {
          cpf.mealPref = 1;
        });
      } else {
        updateMealInfo(0, widget.phone);
        setState(() {
          cpf.mealPref = 0;
        });
      }
    } else {
      if (cpf.emerPref == 0) {
        updateEmerInfo(1, widget.phone);
        setState(() {
          cpf.emerPref = 1;
        });
      } else {
        updateEmerInfo(0, widget.phone);
        setState(() {
          cpf.emerPref = 0;
        });
      }
    }
  }

  Color _assignColor() {
    if (widget.text == 'Send Meal Info') {
      if (cpf.mealPref == 1) {
        return color1;
      } else
        return color10;
    } else {
      if (cpf.emerPref == 1) {
        return color1;
      } else
        return color10;
    }
  }
}
