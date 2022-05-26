import 'package:flutter/material.dart';

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
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz, color: Colors.white),
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
                height: screen.height * 0.5,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      image: DecorationImage(
                          image: NetworkImage(
                              'https://i.pinimg.com/736x/16/07/8d/16078d3aabc508ee84bf147d16e4d8a6.jpg'),
                          fit: BoxFit.cover)),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: screen.height * 0.46),
                child: Column(
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.topCenter,
                        width: screen.width,
                        decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(30)),
                            color: Colors.greenAccent[400]),
                        child: Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Nama kota'),
                                  Text('Detail lokasi'),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Container(
                                width: screen.width,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(30)),
                                    color: Colors.white),
                                child: Column(
                                  children: [
                                    Container(
                                      width: screen.width,
                                      height: 30,
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 50,
                                        height: 5,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            color: Colors.grey[300]),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30),
                                        width: screen.width,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Nama Tempat'),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(Icons.star_rounded,
                                                        color:
                                                            Colors.yellow[800]),
                                                    Icon(Icons.star_rounded,
                                                        color:
                                                            Colors.yellow[800]),
                                                    Icon(Icons.star_rounded,
                                                        color:
                                                            Colors.yellow[800]),
                                                    Icon(Icons.star_rounded,
                                                        color:
                                                            Colors.yellow[800]),
                                                    Icon(
                                                        Icons.star_half_rounded,
                                                        color:
                                                            Colors.yellow[800]),
                                                    Text('(4.5)')
                                                  ],
                                                ),
                                                TextButton(
                                                  onPressed: () {},
                                                  child: Text('See reviews'),
                                                  style: ButtonStyle(
                                                      splashFactory: NoSplash
                                                          .splashFactory),
                                                )
                                              ],
                                            ),
                                            Text('Deskripsi'),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      top: BorderSide(
                                          color: Colors.grey[200]!))),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text('Harga masuk'),
                                        Text(
                                          'Rp. 0',
                                        )
                                      ]),
                                  TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      children: [
                                        Text('Add to plan'),
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
                                            EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 15)),
                                        shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10))),
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Colors.greenAccent[400]),
                                        foregroundColor:
                                            MaterialStateProperty.all(
                                                Colors.white)),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
