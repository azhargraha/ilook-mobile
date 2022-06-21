import 'package:flutter/material.dart';
import 'package:ilook/models/Pariwisata.dart';

class PariwisataCard extends StatelessWidget {
  final Pariwisata pariwisata;
  const PariwisataCard({
    required this.pariwisata
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
          image: NetworkImage('http://10.0.2.2:8000/storage/'+ pariwisata.urlGambar),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Align(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 25),
              child: Text(
                pariwisata.nama,
                style: TextStyle(
                  fontSize: 19,
                  color: Colors.white
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
            alignment: Alignment.topCenter,
          ),
          // Align(
          //   child: Container(
          //         padding: EdgeInsets.all(5),
          //         margin: EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //           color: Colors.black.withOpacity(0.4),
          //           borderRadius: BorderRadius.circular(15),
          //         ),
          //         child: Row(
          //           children: [
          //             Icon(
          //               Icons.star,
          //               color: Colors.yellow,
          //               size: 18,
          //             ),
          //             SizedBox(width: 7),
          //             Text('$pariwisata.rating'),
          //           ],
          //         ),
          //       ),
          // ),
        ],
      ),
    );
  }
}


