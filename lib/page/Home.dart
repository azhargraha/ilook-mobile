import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
//import 'package:ilook/util/places.dart';

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

List<String> city = [
  'Jakarta',
  'Bandung',
  'Surabaya',
  'Solo',
  'Yogyakarta',
  'Bali'
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
    'imgUrl':'https://pbs.twimg.com/profile_images/1262792807137153024/WKcQEgIZ_400x400.jpg'
  },
  {
    'nama':'Yogyakarta',
    'imgUrl':'https://pbs.twimg.com/profile_images/1262792807137153024/WKcQEgIZ_400x400.jpg'
  },
  {
    'nama':'Bali',
    'imgUrl':'https://pbs.twimg.com/profile_images/1262792807137153024/WKcQEgIZ_400x400.jpg'
  },
  
];

class Pariwisata {
  final String name;
  final String img;
  final String price;
  final String location;
  final String details;

  const Pariwisata(
      {required this.name,
      required this.img,
      required this.price,
      required this.location,
      required this.details});
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: SvgPicture. asset('assets/logo.svg',
          height: AppBar().preferredSize.height * 0.7),
        leading: InkWell(
          onTap: () {},
          child: Icon(
            Icons.subject,
            color: Colors.black,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                size: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
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
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Popular places",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          buildHorizontalList(context),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              "Explore City",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 30.0,
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
                        Container(
                          
                          height: 130,
                          child: Image.network(
                              cities[index]['imgUrl']!,fit: BoxFit.cover,),
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

  buildHorizontalList(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10.0, left: 20.0),
      height: 250.0,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        primary: false,
        itemCount: places == null ? 0 : places.length,
        itemBuilder: (BuildContext context, int index) {
          Map place = places.reversed.toList()[index];
          return HorizontalPlaceItem(place: place);
        },
      ),
    );
  }
}

class HorizontalPlaceItem extends StatelessWidget {
  final Map place;

  HorizontalPlaceItem({required this.place});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/detail-place',
            arguments: Pariwisata(
                name: place['name'],
                img: place['img'],
                price: place['price'],
                location: place['location'],
                details: place['details'])),
        child: Container(
          height: 250.0,
          width: 140.0,
          child: Column(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "${place["img"]}",
                  height: 178.0,
                  width: 140.0,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 7.0),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "${place["name"]}",
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
                  "${place["location"]}",
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



class SearchBar extends StatelessWidget {
  final TextEditingController _searchControl = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey[50],
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
      ),
      child: TextField(
        style: TextStyle(
          fontSize: 15.0,
          color: Colors.blueGrey[300],
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(10.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
          hintText: "Contoh : Bandung, Indonesia",
          prefixIcon: Icon(
            Icons.location_on,
            color: Colors.blueGrey[300],
          ),
          hintStyle: TextStyle(
            fontSize: 15.0,
            color: Colors.blueGrey[300],
          ),
        ),
        maxLines: 1,
        controller: _searchControl,
      ),
    );
  }
}
