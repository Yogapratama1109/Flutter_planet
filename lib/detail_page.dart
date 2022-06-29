import 'package:flutter/material.dart';
import 'package:flutter_planet/constants.dart';
import 'package:flutter_planet/data.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                      SizedBox(height: 270),
                      Text(
                        planetInfo.name,
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 56,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                      ),
                      Text(
                        'Solar System',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 30,
                          color: primaryTextColor,
                          fontWeight: FontWeight.w300,
                          ),
                          textAlign: TextAlign.left,
                      ),
                      Divider(color: Colors.black38),
                      SizedBox(height: 32,),
                          Text(
                            planetInfo.description ?? '',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                            ),
                        ),
                      SizedBox(height: 32,),
                      Divider(color: Colors.black38),
                    ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.left,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0, right: 32.0),
                    child: Container(
                      height: 250,
                      child: ListView.builder(
                        itemCount: planetInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                        return Card(
                          clipBehavior: Clip.antiAlias,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.network(
                              planetInfo.images[index],
                              fit: BoxFit.cover,
                            )),
                        );
                      }),
                    ),
                  ),
                  SizedBox(height: 20,),
                ],
              ),
            ),
            Positioned(
              right: -75,
              child: Hero(
                tag: planetInfo.position,
                child: Image.asset(planetInfo.iconImage),
                ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios), 
                onPressed: () {
                  Navigator.pop(context);
                },
                ),
            ),
          ],
        ),
      ),
    );
  }
}