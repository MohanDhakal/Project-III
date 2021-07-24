import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/gender.dart';
import 'package:swasthyapala_diabetes/enums-const/selection_status.dart';
import 'package:swasthyapala_diabetes/states/ActivitySelection.dart';
import 'package:swasthyapala_diabetes/states/SexSelection.dart';
import 'package:swasthyapala_diabetes/utility/enum_to_string.dart';

class CustomSelectionBtn extends StatelessWidget {
  final shadow;
  final placeholder;
  final title;
  CustomSelectionBtn({this.placeholder, this.shadow, this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == Activity) {
          Provider.of<ActivityBloc>(context, listen: false).activity =
              this.placeholder;
        } else if (title == Gender) {
          Provider.of<GenderBloc>(context, listen: false).gender =
              this.placeholder;
        }
      },
      child: Container(
        height: 30,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(getTextFromEnum(title, placeholder)),
        )),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            color: color5,
            boxShadow: shadow,
            borderRadius: BorderRadius.circular(12)),
      ),
    );
  }
}

// class AgeSexActivity extends StatefulWidget {
//   @override
//   _AgeSexActivityState createState() => _AgeSexActivityState();
// }

// class _AgeSexActivityState extends State<AgeSexActivity> {
//   String activity = "Sedentary";
//   String sex = "male";

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               'Activity:',
//               style: TextStyle(fontSize: big_text_size),
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: DropdownButtonFormField(
//                 value: activity,
//                 onChanged: (newValue) {
//                   setState(() {
//                     activity = newValue;
//                   });
//                 },
//                 items: <String>[
//                   'Highly Active',
//                   'Moderately Active',
//                   'Sedentary',
//                 ].map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
