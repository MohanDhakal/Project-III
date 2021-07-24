import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';

class UserForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
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
            padding: const EdgeInsets.only(top: 28.0, left: 8.0, right: 8.0),
            child: UserNameField(),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 28.0, left: 8.0, right: 8.0, bottom: 10.0),
            child: PhoneNumberField(),
          ),
          SaveUserButton(size: size)
        ],
      ),
    );
  }
}

class SaveUserButton extends StatelessWidget {
  const SaveUserButton({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      child: Container(
        width: size.width * 0.8,
        height: size.height * 0.05,
        child: Center(
          child: Text(
            'save',
            style: TextStyle(
                fontSize: medium_text_size, color: normal_txt_color_black),
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
    );
  }
}

class UserNameField extends StatelessWidget {
  const UserNameField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
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
        if (value!.length < 6) {
          return "invalid format";
        } else
          return null;
      },
    );
  }
}

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      // controller: myPhoneController,
      maxLines: null,
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
        return null;
        //   if (Validator.validatePhone((myPhoneController.text ?? "12")) ==
        //       false) {
        //     return "typed number is incorrect";
        //   } else
        //     return null;
      },
    );
  }
}
