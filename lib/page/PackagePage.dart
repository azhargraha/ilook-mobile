import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilook/widget/packageCard.dart';


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
        ),
        body: PackageList(),
      ),
    );
  }
}




class PackageList extends StatelessWidget {
  const PackageList({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final List<Map> myProducts =
      List.generate(100000, (index) => {"id": index, "name": "Product $index"})
          .toList();
    return ListView.builder(
      itemCount: myProducts.length,
      itemBuilder: (context, index) {
        return PackageCard(title: 'Judul $index', description: 'Ini deskripsi yang panjang buat $index', thumbnailUrl: 'https://www.planetware.com/photos-large/INA/indonesia-beaches-of-bali.jpg');
      });
  }
}