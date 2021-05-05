import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';

class HeightForm extends StatelessWidget {
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
                  decoration: InputDecoration(
                    hintText: '12',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'ft',
                style: TextStyle(
                    fontSize: medium_text_size, fontWeight: FontWeight.normal),
              ),
            ),
            SizedBox(
                width: 50,
                height: 50,
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: '9',
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'in',
                style: TextStyle(
                    fontSize: medium_text_size, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
