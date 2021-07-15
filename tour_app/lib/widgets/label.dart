import 'package:flutter/cupertino.dart';

class Label extends StatelessWidget {

  String informationToDisplay;
  String informationLabelName;
  IconData iconToDisplay;

  Label(this.informationToDisplay, this.informationLabelName,
      this.iconToDisplay);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          this.informationToDisplay,
          style: TextStyle(
            fontSize: 24
          ),
        ),
        Row(
          children: [
            Column(
              children: [
                Icon(
                  this.iconToDisplay,
                  size: 15,
                )
              ],
            ),
            Column(
              children: [
                Text(
                    this.informationLabelName
                )
              ],
            )
          ],
        )
      ],
    );
  }
}