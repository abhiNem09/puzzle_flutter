import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color? shade;
  final Widget? cardChild;
  final dynamic onPress;
  ReusableCard({this.shade, this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: shade, borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
