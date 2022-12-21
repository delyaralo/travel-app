import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../api/firebase_api.dart';
import '../utils/firebase_file.dart';

class TourCard extends StatefulWidget {
  TourCard(
      {required this.picfiretour,
        required this.idfiredetailstour,
        required this.CollictionTour});

  late String picfiretour;
  late String idfiredetailstour;
  late String CollictionTour;

  @override
  State<TourCard> createState() => _TourCardState();
}

class _TourCardState extends State<TourCard> {
  late Future<List<FirebaseFile>> futureFiles =
  FirebaseApi.listAll('${widget.picfiretour}');


  void initState() {
    super.initState();
    futureFiles = FirebaseApi.listAll('${widget.picfiretour}');
  }

  @override
  Widget build(BuildContext context) {
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
                  height: MediaQuery.of(context).size.height / 1.15,
                  child: AnimationLimiter(
                    child: ListView.builder(
                        itemCount: files.length,
                        itemBuilder: (BuildContext context, int index) {
                          final file = files[index];
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Column(children: [
                                  Container(
                                    height: 200,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(9)),
                                      color: Colors.white,
                                    ),
                                    child: Row(children: [
                                      AnimatedContainer(
                                        curve: Curves.fastOutSlowIn,
                                        decoration: BoxDecoration(
                                          color: Colors.black26,
                                        ),
                                        width: 200,
                                        padding: EdgeInsets.all(10),
                                        height: double.infinity,
                                        duration: Duration(seconds: 20),
                                        child: Image.network(
                                          file.url,
                                          height: 50,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                      StreamBuilder(
                                          stream: FirebaseFirestore.instance
                                              .collection("Tour_Details")
                                              .doc('${widget.idfiredetailstour}')
                                              .collection(
                                              '${widget.CollictionTour}')
                                              .snapshots(),
                                          builder: (context,
                                              AsyncSnapshot<QuerySnapshot>
                                              snapshot) {
                                            if (!snapshot.hasData) {
                                             return Center(child: Text('Loading'));
                                            }
                                            return Container(
                                              height: 200,
                                              width: 250,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: snapshot.data!.docs
                                                      .map((element) {
                                                    return Padding(
                                                      padding:
                                                      const EdgeInsets.only(
                                                          top: 10, left: 15),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Text(
                                                            element['Name'],
                                                            style: TextStyle(
                                                                fontSize: 20,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(element['Rate'],
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(element['Cost'],
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                          SizedBox(
                                                            height: 25,
                                                          ),
                                                          Text('Address:',
                                                              style: TextStyle(
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Text(element['Location'],
                                                              style: TextStyle(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold))
                                                        ],
                                                      ),
                                                    );
                                                  }).toList()),
                                            );
                                          }),
                                    ]),
                                  ),
                                ]),
                              ),
                            ),
                          );
                        }),
                  ),
                );
              }
          }
        });
  }
}
