import 'package:animation_list/animation_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:travel_app/screens/hotel_details.dart';
import 'package:travel_app/screens/hotels_ui.dart';

import '../api/firebase_api.dart';
import '../theme/color.dart';
import '../utils/firebase_file.dart';

class CardCountry extends StatefulWidget {
  const CardCountry({Key? key}) : super(key: key);

  @override
  State<CardCountry> createState() => _CardCountryState();
}

class _CardCountryState extends State<CardCountry> {
  late Future<List<FirebaseFile>> futureFiles =
  FirebaseApi.listAll('Flags_Hotel/');

  void initState() {
    super.initState();
    futureFiles = FirebaseApi.listAll('Flags_Hotel/');
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
                              ifStatmentfromcountrytohotel(index, context);
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

  void ifStatmentfromcountrytohotel(int index, BuildContext context) {
    if (index == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Hotel_details(
                    pichotelrecieve: 'Hotels_Pictures/1A/',
                    texthotelrecieve: 'Ev1kV9eBzBItObHPr79x', recievecollictionhotels: 'Hotels',
                  )));
    } else if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  Hotel_details(
                    pichotelrecieve: 'Hotels_Pictures/1B/',
                    texthotelrecieve: 'YJo5HogF5dg5wWGLVGsz', recievecollictionhotels: 'Hotels2',

                  )));
      // } else if (index == 2) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1C/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 3) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1D/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 4) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1E/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 5) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1F/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 6) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1G/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 7) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1H/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 8) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1I/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 9) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1J/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 10) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1K/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 11) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1L/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 12) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1M/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 13) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1N/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 14) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1O/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 15) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1P/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 16) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1Q/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 17) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1R/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 18) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1S/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 19) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1T/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 20) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1U/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 21) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1V/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 22) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1W/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 23) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1X/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // }else if (index == 24) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1Y/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // }else if (index == 25) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/1Z/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // }else if (index == 26) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/A/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 27) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/B/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 28) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/C/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 29) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/D/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 30) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/E/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 31) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/F/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 32) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/G/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 33) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/H/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 34) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/I/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 35) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/J/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 36) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/K/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 37) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/L/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 38) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/M/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 39) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/N/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 40) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/O/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 41) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/P/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 42) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/Q/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 43) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/R/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 44) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/S/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 45) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/T/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 46) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/U/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 47) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/V/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // } else if (index == 48) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/W/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // }else if (index == 49) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/X/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // }else if (index == 50) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/Y/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // }else if (index == 51) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => Hotel_details(
      //                 pichotelrecieve: 'Hotels_Pictures/Z/',
      //                 texthotelrecieve: 'Hotel_Details',
      //               )));
      // }
    }
  }
}
