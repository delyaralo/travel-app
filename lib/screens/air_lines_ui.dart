import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:travel_app/widgets/app_bar_all_withouthomepage.dart';

import '../api/firebase_api.dart';
import '../theme/color.dart';
import '../utils/firebase_file.dart';

class Air_Lines_Ui extends StatefulWidget {
  const Air_Lines_Ui({Key? key}) : super(key: key);

  @override
  State<Air_Lines_Ui> createState() => _Air_Lines_UiState();
}

class _Air_Lines_UiState extends State<Air_Lines_Ui> {
  late Future<List<FirebaseFile>> futureFilesAirline =
      FirebaseApi.listAll('Air_Lines_Pictures/');

  @override
  void initState() {
    super.initState();
    futureFilesAirline = FirebaseApi.listAll('Air_Lines_Pictures/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarAllWithoutHomePage(textapp: 'Air Lines list'),
            FutureBuilder<List<FirebaseFile>>(
                future: futureFilesAirline,
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return Center(
                          child: Container(
                              height: 280,
                              width: 280,
                              child: CircularProgressIndicator()));
                    default:
                      if (snapshot.hasError) {
                        return Center(child: Text('Some error occurred!'));
                      } else {
                        final files = snapshot.data!;
                        return AnimationLimiter(
                            child: Column(
                          children: List.generate(
                            files.length,
                            (int index) {
                              final file = files[index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 300),
                                child: SlideAnimation(
                                  child: FadeInAnimation(
                                    child: Container(
                                      height: 160,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Image.network(file.url,fit: BoxFit.fill,),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ));
                      }
                  }
                }),
          ],
        ),
      ),
    );
  }
}
