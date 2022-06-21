import 'package:flutter/material.dart';
import 'package:ilook/models/Planner.dart';

class PlannerCard extends StatelessWidget {
  final Planner planner;
  const PlannerCard({
    required this.planner
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.multiply,
          ),
          image: NetworkImage('https://img.freepik.com/free-photo/flat-lay-travel-planning-with-blank-space-travel-itinerary-planner-white-background_41775-496.jpg?w=2000'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 25),
              child: Text(
                planner.nama,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.center,
          ),
          Align(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(planner.start_at, style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.date_range,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 7),
                      Text(planner.end_at, style: TextStyle(color: Colors.white),),
                    ],
                  ),
                )
              ],
            ),
            alignment: Alignment.bottomLeft,
          ),
        ],
      ),
    );
  }
}