import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_app/screens/air_lines_ui.dart';
import 'package:travel_app/screens/contact_us_ui.dart';
import 'package:travel_app/screens/tour_ui.dart';
import 'package:travel_app/screens/visa_ui.dart';

import 'package:travel_app/theme/color.dart';
import 'package:travel_app/utils/data.dart';
import 'package:travel_app/widgets/category_item.dart';

import 'package:travel_app/screens/details_trip.dart';

import '../api/firebase_api.dart';
import '../utils/firebase_file.dart';
import 'hotels_ui.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<FirebaseFile>> futureFiles =
      FirebaseApi.listAll('HomePage/');

  void initState() {
    super.initState();
    futureFiles = FirebaseApi.listAll('HomePage/');
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: FutureBuilder<List<FirebaseFile>>(
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
                  return Column(children: [
                    buildBody(),
                    CarouselSlider(
                      options: CarouselOptions(
                        enableInfiniteScroll: false,
                        height: 370,
                        enlargeCenterPage: true,
                        disableCenter: true,
                        viewportFraction: .75,
                      ),
                      items: List.generate(files.length, (index) {
                        final file = files[index];
                        return GestureDetector(
                          onTap: () {
                            ifstatement(index, context);
                          },
                          child: Container(
                            width: 250,
                            height: 350,
                            child: Stack(children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  file.url,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(.5),
                                          Colors.white.withOpacity(.01),
                                        ]),
                                    borderRadius: BorderRadius.circular(20)),
                              ),
                            ]),
                            // }
                          ),
                        );
                      }),
                    ),
                  ]);
                }
            }
          }),
    );
  }

  void ifstatement(int index, BuildContext context) {
    if (index == 0) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailsTrip(
                    pathfire: 'Details_Trip/1A/',
                    idfiredetails: '3YwIxzwmJJ4I1yG8LcsS',
                    // // idfiredetails: 'Details_Trip',
                  )));
    } else if (index == 1) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  DetailsTrip(
                    pathfire: 'Details_Trip/1B/',
                    idfiredetails: 'FrcdAkruzApQuDUexbAq',
                    // idfiredetails: 'Details_Trip(2)',
                  )));
      // } else if (index == 2) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1C/',
      //                 // idfiredetails:'Details_Trip',
      //               )));
      // } else if (index == 3) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1D/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 4) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1E/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 5) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1F/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 6) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1G/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 7) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1H/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 8) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1I/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 9) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1J/',
      //                 // idfiredetails:'Details_Trip',
      //               )));
      // } else if (index == 10) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_TriP/1K/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 11) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1L/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 12) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_TriP/1M/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 13) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1N/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 14) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1O/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 15) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1P/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 16) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1Q/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 17) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1R/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 18) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1S/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 19) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1T/',
      //                 // idfiredetails:'Details_Trip',
      //               )));
      // } else if (index == 20) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1U/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 21) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1V/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 22) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1W/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 23) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1X/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 24) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1Y/',
      //                 // idfiredetails:'Details_Trip',
      //               )));
      // } else if (index == 25) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/1Z/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 26) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/A/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 27) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/B/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 28) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/C/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 29) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/D/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 30) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/E/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 31) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/F/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 32) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/G/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 33) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/H/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 34) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/I/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 35) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/J/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 36) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/K/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 37) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/L/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 38) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/M/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 39) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/N/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // } else if (index == 40) {
      //   Navigator.push(
      //       context,
      //       MaterialPageRoute(
      //           builder: (context) => DetailsTrip(
      //                 pathfire: 'Details_Trip/O/',
      //                 // idfiredetails: 'Details_Trip',
      //               )));
      // }
    }
  }

  Widget getAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Dastan World",
                style: TextStyle(
                    color: textColor,
                    fontSize: 22,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 3,
              ),
              Text("Let's Explore",
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  )),
            ],
          )),
        ],
      ),
    );
  }

  buildBody() {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(top: 60, bottom: 10, left: 10, right: 10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          getAppBar(),
          SizedBox(
            height: 25,
          ),
          Container(
            child: getCategories(),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
            child: Text("Most Popular",
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                )),
          ),
        ]),
      ),
    );
  }

  getCategories() {
    List<Widget> lists = List.generate(
        categories.length,
        (index) => CategoryItem(
              data: categories[index],
              color: listColors[index % 10],
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Hotels_Ui(),
                    ),
                  );
                }else if(index == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Tour_Ui(),
                    ),
                  );
                }else if(index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Air_Lines_Ui(),
                    ),
                  );
                }else if(index == 3) {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Visa_Ui(),
                      ),
                    );
                }else if(index == 4) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Contact_Us_Ui(),
                    ),
                  );
                }
              },
            ));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }
}
