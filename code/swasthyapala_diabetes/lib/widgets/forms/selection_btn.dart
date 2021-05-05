import 'package:flutter/material.dart';
import 'package:swasthyapala_diabetes/enums-const/colors.dart';
import 'package:swasthyapala_diabetes/enums-const/sizes.dart';
import 'package:swasthyapala_diabetes/utility/shadow.dart';

class CustomSelectionBtn extends StatefulWidget {
  final placeholder;
  CustomSelectionBtn({this.placeholder});
  @override
  _CustomSelectionBtnState createState() => _CustomSelectionBtnState();
}

class _CustomSelectionBtnState extends State<CustomSelectionBtn> {
  var shadow;
  int pressCounter = 0;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if ((pressCounter++) % 2 == 0)
            shadow = showInnerShadow();
          else
            shadow = null;
        });
      },
      child: Container(
        height: 30,
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Text(widget.placeholder),
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
