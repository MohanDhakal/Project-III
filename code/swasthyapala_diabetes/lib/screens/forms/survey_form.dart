import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/gender.dart';
import 'package:swasthyapala_diabetes/enums-const/selection_status.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/states/ActivitySelection.dart';
import 'package:swasthyapala_diabetes/states/SexSelection.dart';
import 'package:swasthyapala_diabetes/states/user_detail_bloc.dart';
import 'package:swasthyapala_diabetes/utility/shadow.dart';
import 'package:swasthyapala_diabetes/widgets/forms/reusable_txt_btn.dart';
import 'package:swasthyapala_diabetes/widgets/forms/selection_btn.dart';
import 'package:swasthyapala_diabetes/widgets/forms/height_form.dart';
import 'package:swasthyapala_diabetes/widgets/forms/weight_form.dart';

class SurveyForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
        child: MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GenderBloc()),
        ChangeNotifierProvider(create: (_) => ActivityBloc()),
        ChangeNotifierProvider(create: (_) => UserDetailBloc()),
      ],
      child: Container(
        margin: EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * 0.20,
                child: Image.asset('asset/images/nutritionist.png'),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: 10, left: 8.0, bottom: size.height * 0.05),
                  child: RichText(
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text: "Let's \nGo through \nYour Detail Now",
                      style: TextStyle(
                          color: normal_txt_color_black,
                          fontSize: big_text_size,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
              WeightForm(),
              HeightForm(),
              AgeForm(),
              getSexSelectionForm(),
              getActivitySelectionForm(),
              ReusableBtn(
                btnPlaceholder: "Add Your Detail",
              )
            ],
          ),
        ),
      ),
    ));
  }

  Padding getActivitySelectionForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<ActivityBloc>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Activity:',
                style: TextStyle(fontSize: big_text_size),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomSelectionBtn(
                  placeholder: Activity.Ha,
                  title: Activity,
                  shadow: (value.activity == Activity.Ha
                      ? showInnerShadow()
                      : null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomSelectionBtn(
                  placeholder: Activity.Mo,
                  title: Activity,
                  shadow: (value.activity == Activity.Mo
                      ? showInnerShadow()
                      : null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: CustomSelectionBtn(
                  placeholder: Activity.Se,
                  title: Activity,
                  shadow: (value.activity == Activity.Se
                      ? showInnerShadow()
                      : null),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Padding getSexSelectionForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Consumer<GenderBloc>(
        builder: (context, value, child) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Gender:',
                style: TextStyle(fontSize: big_text_size),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSelectionBtn(
                  placeholder: Gender.Male,
                  title: Gender,
                  shadow:
                      value.gender == Gender.Male ? showInnerShadow() : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSelectionBtn(
                  placeholder: Gender.Female,
                  title: Gender,
                  shadow:
                      value.gender == Gender.Female ? showInnerShadow() : null,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomSelectionBtn(
                  placeholder: Gender.Other,
                  title: Gender,
                  shadow:
                      value.gender == Gender.Female ? showInnerShadow() : null,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class AgeForm extends StatelessWidget {
  const AgeForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          margin: EdgeInsets.all(5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  'Age:',
                  style: TextStyle(
                      fontSize: big_text_size, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                  width: 50,
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      if (text != '') {
                        Provider.of<UserDetailBloc>(context, listen: false)
                            .age = int.parse(text);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '32',
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(color: Colors.black, width: 1)),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'year',
                  style: TextStyle(
                      fontSize: medium_text_size,
                      fontWeight: FontWeight.normal),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
