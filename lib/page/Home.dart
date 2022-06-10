import 'package:flutter/material.dart';
// import 'package:ilook/util/places.dart';
//import 'package:icon_badge/icon_badge.dart';

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
        title: Image.asset('assets/images/logo.png'),
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
                height: 100.0,
                child: ListView.builder(
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) => Card(
                    child: Center(
                        child: Image.network(
                            'https://pbs.twimg.com/profile_images/1262792807137153024/WKcQEgIZ_400x400.jpg')),
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

// class CircleImages extends StatefulWidget{
//   @override
//   State<StatefulWidget> createState() {
//     return CircleWidgets();
//   }
// }

// class CircleWidgets extends State<CircleImages>{
//   @override
//     Widget build(BuildContext context) {
//       List<Widget> widgets = [];
//       for(var x = 0 ; x < 10 ; x++){
//         widgets.add(Container(
//                   height: 60.0,
//                   width: 60.0,
//                   margin: EdgeInsets.all(
//                     6.0
//                   ),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100.0),
//                     boxShadow:[
//                       new BoxShadow(
//                         color: Color.fromARGB(100, 0, 0, 0),
//                         blurRadius: 5.0,
//                         offset: Offset(5.0, 5.0)
//                       )
//                     ],
//                     border: Border.all(
//                       width: 2.0,
//                       style:BorderStyle.solid ,
//                       color: Color.fromARGB(255, 0 , 0, 0)
//                     ),
//                     image: DecorationImage(
//                       fit: BoxFit.cover,
//                       image: NetworkImage('https://pbs.twimg.com/profile_images/1262792807137153024/WKcQEgIZ_400x400.jpg')
//                     )
//                   )
//                 )
//             );
//       }
//       return Container(
//         height: 80.0,

//         child: ListView(
//           scrollDirection: Axis.horizontal,
//           padding: EdgeInsets.all(5.0),
//           children: widgets
//         )
//       );

//     }
// }

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
