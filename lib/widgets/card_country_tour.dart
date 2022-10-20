import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:travel_app/screens/tour_details.dart';

import '../api/firebase_api.dart';
import '../utils/firebase_file.dart';

class CardCountryTour extends StatefulWidget {
  const CardCountryTour({Key? key}) : super(key: key);

  @override
  State<CardCountryTour> createState() => _CardCountryState();
}

class _CardCountryState extends State<CardCountryTour> {
  late Future<List<FirebaseFile>> futureFiles =
  FirebaseApi.listAll('Flags_Tour/');

  void initState() {
    super.initState();
    futureFiles = FirebaseApi.listAll('Flags_Tour/');
  }

  @override
  Widget build(BuildContext context) {
    int columnCount = 3;

    return FutureBuilder<List<FirebaseFile>>(
        future: futureFiles,
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            default:
              if (snapshot.hasError) {
                return Center(child: Text('Some error occurred!'));
              } else {
                final files = snapshot.data!;
                return Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 1.15,
                  child: AnimationLimiter(
                    child: GridView.count(
                      mainAxisSpacing: 30,
                      // crossAxisSpacing: 5,
                      crossAxisCount: columnCount,
                      children: List.generate(
                        files.length,
                            (int index) {
                          final file = files[index];
                          return GestureDetector(
                            onTap: () {
                              ifStatmentfromcountrytotour(index, context);
                            },
                            child: AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 375),
                              columnCount: columnCount,
                              child: ScaleAnimation(
                                child: FadeInAnimation(
                                  child: Column(
                                    children: [
                                      ClipRRect(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          child: Image.network(
                                            file.url,
                                            scale: 4,
                                          )),
                                      SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                );
              }
          }
        });
  }

  void ifStatmentfromcountrytotour(int index, BuildContext context) {
    if (index == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Tour_details(pictourrecieve: 'Tours_Pictures/1A',
                      texttourrecieve: 'wBKk3wUB0okr8DRRFq4M',
                      recievecollictionhotels: 'Tour(1)')

          ));
    } else if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Tour_details(pictourrecieve: 'Tours_Pictures/1B',
                      texttourrecieve: 'zmvGoOiL0LTobK1y5ChW',
                      recievecollictionhotels: 'Tour(2)')


          ));
    }
  }
}
