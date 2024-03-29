import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/gender.dart';
import 'package:swasthyapala_diabetes/enums-const/selection_status.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/models/survey.dart';
import 'package:swasthyapala_diabetes/screens/home_ui.dart';
import 'package:swasthyapala_diabetes/services/http/profile.dart';
import 'package:swasthyapala_diabetes/states/activity_selection_bloc.dart';
import 'package:swasthyapala_diabetes/states/sex_selection_bloc.dart';
import 'package:swasthyapala_diabetes/states/user_detail_bloc.dart';
import 'package:swasthyapala_diabetes/utility/enum_to_string.dart';
import 'package:swasthyapala_diabetes/utility/text_btn_spec.dart';

class ReusableBtn extends StatelessWidget {
  final btnPlaceholder;
  ReusableBtn({this.btnPlaceholder});
  @override
  Widget build(BuildContext pcontext) {
    return Center(
      child:
          Container(child: Consumer3<GenderBloc, UserDetailBloc, ActivityBloc>(
        builder: (context, g, u, a, child) {
          return TextButton(
              onPressed: () {
                final ud = UserDetail();
                ud.sex = getTextFromEnum(Gender, g.gender);
                ud.activity = getTextFromEnum(Activity, a.activity);
                ud.height = u.height;
                ud.weight = u.weight;
                ud.age = u.age;
                ud.allergy = "LACTOSE_INTOLERANT";
                addUserProfile(ud);
                Navigator.push(
                    pcontext, MaterialPageRoute(builder: (_) => HomeUI()));
                // print(ud.toMap());
              },
              child: Text(btnPlaceholder,
                  style: TextStyle(fontSize: normal_text_size)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(getColor),
                foregroundColor:
                    MaterialStateProperty.all(normal_txt_color_black),
                elevation: MaterialStateProperty.resolveWith(getElevation),
              ));
        },
      )),
    );
  }
}
