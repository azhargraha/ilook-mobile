import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:ilook/models/Rating.dart';
import 'package:ilook/services/ratingService.dart';

class RatingPopUp extends StatefulWidget {
  final int wisataId;
  final Future<Rating> rating;
  const RatingPopUp({Key? key, required this.rating, required this.wisataId})
      : super(key: key);

  @override
  State<RatingPopUp> createState() => _RatingPopUpState();
}

class _RatingPopUpState extends State<RatingPopUp> {
  int newRating = 0;

  void setNewRatingTo(int value) {
    setState(() {
      newRating = value;
    });
  }

  Future<void> giveRating(context) async {
    http.Response response =
        await RatingService.postRating(newRating, widget.wisataId);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.63,
        padding: EdgeInsets.all(20),
        child: Column(children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.all(0),
              height: 30,
              child: IconButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onPressed: () => {Navigator.of(context).pop()},
                icon: Icon(
                  Icons.close_rounded,
                  color: Colors.grey[500],
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: Text(
              'Overall rating',
              style: GoogleFonts.rubik(
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w800, fontSize: 22)),
            ),
          ),
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(1000),
                    color: Colors.grey[100]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FutureBuilder<Rating>(
                        future: widget.rating,
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
                      future: widget.rating,
                      builder: (context, snapshot) {
                        return Text(
                          '${snapshot.data?.showRating()} out of 5',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        );
                      },
                    )
                  ],
                ),
              ),
              FutureBuilder<Rating>(
                future: widget.rating,
                builder: (context, snapshot) {
                  return Text(
                    '${snapshot.data?.totalRatingCount} ratings',
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        height: 2),
                  );
                },
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            height: 110,
            child: FutureBuilder<Rating>(
              future: widget.rating,
              builder: (context, snapshot) {
                Rating? data = snapshot.data;
                int totalRatingCount = data?.totalRatingCount ?? 0;
                Map ratingDetails = {
                  '5.0': data?.ratingDetails['5.0'] ?? 0,
                  '4.0': data?.ratingDetails['4.0'] ?? 0,
                  '3.0': data?.ratingDetails['3.0'] ?? 0,
                  '2.0': data?.ratingDetails['2.0'] ?? 0,
                  '1.0': data?.ratingDetails['1.0'] ?? 0,
                };
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RatingBar(
                      starNumber: 5,
                      value: totalRatingCount == 0
                          ? 0.0
                          : ratingDetails['5.0'] / totalRatingCount,
                    ),
                    RatingBar(
                      starNumber: 4,
                      value: totalRatingCount == 0
                          ? 0.0
                          : ratingDetails['4.0'] / totalRatingCount,
                    ),
                    RatingBar(
                      starNumber: 3,
                      value: totalRatingCount == 0
                          ? 0.0
                          : ratingDetails['3.0'] / totalRatingCount,
                    ),
                    RatingBar(
                      starNumber: 2,
                      value: totalRatingCount == 0
                          ? 0.0
                          : ratingDetails['2.0'] / totalRatingCount,
                    ),
                    RatingBar(
                      starNumber: 1,
                      value: totalRatingCount == 0
                          ? 0.0
                          : ratingDetails['1.0'] / totalRatingCount,
                    ),
                  ],
                );
              },
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey[200]!))),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingButton(
                    tapEvent: () => setNewRatingTo(1),
                    active: newRating > 0,
                  ),
                  RatingButton(
                    tapEvent: () => setNewRatingTo(2),
                    active: newRating > 1,
                  ),
                  RatingButton(
                    tapEvent: () => setNewRatingTo(3),
                    active: newRating > 2,
                  ),
                  RatingButton(
                    tapEvent: () => setNewRatingTo(4),
                    active: newRating > 3,
                  ),
                  RatingButton(
                    tapEvent: () => setNewRatingTo(5),
                    active: newRating > 4,
                  ),
                ],
              ),
              TextButton(
                  style: ButtonStyle(
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: () => newRating == 0 ? null : giveRating(context),
                  child: Text('+ Add rating'))
            ],
          )
        ]),
      ),
    );
  }
}

class RatingBar extends StatelessWidget {
  final int starNumber;
  final double value;
  const RatingBar({Key? key, required this.starNumber, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int percentage = (value * 100).round();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            flex: 1,
            child: Text(
              '${starNumber} star',
              textAlign: TextAlign.right,
            )),
        Expanded(
          flex: 5,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: LinearProgressIndicator(
                minHeight: 8,
                value: value,
                valueColor: AlwaysStoppedAnimation(Colors.yellow[800]),
                backgroundColor: Colors.grey[100],
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Text(
              // '${(value * 100).round()}%',
              '${percentage}%',
              textAlign: TextAlign.left,
            ))
      ],
    );
  }
}

class RatingButton extends StatelessWidget {
  final bool active;
  final void Function() tapEvent;
  const RatingButton({Key? key, required this.tapEvent, required this.active})
      : super(key: key);

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
    return SizedBox(
      width: 40,
      height: 40,
      child: IconButton(
          padding: EdgeInsets.all(0),
          iconSize: 40,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: tapEvent,
          icon: getIcon()),
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
