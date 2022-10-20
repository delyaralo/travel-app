import 'package:flutter/material.dart';
import 'package:travel_app/widgets/tour_card.dart';

import '../theme/color.dart';
import '../widgets/app_bar_all_withouthomepage.dart';

class Tour_details extends StatefulWidget {
  Tour_details(
      {required this.pictourrecieve,
      required this.texttourrecieve,
      required this.recievecollictionhotels});

  String pictourrecieve;
  String texttourrecieve;
  String recievecollictionhotels;

  @override
  State<Tour_details> createState() => _Tour_detailsState();
}

class _Tour_detailsState extends State<Tour_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      body: Column(
        children: [
          AppBarAllWithoutHomePage(textapp: 'Tours List'),
          TourCard(
              picfiretour: widget.pictourrecieve,
              idfiredetailstour: widget.texttourrecieve,
              CollictionTour: widget.recievecollictionhotels)
        ],
      ),
    );
  }
}
