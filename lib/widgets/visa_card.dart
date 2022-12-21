import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import '../api/firebase_api.dart';
import '../utils/firebase_file.dart';

class Visa_card extends StatefulWidget {
  // Visa_card(this.visadoc,this.visacol);
  String? visadoc;
  String? visacol;

  @override
  State<Visa_card> createState() => _Visa_cardState();
}

class _Visa_cardState extends State<Visa_card> {
  late Future<List<FirebaseFile>> futureFilesvisa =
      FirebaseApi.listAll('Visa_Pictures/');

  void initState() {
    super.initState();
    futureFilesvisa = FirebaseApi.listAll('Visa_Pictures/');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<FirebaseFile>>(
        future: futureFilesvisa,
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
                  child: ListView.builder(
                      itemCount: files.length,
                      itemBuilder: (BuildContext context, int index) {
                        ifstate(index);
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
                                            .collection("Visa_Text")
                                            .doc('${widget.visadoc}')
                                            .collection('${widget.visacol}')
                                            .snapshots(),
                                        builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                                          if (!snapshot.hasData) {
                                          return  Center(child: CircularProgressIndicator());
                                          }
                                          return Container(
                                            height: 200,
                                            width: 200,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: snapshot.data!.docs
                                                  .map((element) {
                                                return Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 10, left: 20),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        element['name'],
                                                        style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(element['cost'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      SizedBox(
                                                        height: 25,
                                                      ),
                                                      Text(
                                                          element[
                                                              'extractionperiod'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                );
                                              }).toList(),
                                            ),
                                          );
                                        }),
                                  ]),
                                ),
                              ]),
                            ),
                          ),
                        );
                      }),
                );
              }
          }
        });
  }

  void ifstate(int index) {
    if (index == 0) {
      widget.visadoc =
          '5YIjaYOGZFs3pV8EMOuh';
      widget.visacol = 'visa 1';
    } else if (index == 1) {
      widget.visadoc =
          'zRj8xBJpV8EL84lrqS8m';
      widget.visacol = 'visa 2';
    } else if (index == 2) {
      widget.visadoc =
          'v2bBioOZnV0s7Z3L9pNS';
      widget.visacol = 'visa 3';
    }
    else if (index == 3) {
      widget.visadoc =
          'jGyFTNq32cX7rhxEfnyQ';
      widget.visacol = 'visa 4';
    }
    else if(index == 4){
        widget.visadoc= 'bJPpdpMiWxcn16YmZ0ze';
        widget.visacol= 'visa 5';
      }
    else if(index == 5){
        widget.visadoc= '6VZvrgffFlCrGjJGiycd';
        widget.visacol= 'visa 6';
      }
  }
}
