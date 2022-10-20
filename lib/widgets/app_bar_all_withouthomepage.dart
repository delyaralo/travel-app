import 'package:flutter/material.dart';

class AppBarAllWithoutHomePage extends StatelessWidget {
   AppBarAllWithoutHomePage( {required this.textapp});

  String textapp ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8,bottom: 12),
      child: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          '$textapp',
          style: TextStyle(
              color: Colors.black,
              letterSpacing: 2,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        leading: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,left: 8),
              child: IconButton(
                icon: Icon( Icons.arrow_back_ios,color: Colors.black,),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }
}
