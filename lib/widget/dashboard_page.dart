import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../interest_page.dart';
import '../accounts.dart';
import '../profile.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  var _selectedOption = 0;

  List allOptions = [Profile(), InterestPage(), Accounts()];

  List isSelected = [true, false, false];

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
                height: screenHeight,
                width: screenWidth,
                color: Colors.transparent),
            Container(
                height: screenHeight,
                width: screenWidth / 5.5,
                color: Color(0xffdee2ff)),
            Positioned(
                left: screenWidth / 5.0,
                child: Container(
                  height: screenHeight,
                  width: screenWidth - (screenWidth / 5),
                  color: Colors.white,
                )),
            Positioned(top: 35.0, left: 20.0, child: Icon(Icons.west)),
            buildSideNavigator(),
            Positioned(
                top: (screenHeight / 20) + 5.0,
                left: (screenWidth / 5) + 25.0,
                child: Container(
                    height: screenHeight - ((screenHeight / 10) + 5.0),
                    width: screenWidth - ((screenWidth / 5) + 40.0),
                    child: allOptions[_selectedOption]))
          ],
        ));
  }

  buildSideNavigator() {
    return Positioned(
        top: 75.0,
        child: RotatedBox(
            quarterTurns: 3,
            child: Container(
                width: MediaQuery.of(context).size.height - 100.0,
                height: MediaQuery.of(context).size.width / 5,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildOption('Hesaplarım', 2),
                      buildOption('İlgi Alanlarım', 1),
                      buildOption('Profil', 0),
                    ]))));
  }

  buildOption(String title, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isSelected[index]
            ? Container(
                height: 8.0,
                width: 8.0,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black))
            : Container(
                height: 8.0,
                width: 8.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.transparent)),
        SizedBox(height: 5.0),
        GestureDetector(
            onTap: () {
              setState(() {
                _selectedOption = index;
                isOptionSelected(index);
              });
            },
            child: Text(
              title,
              style: isSelected[index]
                  ? GoogleFonts.bigShouldersText(
                      color: Color(0xFF23163D), fontSize: 18.0)
                  : GoogleFonts.bigShouldersText(
                      color: Color(0xFFA59FB0), fontSize: 17.0),
            ))
      ],
    );
  }

  isOptionSelected(index) {
    var previousIndex = isSelected.indexOf(true);
    isSelected[index] = true;
    isSelected[previousIndex] = false;
  }
}
