// import 'dart:html';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/screens/detail_screen.dart';

class MealDetail extends StatelessWidget {
  final meal;
  MealDetail({this.meal});
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: normal_txt_color_black,
            ),
          ),
          title: Text(
            'Breakfast',
            style: TextStyle(
                fontSize: medium_text_size, color: normal_txt_color_black),
          ),
          backgroundColor: color1,
        ),
        body: Container(
          color: Colors.purple,
          child: Column(children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
              child: Card(
                margin: EdgeInsets.all(0),
                elevation: 2.0,
                shadowColor: Colors.black,
                child: Container(
                    height: size.height * 0.4,
                    width: size.width,
                    color: color1,
                    child: Stack(
                      children: [
                        Positioned(
                          top: size.height * 0.05,
                          left: size.width * 0.1,
                          right: size.width * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset(
                                'asset/images/boul.png',
                                height: 150,
                                width: 150,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 20.0),
                                child: Text(
                                  meal['name'],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: medium_text_size,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
              ),
            ),
            SizedBox(
              width: size.width,
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    // print(meal['protein']);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => NutritionDetail(meal)),
                    );
                  },
                  child: ExploreMealDetailBtn(
                      text: 'Nutrition', imagePath: 'asset/images/boul.png'),
                ),
                ExploreMealDetailBtn(
                    text: 'Cooking Procedure',
                    imagePath: 'asset/images/boul.png'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    var value = jsonDecode(meal['ingredients']);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IngredientDetail(value)));
                  },
                  child: ExploreMealDetailBtn(
                      text: 'Ingredients', imagePath: 'asset/images/boul.png'),
                ),
                ExploreMealDetailBtn(
                    text: 'Cooking Procedure',
                    imagePath: 'asset/images/boul.png'),
              ],
            ),
          ]),
        ));
  }
}

class ExploreMealDetailBtn extends StatelessWidget {
  final text, imagePath;
  const ExploreMealDetailBtn({Key? key, this.text, this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,
      margin: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: color2),
          borderRadius: BorderRadius.circular(20),
          color: color7),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 50,
            width: 50,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

class TitleHorizontalLine extends StatelessWidget {
  final titleText;
  const TitleHorizontalLine({
    Key? key,
    @required this.titleText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Row(
      children: [
        Container(
          width: size.width * 0.1,
          height: 1,
          color: Colors.black38,
        ),
        Container(
          width: 100,
          child: Center(
            child: Text(
              titleText,
              style: TextStyle(
                  fontSize: medium_text_size, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          width: (size.width) - (size.width * 0.1 + 102),
          height: 1,
          color: Colors.black38,
        ),
      ],
    );
  }
}
