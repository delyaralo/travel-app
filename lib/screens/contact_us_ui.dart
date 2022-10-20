import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/theme/color.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/app_bar_all_withouthomepage.dart';

class Contact_Us_Ui extends StatefulWidget {
  const Contact_Us_Ui({Key? key}) : super(key: key);

  @override
  State<Contact_Us_Ui> createState() => _Contact_Us_UiState();
}

class _Contact_Us_UiState extends State<Contact_Us_Ui> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarAllWithoutHomePage(
              textapp: 'Contact Us',
            ),
            StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection("Contact_Us_Text")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                   return Center(child: Text('Loading'));
                  }
                  return Padding(
                      padding: const EdgeInsets.all(20),
                      child: GlassmorphicContainer(
                        height: MediaQuery.of(context).size.height / 1.2,
                        blur: 12,
                        width: double.infinity,
                        borderRadius: 10,
                        linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF0FFFF).withOpacity(0.2),
                            Color(0xFF0FFFF).withOpacity(0.2),
                          ],
                        ),
                        border: 1,
                        borderGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xFF0FFFF).withOpacity(1),
                            Color(0xFFFFFFF),
                            Color(0xFF0FFFF).withOpacity(1),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: snapshot.data!.docs.map((element) {
                            return Stack(children: [
                               Container(
                                child:
                                    Image.asset('assets/icons/playstore.png'),
                                height: 200,
                                width: MediaQuery.of(context).size.width,
                              ),
                              Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.only(
                                    top: 170, right: 30, left: 30),
                                width: 450,
                                height: MediaQuery.of(context).size.height / 3,
                                child: Text(
                                  element['title'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 10,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.only(
                                    top: 280, right: 30, left: 30),
                                width: 450,
                                height:
                                    MediaQuery.of(context).size.height / 2.5,
                                child: Text(
                                  element['title1'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 10,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.all(20),
                                padding: EdgeInsets.only(
                                    top: 390, right: 30, left: 30),
                                width: 450,
                                height: MediaQuery.of(context).size.height / 2,
                                child: Text(
                                  element['title2'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 10,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                    top: 470, right: 30, left: 30),
                                margin: EdgeInsets.all(20),
                                height:
                                    MediaQuery.of(context).size.height / 1.3,
                                child: Text(
                                  element['title3'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    wordSpacing: 10,
                                    letterSpacing: 2,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 690,
                                left: 20,
                                right: 20,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                          onTap: () async {
                                            String url =
                                                'https://www.instagram.com/dastanworld_travel/';
                                            if (!url.contains('http'))
                                              url = 'https://$url';
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child: Image.asset(
                                            'assets/icons/instagram.png',
                                            height: 100,
                                            width: 100,
                                          )),
                                      SizedBox(
                                        width: 35,
                                      ),
                                      GestureDetector(
                                          onTap: () async {
                                            String url = 'www.dastanworld.com';
                                            if (!url.contains('http'))
                                              url = 'https://$url';
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child: Image.asset(
                                            'assets/icons/world-wide-web.png',
                                            height: 90,
                                            width: 90,
                                          )),
                                      SizedBox(
                                        width: 35,
                                      ),
                                      GestureDetector(
                                          onTap: () async {
                                            String url =
                                                'https://www.facebook.com/Dastanworld.travel';
                                            if (!url.contains('http'))
                                              url = 'https://$url';
                                            if (await canLaunch(url)) {
                                              await launch(url);
                                            } else {
                                              throw 'Could not launch $url';
                                            }
                                          },
                                          child: Image.asset(
                                            'assets/icons/facebook.png',
                                            width: 100,
                                            height: 100,
                                            fit: BoxFit.fill,
                                          )),
                                    ]),
                              ),
                            ]);
                          }).toList(),
                        ),
                      ));
                }),
          ],
        ),
      ),
    );
  }
}
