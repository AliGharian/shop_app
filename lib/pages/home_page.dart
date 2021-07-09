import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  var _carouselListItems = [
    {
      'url':
          'https://khooger.com/pub/media/Media/Home/Sliders/20210628_slider_khoshkhab_mobile.png',
    },
    {
      'url':
          'https://khooger.com/pub/media/Media/Home/Sliders/20210628_slider_ashpaz_mobile.png',
    },
    {
      'url':
          'https://khooger.com/pub/media/Media/Home/Sliders/20210706_slider_ayeneh_mobile.png',
    },
    {
      'url':
          'https://khooger.com/pub/media/Media/Home/Sliders/20210628_slider_gaming_mobile.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CarouselSlider(
                  items: _carouselListItems
                      .map((e) => Container(
                            margin: EdgeInsets.all(4.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.0),
                              ),
                              child: CachedNetworkImage(
                                imageUrl: e['url'].toString(),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                progressIndicatorBuilder:
                                    (context, url, downloadProgress) => Center(
                                  child: CircularProgressIndicator(
                                    value: downloadProgress.progress,
                                  ),
                                ),
                                fit: BoxFit.cover,
                                width: 1000,
                              ),
                            ),
                          ))
                      .toList(),
                  options: CarouselOptions(
                    aspectRatio: 16 / 9,
                    viewportFraction: 1,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _current = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _carouselListItems.map((e) {
                    int index = _carouselListItems.indexOf(e);
                    return Container(
                      margin: EdgeInsets.all(2.0),
                      height: 6.0,
                      width: 6.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _current == index ? Colors.deepOrange : Colors.grey,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
