import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailPlace extends StatelessWidget {
  const DetailPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screen = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {},
            icon: CircleAvatar(
              backgroundColor: Colors.black38,
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            CircleAvatar(
              backgroundColor: Colors.black38,
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: Colors.white),
              ),
            ),
          ],
        ),
        body: Container(
          width: screen.width,
          height: screen.height,
          child: Stack(
            children: [
              SizedBox(
                width: screen.width,
                height: screen.height * 0.55,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/736x/16/07/8d/16078d3aabc508ee84bf147d16e4d8a6.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              // DraggableScrollableSheet(
              //     initialChildSize: 0.56,
              //     minChildSize: 0.1,
              //     maxChildSize: 0.9,
              //     builder: (context, controller) {
              //       return Container(
              //         // margin: EdgeInsets.only(top: screen.height * 0.46),
              //         child: Column(
              //           children: [
              //             Expanded(
              //               child: Container(
              //                 alignment: Alignment.topCenter,
              //                 width: screen.width,
              //                 decoration: BoxDecoration(
              //                     borderRadius: BorderRadius.vertical(
              //                         top: Radius.circular(30)),
              //                     color: Colors.red[400]),
              //                 child: Column(
              //                   children: [
              //                     Padding(
              //                       padding: EdgeInsets.symmetric(
              //                           horizontal: 30, vertical: 20),
              //                       child: Row(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           Text('Nama kota'),
              //                           Text('Detail lokasi'),
              //                         ],
              //                       ),
              //                     ),
              //                     Expanded(
              //                       child: Container(
              //                         width: screen.width,
              //                         decoration: BoxDecoration(
              //                             borderRadius: BorderRadius.vertical(
              //                                 top: Radius.circular(30)),
              //                             color: Colors.white),
              //                         child: Column(
              //                           children: [
              //                             Container(
              //                               width: screen.width,
              //                               height: 30,
              //                               alignment: Alignment.center,
              //                               child: Container(
              //                                 width: 50,
              //                                 height: 5,
              //                                 decoration: BoxDecoration(
              //                                     borderRadius:
              //                                         BorderRadius.circular(
              //                                             100),
              //                                     color: Colors.grey[300]),
              //                               ),
              //                             ),
              //                             Expanded(
              //                               child: Container(
              //                                 padding: EdgeInsets.symmetric(
              //                                     horizontal: 30),
              //                                 width: screen.width,
              //                                 child: SingleChildScrollView(
              //                                   scrollDirection: Axis.vertical,
              //                                   child: Column(
              //                                     crossAxisAlignment:
              //                                         CrossAxisAlignment.start,
              //                                     children: [
              //                                       Text('Nama Tempat'),
              //                                       Row(
              //                                         mainAxisAlignment:
              //                                             MainAxisAlignment
              //                                                 .spaceBetween,
              //                                         children: [
              //                                           Row(
              //                                             children: [
              //                                               Icon(
              //                                                   Icons
              //                                                       .star_rounded,
              //                                                   color: Colors
              //                                                           .yellow[
              //                                                       800]),
              //                                               Icon(
              //                                                   Icons
              //                                                       .star_rounded,
              //                                                   color: Colors
              //                                                           .yellow[
              //                                                       800]),
              //                                               Icon(
              //                                                   Icons
              //                                                       .star_rounded,
              //                                                   color: Colors
              //                                                           .yellow[
              //                                                       800]),
              //                                               Icon(
              //                                                   Icons
              //                                                       .star_rounded,
              //                                                   color: Colors
              //                                                           .yellow[
              //                                                       800]),
              //                                               Icon(
              //                                                   Icons
              //                                                       .star_half_rounded,
              //                                                   color: Colors
              //                                                           .yellow[
              //                                                       800]),
              //                                               Text('(4.5)')
              //                                             ],
              //                                           ),
              //                                           TextButton(
              //                                             onPressed: () {},
              //                                             child: Text(
              //                                                 'See reviews'),
              //                                             style: ButtonStyle(
              //                                                 splashFactory:
              //                                                     NoSplash
              //                                                         .splashFactory),
              //                                           )
              //                                         ],
              //                                       ),
              //                                       Text('Deskripsi'),
              //                                       Text(
              //                                           'Ipsum reprehenderit fugiat eiusmod esse laborum. Sint elit aute esse sint. Dolor Lorem excepteur occaecat exercitation ex reprehenderit. Excepteur nulla eiusmod incididunt duis sit ipsum. Consequat occaecat proident magna tempor laboris ad elit pariatur nulla consectetur consectetur ea velit commodo. Voluptate cupidatat culpa laboris duis non. Magna dolore dolor ut veniam reprehenderit ex anim.'),
              //                                     ],
              //                                   ),
              //                                 ),
              //                               ),
              //                             ),
              //                           ],
              //                         ),
              //                       ),
              //                     ),
              //                     Container(
              //                       padding:
              //                           EdgeInsets.symmetric(horizontal: 30),
              //                       height: 80,
              //                       decoration: BoxDecoration(
              //                           color: Colors.white,
              //                           border: Border(
              //                               top: BorderSide(
              //                                   color: Colors.grey[200]!))),
              //                       child: Row(
              //                         mainAxisAlignment:
              //                             MainAxisAlignment.spaceBetween,
              //                         children: [
              //                           Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               mainAxisAlignment:
              //                                   MainAxisAlignment.center,
              //                               children: [
              //                                 Text('Harga masuk'),
              //                                 Text(
              //                                   'Rp. 0',
              //                                 )
              //                               ]),
              //                           TextButton(
              //                             onPressed: () {},
              //                             child: Row(
              //                               children: [
              //                                 Text('Add to plan'),
              //                                 SizedBox(
              //                                   width: 10,
              //                                 ),
              //                                 Icon(
              //                                   Icons.arrow_forward_ios,
              //                                   size: 15,
              //                                 )
              //                               ],
              //                             ),
              //                             style: ButtonStyle(
              //                                 padding:
              //                                     MaterialStateProperty.all(
              //                                         EdgeInsets.symmetric(
              //                                             horizontal: 20,
              //                                             vertical: 15)),
              //                                 shape: MaterialStateProperty.all(
              //                                     RoundedRectangleBorder(
              //                                         borderRadius:
              //                                             BorderRadius.circular(
              //                                                 10))),
              //                                 backgroundColor:
              //                                     MaterialStateProperty.all(
              //                                         Colors.red[400]),
              //                                 foregroundColor:
              //                                     MaterialStateProperty.all(
              //                                         Colors.white)),
              //                           )
              //                         ],
              //                       ),
              //                     )
              //                   ],
              //                 ),
              //               ),
              //             ),
              //           ],
              //         ),
              //       );
              //     }),
              DraggableScrollableSheet(
                  initialChildSize: 0.56,
                  minChildSize: 0.56,
                  maxChildSize: 0.9,
                  builder: (context, scrollController) {
                    return Container(
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(30)),
                        color: Colors.red[400],
                      ),
                      child: ListView(
                          padding: EdgeInsets.zero,
                          controller: scrollController,
                          children: [LocationBar(), DetailLocation()]),
                    );
                  }),
              Positioned(bottom: 0, child: BottomBar())
            ],
          ),
        ),
      ),
    );
  }
}

class LocationBar extends StatelessWidget {
  const LocationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Nama kota',
            style: GoogleFonts.rubik(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.white)),
          ),
          Text(
            'Detail lokasi',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class DetailLocation extends StatelessWidget {
  const DetailLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.7,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
          color: Colors.white),
      child: Column(
        children: [
          Container(
            height: 30,
            alignment: Alignment.center,
            child: Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.grey[300]),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Nama Tempat',
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 22)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.star_rounded, color: Colors.yellow[800]),
                        Icon(Icons.star_rounded, color: Colors.yellow[800]),
                        Icon(Icons.star_rounded, color: Colors.yellow[800]),
                        Icon(Icons.star_rounded, color: Colors.yellow[800]),
                        Icon(Icons.star_half_rounded,
                            color: Colors.yellow[800]),
                        SizedBox(
                          width: 10,
                        ),
                        Text('(4.5)')
                      ],
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('See reviews'),
                      style: ButtonStyle(splashFactory: NoSplash.splashFactory),
                    )
                  ],
                ),
                Text(
                  'Deskripsi',
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 18)),
                ),
                Container(
                  height: 300,
                  padding: EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Text(
                        'Ipsum reprehenderit fugiat eiusmod esse laborum. Sint elit aute esse sint. Dolor Lorem excepteur occaecat exercitation ex reprehenderit. Excepteur nulla eiusmod incididunt duis sit ipsum. Consequat occaecat proident magna tempor laboris ad elit pariatur nulla consectetur consectetur ea velit commodo. Voluptate cupidatat culpa laboris duis non. Magna dolore dolor ut veniam reprehenderit ex anim. Ipsum reprehenderit fugiat eiusmod esse laborum. Sint elit aute esse sint. Dolor Lorem excepteur occaecat exercitation ex reprehenderit. Excepteur nulla eiusmod incididunt duis sit ipsum. Consequat occaecat proident magna tempor laboris ad elit pariatur nulla consectetur consectetur ea velit commodo. Voluptate cupidatat culpa laboris duis non. Ipsum reprehenderit fugiat eiusmod esse laborum. Sint elit aute esse sint. Dolor Lorem excepteur occaecat exercitation ex reprehenderit. Excepteur nulla eiusmod incididunt duis sit ipsum. Consequat occaecat proident magna tempor laboris ad elit pariatur nulla consectetur consectetur ea velit commodo. Voluptate cupidatat culpa laboris duis non. Magna dolore dolor ut veniam reprehenderit ex anim. Ipsum reprehenderit fugiat eiusmod esse laborum. Sint elit aute esse sint. Dolor Lorem excepteur occaecat exercitation ex reprehenderit. Excepteur nulla eiusmod incididunt duis sit ipsum. Consequat occaecat proident magna tempor laboris ad elit pariatur nulla consectetur consectetur ea velit commodo. Voluptate cupidatat culpa laboris duis non.'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      height: 80,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey[200]!))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Harga masuk'),
                Text(
                  'Rp. 0',
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 22)),
                ),
              ]),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Add to plan',
                  style: GoogleFonts.rubik(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                )
              ],
            ),
            style: ButtonStyle(
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor: MaterialStateProperty.all(Colors.red[400]),
                foregroundColor: MaterialStateProperty.all(Colors.white)),
          )
        ],
      ),
    );
  }
}
