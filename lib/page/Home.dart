import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilook/widget/searchBar.dart';
import 'package:ilook/models/Pariwisata.dart';
import 'package:http/http.dart' as http;

List places = [
  {
    "name": "Hotel Dolah Amet & Suites",
    "img": "assets/1.jpeg",
    "price": "100/night",
    "location": "London, England",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "Beach Mauris Blandit",
    "img": "assets/2.jpeg",
    "price": "100/night",
    "location": "Lisbon, Portugal",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "Ipsum Restaurant",
    "img": "assets/3.jpeg",
    "price": "100/night",
    "location": "Paris, France",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\n\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "Curabitur Beach",
    "img": "assets/4.jpeg",
    "price": "100/night",
    "location": "Rome, Italy",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
  {
    "name": "Tincidunt Pool",
    "img": "assets/5.jpeg",
    "price": "100/night",
    "location": "Madrid, Spain",
    "details": "Pellentesque in ipsum id orci porta dapibus. "
        "Nulla porttitor accumsan tincidunt. Donec rutrum "
        "congue leo eget malesuada. "
        "\nPraesent sapien massa, convallis a pellentesque "
        "nec, egestas non nisi. Donec rutrum congue leo eget malesuada. "
        "Mauris blandit aliquet elit, eget tincidunt nibh pulvinar a. "
        "Sed porttitor lectus nibh. Donec sollicitudin molestie malesuada. "
        "\nCurabitur arcu erat, accumsan id imperdiet et, porttitor at sem. "
        "Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.",
  },
];


List<Map<String, String>> cities = [
  {
    'nama':'Jakarta',
    'imgUrl':'https://www.indonesia.travel/content/dam/indtravelrevamp/en/destinations/revisi-2020/destinations-thumbnail/Jakarta_thumbnail.jpg'
  },
  {
    'nama':'Bandung',
    'imgUrl':'https://cdn-2.tstatic.net/tribunnews/foto/bank/images/indonesiatravel-gedung-sate-salah-satu-ikon-kota-bandung.jpg'
  },
  {
    'nama':'Surabaya',
    'imgUrl':'https://www.researchgate.net/publication/336314939/figure/fig3/AS:811418450399261@1570468642516/Sura-shark-and-baya-crocodile-as-the-icon-of-Surabaya-Source-allindonesiantourismcom_Q640.jpg'
  },
  {
    'nama':'Solo',
    'imgUrl':'https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Keraton_Surakarta.jpg/250px-Keraton_Surakarta.jpg'
  },
  {
    'nama':'Yogyakarta',
    'imgUrl':'https://media-cdn.tripadvisor.com/media/photo-s/0d/4c/5e/fa/photo0jpg.jpg'
  },
  {
    'nama':'Bali',
    'imgUrl':'https://i.insider.com/6172f7164f281c001296a571?width=1136&format=jpeg'
  },
  
];



class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);
  Future<List<Pariwisata>> fetchPariwisata(http.Client client) async {
    final response = await client.get(Uri.parse('http://10.0.2.2:8000/api/pariwisata'));
    List<dynamic> data = jsonDecode(response.body)['pariwisata'];
    List<Pariwisata> list = [];
    if (response.body != null) {
      list = data.map((item) => Pariwisata.fromJson(item)).toList();
    }
    return list;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Text(
              "Popular places",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          FutureBuilder<List<Pariwisata>>(
              future: fetchPariwisata(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  return buildHorizontalList(context, snapshot.data!);
                }else if (snapshot.hasError){
                  return Text('$snapshot.error');
                }else {
                  return Center(child: CircularProgressIndicator());
                }
              }
            ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Explore City",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                height: 150,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: cities.length,
                  itemBuilder: (BuildContext context, int index) => Container(
                    margin: EdgeInsets.only(left: 20),
                    width: 120,
                    height: 200,
                    // color: Colors.amber,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                          
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                              cities[index]['imgUrl']!,
                              height: 130.0,
                              width: 130.0,
                              fit: BoxFit.cover,),
                        ),
                        Text(cities[index]['nama']!),
                      ],
                    ),
                  ),
                ),
              ),
              // Container(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     '$city',
              //     style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       fontSize: 15.0,
              //     ),
              //     maxLines: 1,
              //     textAlign: TextAlign.left,

              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }

  buildHorizontalList(BuildContext context, List<Pariwisata> pariwisata) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: pariwisata.length,
        itemBuilder: (BuildContext context, int index) {
          return HorizontalPlaceItem(pariwisata: pariwisata[index]);
        },
      ),
    );
  }
}

class HorizontalPlaceItem extends StatelessWidget {
  final Pariwisata pariwisata;

  HorizontalPlaceItem({required this.pariwisata});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/detail-place',
            arguments: Pariwisata(
                wisataID: pariwisata.wisataID,
                nama: pariwisata.nama,
                deskripsi: pariwisata.deskripsi,
                lokasi: pariwisata.lokasi,
                harga: pariwisata.harga,
                // rating: pariwisata[index].rating,
                kategoriID: pariwisata.kategoriID,
                urlGambar: pariwisata.urlGambar)),
        child: Container(
          height: 250.0,
          width: 140.0,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'http://10.0.2.2:8000/storage/'+ pariwisata.urlGambar,
                  height: 178.0,
                  width: 140.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 7.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  pariwisata.nama,
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
                alignment: Alignment.centerLeft,
                child: Text(
                  pariwisata.lokasi,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13.0,
                    color: Colors.blueGrey[300],
                  ),
                  maxLines: 1,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
