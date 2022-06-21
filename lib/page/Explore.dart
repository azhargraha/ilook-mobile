import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilook/widget/searchBar.dart';
import 'package:ilook/widget/pariwisataCard.dart';
import 'package:ilook/models/Pariwisata.dart';
import 'package:http/http.dart' as http;

class Explore extends StatefulWidget {
  const Explore({ Key? key }) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {
  Future<List<Pariwisata>> fetchPariwisata(http.Client client) async {
  final response = await client.get(Uri.parse('http://10.0.2.2:8000/api/pariwisata'));
  List<dynamic> data = jsonDecode(response.body)['pariwisata'];
  List<Pariwisata> list = [];
  if (response.body != null) {
    list = data.map((item) => Pariwisata.fromJson(item)).toList();
  }
  return list;
}
// List<Pariwisata> parsePariwisata(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Pariwisata>((json)=> Pariwisata.fromJson(json)).toList();
// }

  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset('assets/logo.svg',
          height: AppBar().preferredSize.height * 0.7),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "What are you looking up-to?",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: SearchBar(),
          ),
          FutureBuilder<List<Pariwisata>>(
              future: fetchPariwisata(http.Client()),
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
        ],
        ),
      ),
    );
  }
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
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/detail-place',
            arguments: Pariwisata(
                wisataID: pariwisata[index].wisataID,
                nama: pariwisata[index].nama,
                deskripsi: pariwisata[index].deskripsi,
                lokasi: pariwisata[index].lokasi,
                harga: pariwisata[index].harga,
                // rating: pariwisata[index].rating,
                kategoriID: pariwisata[index].kategoriID,
                urlGambar: pariwisata[index].urlGambar,

              )
          ),
          child: PariwisataCard(pariwisata: pariwisata[index]),
        );
      });
  }
}