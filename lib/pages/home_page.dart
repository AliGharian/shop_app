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

  var _categoriesItems = [
    {
      'title': 'washing',
      'url':
          'https://khooger.com/pub/media/Media/Home/Category_Icons/20210608_iconcategory_4_global.png',
    },
    {
      'title': 'furnitures',
      'url':
          'https://khooger.com/pub/media/Media/Home/Category_Icons/20210608_iconcategory_6_global.png',
    },
    {
      'title': 'TV',
      'url':
          'https://khooger.com/pub/media/Media/Home/Category_Icons/20210608_iconcategory_7_global.png',
    },
    {
      'title': 'library',
      'url':
          'https://khooger.com/pub/media/Media/Home/Category_Icons/20210608_iconcategory_8_global.png',
    },
    {
      'title': 'table',
      'url':
          'https://khooger.com/pub/media/Media/Home/Category_Icons/20210608_iconcategory_9_global.png',
    },
    {
      'title': 'mattress',
      'url':
          'https://khooger.com/pub/media/Media/Home/Category_Icons/20210608_iconcategory_1_global.png',
    },
    {
      'title': 'cooler',
      'url':
          'https://khooger.com/pub/media/Media/Home/Category_Icons/20210608_iconcategory_2_global.png',
    },
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
            Container(
              margin: EdgeInsets.symmetric(vertical: 8.0),
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: _categoriesItems.map((e) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(2.0),
                        height: 60.0,
                        width: 60.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: e['url'].toString().toUpperCase(),
                          fit: BoxFit.cover,
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) => Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        e['title'].toString().toUpperCase(),
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
