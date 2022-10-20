import 'package:flutter/material.dart';
import 'package:travel_app/widgets/app_bar_all_withouthomepage.dart';

import '../theme/color.dart';

import '../widgets/card_country.dart';

class Hotels_Ui extends StatefulWidget {
  Hotels_Ui({Key? key}) : super(key: key);

  @override
  State<Hotels_Ui> createState() => _Hotels_UiState();
}

class _Hotels_UiState extends State<Hotels_Ui> {
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
            CardCountry(),
          ],
        ),
      ),
    );
  }
}
