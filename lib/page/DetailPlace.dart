import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilook/models/Rating.dart';
import 'package:ilook/page/Home.dart';
import 'package:ilook/page/PackagePage.dart';
import 'package:ilook/services/globals.dart';
import 'package:ilook/services/ratingService.dart';
import 'package:ilook/widget/RatingPopUp.dart';
import 'package:ilook/models/Pariwisata.dart';

class DetailPlace extends StatelessWidget {
  const DetailPlace({Key? key}) : super(key: key);

  double checkRating(dynamic value) {
    if (value.runtimeType == Null || value.runtimeType == null) return 0.0;
    if (value.runtimeType == int) return value.toDouble();

    return value;
  }

  @override
  Widget build(BuildContext context) {
    final place = ModalRoute.of(context)!.settings.arguments as Pariwisata;
    Size screen = MediaQuery.of(context).size;

    Future<Rating> fetchRating(http.Client client) async {
      final response = await client.get(
          Uri.parse('http://10.0.2.2:8000/api/pariwisata/${place.wisataID}'));
      double rating = checkRating(jsonDecode(response.body)['rating']);
      int totalRatingCount = jsonDecode(response.body)['totalRatingCount'];
      Map ratingDetails = jsonDecode(response.body)['ratingDetails'];
      Map ratingMap = {
        rating: rating,
        totalRatingCount: totalRatingCount,
        ratingDetails: ratingDetails
      };

      Rating ratingData = new Rating(
          rating: rating,
          totalRatingCount: totalRatingCount,
          ratingDetails: ratingDetails);

      return ratingData;
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
                          image: NetworkImage(
                              'https://blog.tubikstudio.com/wp-content/uploads/2021/06/european-places-nature-illustration-8.jpg'),
                          fit: BoxFit.cover)),
                  // error fetch dari localhost
                  // image: NetworkImage('http://10.0.2.2:8000/storage/' +
                  //     place.urlGambar),
                  // fit: BoxFit.cover)),
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
                            LocationBar(kota: place.lokasi),
                            DetailLocation(
                              id: place.wisataID,
                              name: place.nama,
                              details: place.deskripsi,
                              rating: fetchRating(http.Client()),
                            )
                          ]),
                    );
                  }),
              Positioned(
                  bottom: 0,
                  child: BottomBar(
                    price: place.harga,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class LocationBar extends StatelessWidget {
  final String kota;
  const LocationBar({Key? key, required this.kota}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            kota,
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white)),
          ),
        ],
      ),
    );
  }
}

class DetailLocation extends StatelessWidget {
  final Future<Rating> rating;
  final int id;
  final String name;
  final String details;
  const DetailLocation(
      {Key? key,
      required this.id,
      required this.name,
      required this.details,
      required this.rating})
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
                  name,
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
                          FutureBuilder<Rating>(
                              future: rating,
                              builder: (context, snapshot) {
                                Rating? data = snapshot.data;
                                int rating = data?.rating.round() ?? 0;

                                return Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    StarIcon(active: rating > 0),
                                    StarIcon(active: rating > 1),
                                    StarIcon(active: rating > 2),
                                    StarIcon(active: rating > 3),
                                    StarIcon(active: rating > 4),
                                  ],
                                );
                              }),
                          SizedBox(
                            width: 10,
                          ),
                          FutureBuilder<Rating>(
                            future: rating,
                            builder: (context, snapshot) {
                              return Text('(${snapshot.data?.showRating()})');
                            },
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () => showDialog(
                            context: context,
                            builder: (builder) => RatingPopUp(
                                  wisataId: id,
                                  rating: rating,
                                )),
                        child: Text('See ratings'),
                        style:
                            ButtonStyle(splashFactory: NoSplash.splashFactory),
                      )
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
                    child: Text(details),
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
  final int price;
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
                Text('Entrance fee'),
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
                  'Add to plan',
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

class StarIcon extends StatelessWidget {
  final bool active;
  const StarIcon({Key? key, required this.active}) : super(key: key);

  Icon getIcon() {
    if (active) {
      return Icon(
        Icons.star_rounded,
        color: Colors.yellow[800],
      );
    } else {
      return Icon(
        Icons.star_outline_rounded,
        color: Colors.grey[500],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return getIcon();
  }
}
