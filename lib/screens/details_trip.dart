import 'dart:io';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pdf/pdf.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:travel_app/screens/tour_ui.dart';
import 'package:travel_app/widgets/text_icon_trip.dart';
import '../api/firebase_api.dart';
import '../theme/color.dart';
import '../utils/firebase_file.dart';
import '../widgets/app_bar_all_withouthomepage.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' as http;

class DetailsTrip extends StatefulWidget {
  DetailsTrip({required this.pathfire, required this.idfiredetails});

  String pathfire;

  String idfiredetails;

  @override
  State<DetailsTrip> createState() => _DetailsTripState();
}

class _DetailsTripState extends State<DetailsTrip> {
  late Future<List<FirebaseFile>> futureFiles =
      FirebaseApi.listAll('${widget.pathfire}');
  late Future<PdfDocument> _document;

  List listdoc = [];

  void getData() async {
    var refcol = FirebaseFirestore.instance
        .collection('Details_Trip')
        .doc('${widget.idfiredetails}');
    var responsdoc = await refcol.get();
    setState(() {
      listdoc.add(responsdoc.data());
    });
  }

  void initState() {
    super.initState();
    getData();
    futureFiles = FirebaseApi.listAll('${widget.pathfire}');
  }

  var number = 0;

  void increamnt() {
    setState(() {
      number++;
    });
  }

  void downloadPDF() async {
    var storageRef = FirebaseStorage.instance.ref().child('pdf/1.pdf');
    dynamic data = await storageRef.getData();

    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      //add more permission to request here.
    ].request();
    if (statuses[Permission.storage]!.isGranted) {
      showtoast('File Downloaded');

      increamnt();

      List<int> bytes = data;
      File file = File('/storage/emulated/0/Download/dastan$number.pdf');
      await file.writeAsBytes(bytes);
     // showsnackbar(context);
    } else {
      showtoast('Download Filed');
    }
  }

  void showtoast(String title) => Fluttertoast.showToast(
        msg: title,
        fontSize: 15,
        backgroundColor: Colors.blue,
        textColor: Colors.white,
      );

  // void showsnackbar(BuildContext context) {
  //   final snackbar = SnackBar(content: Text('File Downloaded'),
  //  backgroundColor: Colors.black45,
  //   padding: EdgeInsets.all(10),
  //   shape: Border.symmetric(),
  //
  //     action: SnackBarAction(
  //       textColor: Colors.white,
  //       label: "Open File",
  //       onPressed: (){
  //
  //         File('/storage/emulated/0/Download/dastan$number.pdf');
  //       },
  //     ),
  //   );
  //   ScaffoldMessenger.of(context)..showSnackBar(snackbar);
  // }





  // String fileurl =
  //     "https://firebasestorage.googleapis.com/v0/b/travel-app-9dc09.appspot.com/o/pdf%2F1.pdf?alt=media&token=ff5ffc10-485e-40a7-988d-a6540db412e9";

  // Future downloadfilepdf() async {
  //   Map<Permission, PermissionStatus> statuses = await [
  //     Permission.storage,
  //     //add more permission to request here.
  //   ].request();
  //
  //   if (statuses[Permission.storage]!.isGranted) {
  //     // String documentsPath = '/storage/emulated/0/Download/';
  //     if (Platform.isIOS) {
  //       Directory path = await getApplicationDocumentsDirectory();
  //       // documentsPath = path.path;
  //     }
  //     var dir = await getExternalStorageDirectory();
  //     if (dir != null) {
  //       String documentsPath = '/storage/emulated/0/Download/';
  //       String savename = "dastan.pdf";
  //       documentsPath = dir.path + "/$savename";
  //       print(documentsPath);
  //       //output:  /storage/emulated/0/Download/banner.png
  //       try {
  //         await Dio().download(fileurl, documentsPath,
  //             onReceiveProgress: (received, total) {
  //           if (total != -1) {
  //             print((received / total * 100).toStringAsFixed(0) + "%");
  //             //you can build progressbar feature too
  //           }
  //         });
  //         print("File is saved to download folder.");
  //       } on DioError catch (e) {
  //         print(e.message);
  //       }
  //     }
  //   } else {
  //     print("No permission to read and write.");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SingleChildScrollView(
        child: Column(children: [
          AppBarAllWithoutHomePage(
            textapp: 'Trip Info',
          ),
          FutureBuilder<List<FirebaseFile>>(
              future: futureFiles,
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
                      return CarouselSlider(
                        options: CarouselOptions(
                          enableInfiniteScroll: false,
                          height: 300,
                          enlargeCenterPage: true,
                          disableCenter: true,
                          viewportFraction: .75,
                        ),
                        items: List.generate(
                          files.length,
                          (index) {
                            final file = files[index];
                            return Container(
                              width: 200,
                              height: 300,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.network(
                                  file.url,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }
                }
              }),
          SizedBox(
            height: 15,
          ),
          Column(
            children: [
              Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(5)),
                  height: 50,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Center(
                      child: Text(
                    'Details of Trip',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ))),
              Container(
                height: MediaQuery.of(context).size.height / 1.1,
                child: ListView.builder(
                    padding: EdgeInsets.only(top: 10),
                    itemCount: listdoc.length,
                    itemBuilder: (BuildContext context, int index) {
                      return listdoc.isEmpty
                          ? Container(
                              height: 300,
                              width: 300,
                              child: Center(child: CircularProgressIndicator()),
                            )
                          : Container(
                              height: MediaQuery.of(context).size.height / 2,
                              child: SingleChildScrollView(
                                child: Column(children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 30, top: 10),
                                    height: 350,
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Column(children: [
                                      Text_Icon_Trip(
                                        Icon(Icons.access_time_filled),
                                        listdoc[index]['Time'],
                                        TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 19,
                                      ),
                                      Text_Icon_Trip(
                                        Icon(Icons.airplane_ticket),
                                        listdoc[index]['Ticket'],
                                        TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 19,
                                      ),
                                      Text_Icon_Trip(
                                        Icon(Icons.hotel),
                                        listdoc[index]['Hotel'],
                                        TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 19,
                                      ),
                                      Text_Icon_Trip(
                                        Icon(Icons.co_present_sharp),
                                        listdoc[index]['Visa'],
                                        TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 19,
                                      ),
                                      Text_Icon_Trip(
                                        Icon(Icons.car_crash_rounded),
                                        listdoc[index]['Transport'],
                                        TextStyle(fontSize: 14),
                                      ),
                                      SizedBox(
                                        height: 19,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text_Icon_Trip(
                                            Icon(Icons.airport_shuttle_rounded),
                                            listdoc[index]['Tour'],
                                            TextStyle(fontSize: 14),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Tour_Ui()),
                                                  );
                                                },
                                                child: Text('Tour List')),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 20),
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text_Icon_Trip(
                                              Icon(
                                                Icons.monetization_on,
                                              ),
                                              listdoc[index]['Cost'],
                                              TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 10),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  downloadPDF();
                                                  // showtoast('File Downloaded ???');
                                                },
                                                child: Row(
                                                  children: [
                                                    Text('PDF  '),
                                                    Icon(
                                                      Icons.download,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ]),
                                    ]),
                                  ),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 20, top: 20, bottom: 10),
                                    height: MediaQuery.of(context).size.width,
                                    width:
                                        MediaQuery.of(context).size.width / 1.1,
                                    decoration: BoxDecoration(
                                        color: Colors.black12,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            ' ????  Notes:',
                                            style: TextStyle(
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 15,
                                          ),
                                          Text(
                                            listdoc[index]['Notes'],
                                            style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            );
                    }),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
