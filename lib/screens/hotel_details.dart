import 'package:flutter/material.dart';
import 'package:travel_app/theme/color.dart';
import 'package:travel_app/widgets/hote_lcard.dart';

import '../widgets/app_bar_all_withouthomepage.dart';

class Hotel_details extends StatefulWidget {
  Hotel_details(
      {required this.pichotelrecieve, required this.texthotelrecieve,required this.recievecollictionhotels});

  String pichotelrecieve;
  String texthotelrecieve;
  String recievecollictionhotels;

  @override
  State<Hotel_details> createState() => _Hotel_detailsState();
}

class _Hotel_detailsState extends State<Hotel_details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBarColor,
      body: Column(
        children: [
          AppBarAllWithoutHomePage(textapp: 'Hotels List'),
          HotelCard(
            picfirehotel: '${widget.pichotelrecieve}',
            idfiredetails: '${widget.texthotelrecieve}', CollictionHotels: '${widget.recievecollictionhotels}',
          ),
        ],
      ),
    );
  }
}
