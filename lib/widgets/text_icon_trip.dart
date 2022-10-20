import 'package:flutter/material.dart';

class Text_Icon_Trip extends StatefulWidget {
  Text_Icon_Trip(this.icontrip, this.texttrip,this.style);
  late Icon icontrip;
  String texttrip;
  TextStyle style;

  @override
  State<Text_Icon_Trip> createState() => _Text_Icon_TripState();
}

class _Text_Icon_TripState extends State<Text_Icon_Trip> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        widget.icontrip,
        SizedBox(width: 20,),
        Text(
          widget.texttrip,
          style:widget.style,
        ),
      ],
    );
  }
}

