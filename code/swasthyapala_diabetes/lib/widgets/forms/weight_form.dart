import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/states/user_detail_bloc.dart';

class WeightForm extends StatefulWidget {
  @override
  _WeightFormState createState() => _WeightFormState();
}

class _WeightFormState extends State<WeightForm> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Weight:',
                  style: TextStyle(
                      fontSize: big_text_size, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                  width: 60,
                  height: 50,
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    onChanged: (text) {
                      if (text != '') {
                        Provider.of<UserDetailBloc>(context, listen: false)
                            .weight = double.parse(text);
                      }
                    },
                    decoration: InputDecoration(
                      hintText: '12.9',
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
                  'kg',
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
