import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransparentButton extends StatelessWidget {
  final String text;
  final Function onTap;

  TransparentButton({Key key, this.text, this.onTap}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.horizontal(
            right: Radius.circular(36),
            left: Radius.circular(36)
          ),
          color: Colors.grey.withOpacity(0.5)
        ),
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(
              fontSize: 18
            ),
          ),
        ),
      ),
    );
  }


}