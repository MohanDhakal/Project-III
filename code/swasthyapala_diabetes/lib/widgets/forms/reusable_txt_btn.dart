import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/utility/text_btn_spec.dart';

class ReusableBtn extends StatelessWidget {
  final btnPlaceholder;
  ReusableBtn({this.btnPlaceholder});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          child: TextButton(
              onPressed: () {},
              child: Text(btnPlaceholder,
                  style: TextStyle(fontSize: normal_text_size)),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(getColor),
                foregroundColor:
                    MaterialStateProperty.all(normal_txt_color_black),
                elevation: MaterialStateProperty.resolveWith(getElevation),
              ))),
    );
  }
}
