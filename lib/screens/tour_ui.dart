import 'package:flutter/material.dart';

import '../theme/color.dart';
import '../widgets/app_bar_all_withouthomepage.dart';
import '../widgets/card_country_tour.dart';

class Tour_Ui extends StatefulWidget {
  const Tour_Ui({Key? key}) : super(key: key);

  @override
  State<Tour_Ui> createState() => _Tour_UiState();
}

class _Tour_UiState extends State<Tour_Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AppBarAllWithoutHomePage(
              textapp: 'Contries',
            ),
            CardCountryTour(),
          ],
        ),
      ),
    );
  }
}
