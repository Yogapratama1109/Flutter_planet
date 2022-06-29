import 'package:flutter/material.dart';
import 'package:flutter_planet/constants.dart';
import 'package:flutter_planet/detail_page.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_planet/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: gradientEndColor,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradientStartColor, gradientEndColor],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.3, 0.7],
            ),
          ),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 32, right: 32),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Explore',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 44,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                    ),
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    height: 450,
                    child: Swiper(
                      itemCount: planets.length,
                      itemWidth: 275.0,
                      layout: SwiperLayout.STACK,
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          activeSize: 15,
                          space: 8,
                        ),
                        ),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context, PageRouteBuilder(pageBuilder: (context,a,b)=>DetailPage(
                              planetInfo: planets[index],
                              ),
                              ),
                            );
                          },
                          child: Stack(
                            children: <Widget>[
                              Column(
                                children: <Widget>[
                                  SizedBox(height: 100),
                                  Card(
                                    elevation: 8,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(32),
                                    ),
                                    color: Colors.white,
                                    child: Padding(
                                      padding: const EdgeInsets.all(32.0),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          SizedBox(height: 100),
                                          Text(
                                            planets[index].name,
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 44,
                                              color: const Color(0xff47455f),
                                              fontWeight: FontWeight.w900,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Text(
                                            'Solar System',
                                            style: TextStyle(
                                              fontFamily: 'Avenir',
                                              fontSize: 20,
                                              color: primaryTextColor,
                                              fontWeight: FontWeight.w500,
                                              ),
                                              textAlign: TextAlign.left,
                                          ),
                                          SizedBox(height: 32),
                                          Row(
                                            children: <Widget>[
                                              Text(
                                                'Know more',
                                                style:  TextStyle(
                                                  fontFamily: 'Avenir',
                                                  fontSize: 18,
                                                  color: secondaryTextColor,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              Icon(Icons.arrow_forward, color: secondaryTextColor,),
                                            ],
                                          )
                                      ],),
                                    ),
                                  )
                                ],
                              ),
                              Hero(
                                tag: planets[index].position,
                                child: Image.asset(planets[index].iconImage),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
            ),
        ),
        // bottomNavigationBar: Container(
        //   decoration: BoxDecoration(
        //     borderRadius:BorderRadius.vertical(
        //       top: Radius.circular(32.0)
        //     ),
        //     color: navigationColor, 
        //   ),
        //   padding: const EdgeInsets.all(15),
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     children: <Widget>[
        //       IconButton(
        //         icon: Image.asset('assets/menu_icon.png'),
        //         onPressed: () {},
        //       ),
        //       IconButton(
        //         icon: Image.asset('assets/search_icon.png'),
        //         onPressed: () {},
        //       ),
        //       IconButton(
        //         icon: Image.asset('assets/profile_icon.png'),
        //         onPressed: () {},
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

