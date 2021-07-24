import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/states/user_detail_bloc.dart';

class HeightForm extends StatefulWidget {
  @override
  _HeightFormState createState() => _HeightFormState();
}

class _HeightFormState extends State<HeightForm> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Height: ',
                style: TextStyle(fontSize: big_text_size),
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
                          .height = double.parse(text);
                    }
                  },
                  decoration: InputDecoration(
                    hintText: '5.8',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                'ft.',
                style: TextStyle(
                    fontSize: medium_text_size, fontWeight: FontWeight.normal),
              ),
            ),
            Text(
              'in',
              style: TextStyle(
                  fontSize: medium_text_size, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
    );
  }
}
