import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilook/models/Package.dart';
import 'package:ilook/models/Pariwisata.dart';
import 'package:ilook/page/Home.dart';
import 'package:ilook/widget/RatingPopUp.dart';
import 'package:http/http.dart' as http;

class DetailPackage extends StatelessWidget {
  const DetailPackage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final place = ModalRoute.of(context)!.settings.arguments as Package;
    Size screen = MediaQuery.of(context).size;
    Future<List<Pariwisata>> fetchPariwisataList(http.Client client) async {
      final response = await client.get(Uri.parse('http://10.0.2.2:8000/api/paket/'+'${place.paketID}'));
      List<dynamic> data = jsonDecode(response.body)['pariwisataList'];
      print(data);
      List<Pariwisata> list = [];
      if (response.body != null) {
        list = data.map((item) => Pariwisata.fromJson(item)).toList();
      }
      print(list);
      return list;
  }

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () => Navigator.pop(context),
            icon: CircleAvatar(
              backgroundColor: Colors.black38,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.black38,
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.white),
              ),
            ),
          ],
        ),
        body: Container(
          width: screen.width,
          height: screen.height,
          child: Stack(
            children: [
              SizedBox(
                width: screen.width,
                height: screen.height * 0.55,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                          image: NetworkImage(place.thumbnailUrl), fit: BoxFit.cover)),
                ),
              ),
              DraggableScrollableSheet(
                  initialChildSize: 0.56,
                  minChildSize: 0.56,
                  maxChildSize: 0.9,
                  builder: (context, scrollController) {
                    return Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                        color: Colors.red[400],
                      ),
                      child: ListView(
                          padding: EdgeInsets.zero,
                          controller: scrollController,
                          children: [
                            LocationBar(pariwisataList: fetchPariwisataList(http.Client()),kota: 'Bandung'),
                            DetailLocation(
                              title: place.title,
                              description: place.description,
                              thumbnailUrl: place.thumbnailUrl,
                            ),
                          ]),
                    );
                  }),
              Positioned(
                  bottom: 0,
                  child: BottomBar(
                    price: '0',
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class LocationBar extends StatelessWidget {
  final Future<List<Pariwisata>> pariwisataList;
  final String kota;
  const LocationBar({Key? key, required this.pariwisataList,required this.kota}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            kota,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white)),
          ),
          GestureDetector(
            child: Text('List Pariwisata', style: TextStyle(color: Colors.white)),
            onTap: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text('Pariwisata List'),
                  content: setupAlertDialoadContainer(pariwisataList, context),
                );
              }),
          ),
        ],
      ),
    );
  }
}

class DetailLocation extends StatelessWidget {
  final String title;
  final String description;
  final String thumbnailUrl;
  const DetailLocation({Key? key, required this.title, required this.description, required this.thumbnailUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          color: Colors.white),
      child: Column(
        children: [
          Container(
            height: 30,
            alignment: Alignment.center,
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[300]),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 22)),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  'Description',
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                ),
                Container(
                  height: 300,
                  padding: EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(description),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final String price;
  const BottomBar({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey[200]!))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Estimated fee'),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Rp. ${price}',
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 22)),
                ),
              ]),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Book now',
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                )
              ],
            ),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(Colors.red[400]),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
          )
        ],
      ),
    );
  }
}


Widget setupAlertDialoadContainer(Future<List<Pariwisata>> pariwisataList, context) {

  return Container(
    height: 500.0, // Change as per your requirement
    width: 300.0, // Change as per your requirement
    child: FutureBuilder<List<Pariwisata>>(
      future: pariwisataList,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return PariwisataList(pariwisata: snapshot.data!);
        }else if (snapshot.hasError){
          return Text('$snapshot.error');
        }else {
          return Center(child: CircularProgressIndicator());
        }
      } 
    )
  );
}

class PariwisataList extends StatelessWidget {
  final List<Pariwisata> pariwisata;
  const PariwisataList({ Key? key, required this.pariwisata }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      itemCount: pariwisata.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(vertical: 25),
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'http://10.0.2.2:8000/storage/'+ pariwisata[index].urlGambar,
                  height: 178.0,
                  width: 140.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 7.0),
              Container(
                alignment: Alignment.center,
                child: Text(
                  pariwisata[index].nama,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
              SizedBox(height: 3.0),
              Container(
                alignment: Alignment.center,
                child: Text(
                  pariwisata[index].lokasi,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                    color: Colors.blueGrey[300],
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
            ]),
        );
      });
  }
}