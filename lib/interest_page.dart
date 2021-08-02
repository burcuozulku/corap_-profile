import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'widget/activity.dart';
import 'widget/activity_card.dart';

class InterestPage extends StatefulWidget {
  @override
  _InterestPageState createState() => _InterestPageState();
}

class _InterestPageState extends State<InterestPage> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
            child: Column(children: <Widget>[
          Positioned(
              top: screenHeight - (screenHeight - 20.0),
              left: (screenWidth / 5) + 25.0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('İlgi Alanlarım',
                        style: GoogleFonts.poppins(
                            color: Color(0xFF23163D), fontSize: 25.0)),
                    Text('İlgi Alanlarından en fazla 5 tane seçim yapınız...',
                        style: GoogleFonts.bigShouldersText(
                            color: Color(0xFFA59FB0), fontSize: 15.0)),
                    SizedBox(height: 7.0),
                  ])),
          Container(
              padding: EdgeInsets.only(
                top: 5,
                left: 20,
                right: 20,
              ),
              width: double.infinity,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Spor',
                      style: GoogleFonts.notoSerif(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.black),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          ...List.generate(demoActivities.length, (index) {
                            return ActivityCard(
                                activity: demoActivities[index]);
                          })
                        ],
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Müzik',
                            style: GoogleFonts.notoSerif(
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                                color: Colors.black),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...List.generate(demoActivities1.length,
                                    (index) {
                                  return ActivityCard(
                                      activity: demoActivities1[index]);
                                })
                              ],
                            ),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Oyun',
                                  style: GoogleFonts.notoSerif(
                                      fontSize: 20,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.black),
                                ),
                                SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      ...List.generate(demoActivities2.length,
                                          (index) {
                                        return ActivityCard(
                                            activity: demoActivities2[index]);
                                      })
                                    ],
                                  ),
                                ),
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        'Seyahat',
                                        style: GoogleFonts.notoSerif(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            ...List.generate(
                                                demoActivities3.length,
                                                (index) {
                                              return ActivityCard(
                                                  activity:
                                                      demoActivities3[index]);
                                            })
                                          ],
                                        ),
                                      ),
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              'Diğer',
                                              style: GoogleFonts.notoSerif(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black),
                                            ),
                                            SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                children: [
                                                  ...List.generate(
                                                      demoActivities4.length,
                                                      (index) {
                                                    return ActivityCard(
                                                        activity:
                                                            demoActivities4[
                                                                index]);
                                                  })
                                                ],
                                              ),
                                            ),
                                          ])
                                    ])
                              ])
                        ])
                  ]))
        ])));
  }
}
