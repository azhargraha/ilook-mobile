import 'package:flutter/material.dart';
import 'package:planner/widgets/packageCard.dart';
import 'package:planner/models/Package.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';


class PackagePage extends StatefulWidget {
  const PackagePage({ Key? key }) : super(key: key);

  @override
  State<PackagePage> createState() => _PackagePageState();
}

class _PackagePageState extends State<PackagePage> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('title'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: 
        // FutureBuilder<List<Package>>(
        //   future: fetchPackage(http.Client()),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData){
        //       return PackageList(packages: snapshot.data!);
        //     }else {
        //       return Center(child: CircularProgressIndicator());
        //     }
        //   })
        PackageList(),
      ),
    );
  }
}

// Future<List<Package>> fetchPackage(http.Client client) async {
//   final response = await client.get(Uri.parse('http://10.0.2.2:8000/api/package'));
//   return compute(parsePackage, response.body);
// }

// List<Package> parsePackage(String responseBody) {
//   final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Package>((json)=> Package.fromJson(json)).toList();
// }


class PackageList extends StatelessWidget {
  // final List<Package> packages;
  const PackageList({ Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();
    return ListView.builder(
      itemCount: myProducts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/PlacePlannerList',
            arguments: Package(
                title: 'Paket $index',
                description: 'Deskripsi Paket $index',
                thumbnailUrl: 'https://www.planetware.com/photos-large/INA/indonesia-beaches-of-bali.jpg')),
          child: PackageCard(title: 'Judul $index', description: 'Ini deskripsi yang panjang buat $index', thumbnailUrl: 'https://www.planetware.com/photos-large/INA/indonesia-beaches-of-bali.jpg'),
        );
      });
  }
}