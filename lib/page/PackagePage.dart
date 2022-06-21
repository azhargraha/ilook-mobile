import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilook/widget/packageCard.dart';
import 'package:ilook/models/Package.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;


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
          title: SvgPicture.asset('assets/logo.svg',
          height: AppBar().preferredSize.height * 0.7),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          automaticallyImplyLeading: false,
        ),
        body: 
        FutureBuilder<List<Package>>(
          future: fetchPackage(http.Client()),
          builder: (context, snapshot) {
            if (snapshot.hasData){
              return PackageList(packages: snapshot.data!);
            }else {
              return Center(child: CircularProgressIndicator());
            }
          })
        // PackageList(),
      ),
    );
  }
}

Future<List<Package>> fetchPackage(http.Client client) async {
  final response = await client.get(Uri.parse('http://10.0.2.2:8000/api/paket'));
  return compute(parsePackage, response.body);
}

List<Package> parsePackage(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Package>((json)=> Package.fromJson(json)).toList();
}


class PackageList extends StatelessWidget {
  final List<Package> packages;
  const PackageList({ Key? key, required this.packages}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: packages.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, '/detail-package',
            arguments: Package(
                title: packages[index].title,
                description: packages[index].description,
                thumbnailUrl: packages[index].thumbnailUrl)),
          child: PackageCard(paket: packages[index]),
        );
      });
  }
}