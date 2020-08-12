import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hungerstation/style/style.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app_localizations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:hungerstation/data/data.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget offerImage(String imageUrl) {
    return Builder(
      builder: (BuildContext context) {
        return Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: ClipRRect(
            borderRadius: new BorderRadius.circular(9.0),
            child: Image.network(
              imageUrl,
              fit: BoxFit.fill,
            ),
          ),
        );
      },
    );
  }

  int corentpage = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: ColorStyle.appColor));
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'AR'),
      ],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        cursorColor: Colors.red,
      ),
      home: Scaffold(
        appBar: new AppBar(
          leading: Icon(Icons.lock_open),
          backgroundColor: ColorStyle.appColor,
          title: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                color: Colors.black38,
              ),
              Container(
                  padding: const EdgeInsets.all(1.0),
                  child: Text('جدة، وعيسى '))
            ],
          ),
          actions: [
            IconButton(icon: Icon(Icons.language), onPressed: () {}),
            Icon(Icons.add),
          ],
        ),
        body: ListView(
          children: [
            Container(
              color: ColorStyle.appColor,
              height: 70,
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Container(
                    height: 40,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16.0),
                          ),
                          borderSide: BorderSide(color: ColorStyle.fontblack),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(16.0),
                          ),
                          borderSide: BorderSide(color: ColorStyle.fontblack),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(16.0),
                          ),
                          borderSide: BorderSide(color: ColorStyle.fontblack),
                        ),
                        filled: true,
                        prefixIcon:
                            Icon(Icons.search, color: ColorStyle.fontblack),
                        hintText: "ابحث عن مطعم  ",
                        suffixIcon:
                            Icon(Icons.tune, color: ColorStyle.fontblack),
                        fillColor: ColorStyle.fontColor,
                        contentPadding: EdgeInsets.all(0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            CarouselSlider(
              height: 160,
              reverse: false,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 0.9,
              aspectRatio: 16 / 11,
              initialPage: 0,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              pauseAutoPlayOnTouch: Duration(seconds: 10),
              scrollDirection: Axis.horizontal,
              items: [
                offerImage(
                    "https://i.ytimg.com/vi/zAbMckrtuyA/maxresdefault.jpghttps://i.ytimg.com/vi/zAbMckrtuyA/maxresdefault.jpg"),
                offerImage("https://pbs.twimg.com/media/D1kO5pFX0AAlIUK.jpg"),
                offerImage(
                    "https://www.baj.com.sa/Portals/0/Images/Hunger_Station_CC_Offers_Inner_Page_Banner_1200x409px-FA_AR1121.jpg"),
              ],
              onPageChanged: (int index) {
                setState(() {
                  corentpage = index;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                    height: 6,
                    width: i == corentpage ? 6 : 3,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == corentpage
                          ? Colors.red.shade400
                          : ColorStyle.appColor,
                    ),
                  )
              ],
            ),
            for (int i = 0; i < getshops().length; i++)
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(children: [
                      Column(children: [
                        Image.network(
                          getshops()[i].iconURL,
                          height: 55,
                          width: 55,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorStyle.appColor,
                              size: 16,
                            ),
                            SizedBox(width: 2),
                            Text(
                              getshops()[i].raiting.toString(),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ],
                        ),
                      ]),
                      Container(
                        height: 70.0,
                        width: 1.0,
                        color: Theme.of(context).dividerColor,
                        margin: EdgeInsets.only(left: 10.0, right: 10.0),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getshops()[i].name,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black)),
                            Text(getshops()[i].getCategorisNames()),
                            Text(
                              ' الحد الادنى' +
                                  getshops()[i].lowerPrice.toString() +
                                  "توصيل" +
                                  getshops()[i].delevryPrice.toString(),
                              style:
                                  TextStyle(fontSize: 10, color: Colors.grey),
                            ),
                            Row(children: [
                              Icon(
                                Icons.fast_forward,
                                size: 16,
                              ),
                              Text("اسرع شي")
                            ]),
                          ])
                    ]),
                  ),
                  Divider(
                    color: Colors.black,
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
