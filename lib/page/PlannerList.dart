import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilook/widget/packageCard.dart';
import 'package:ilook/models/Planner.dart';
import 'package:ilook/models/Package.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:ilook/widget/plannerCard.dart';

class PlannerPage extends StatefulWidget {
  const PlannerPage({Key? key}) : super(key: key);

  @override
  State<PlannerPage> createState() => _PlannerPageState();
}

class _PlannerPageState extends State<PlannerPage> {
  Future<List<Planner>> fetchPlanner(http.Client client) async {
    final response = await client.get(Uri.parse('http://10.0.2.2:8000/api/planner'));
    List<dynamic> data = jsonDecode(response.body)['planner'];
    List<Planner> list = [];
    if (response.body != null) {
      list = data.map((item) => Planner.fromJson(item)).toList();
    }
    print(list);
    return list;
  }
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
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/form-planner'),
                child: Icon(
                  Icons.add,
                  size: 26
                ),
              ),
              )
          ],
        ),
        body:FutureBuilder<List<Planner>>(
              future: fetchPlanner(http.Client()),
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  return PlannerList(planners: snapshot.data!);
                }else if (snapshot.hasError){
                  return Text('$snapshot.error');
                }else {
                  return Center(child: CircularProgressIndicator());
                }
              }
            )
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

class PlannerList extends StatelessWidget {
  final List<Planner> planners;
  const PlannerList({Key? key, required this.planners}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: planners.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/detail-planner',
                arguments: Package(
                    paketID: 2,
                    title: 'Paket $index',
                    description: 'Deskripsi Paket $index',
                    thumbnailUrl:
                        'https://www.planetware.com/photos-large/INA/indonesia-beaches-of-bali.jpg')),
            child: PlannerCard(planner: planners[index]),
          );
        });
  }
}
