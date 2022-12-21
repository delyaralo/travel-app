import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:travel_app/widgets/visa_card.dart';

import '../api/firebase_api.dart';
import '../theme/color.dart';
import '../utils/firebase_file.dart';
import '../widgets/app_bar_all_withouthomepage.dart';

class Visa_Ui extends StatefulWidget {
  // Visa_Ui({required this.visadoc1, required this.visacol1});
  // late String visadoc1;
  // late String visacol1;

  @override
  State<Visa_Ui> createState() => _Visa_UiState();
}


class _Visa_UiState extends State<Visa_Ui> {


  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarAllWithoutHomePage(textapp: 'Visa List'),
            Visa_card()
          ],
        ),
      ),
    );
  }
  // void ifstate(List <int> index, BuildContext context) {
  //   if (index == 0) {
  //     widget.visadoc1= '5YIjaYOGZFs3pV8EMOuh';
  //     widget.visacol1= 'visa 1';
  //
  //   }else if(index==1){
  //     widget.visadoc1= 'zRj8xBJpV8EL84lrqS8m';
  //     widget.visacol1= 'visa 2';
  //   }
  // }


}