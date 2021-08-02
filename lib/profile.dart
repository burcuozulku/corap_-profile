import 'widget/adding_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import "package:mask_text_input_formatter/mask_text_input_formatter.dart";

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

var textEditingController = TextEditingController();
var maskFormatter = new MaskTextInputFormatter(
    mask: '##/##/####', filter: {"#": RegExp(r'[0-9]')});
var maskFormatter1 = new MaskTextInputFormatter(
    mask: '#### ### ####', filter: {"#": RegExp(r'[0-9]')});
var maskFormatter2 = new MaskTextInputFormatter(
    mask: 'TR## ##### # ################', filter: {"#": RegExp(r'[0-9]')});

class _ProfileState extends State<Profile> {
  int currentindex = 0;

  String dropdownValue = '   Erkek    ';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Center(
            child: SingleChildScrollView(
                padding: EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
                child: Column(children: <Widget>[
                  Positioned(
                      top: screenHeight - (screenHeight - 20.0),
                      left: (screenWidth / 5) + 25.0,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Profil',
                                style: GoogleFonts.poppins(
                                    color: Color(0xFF23163D), fontSize: 25.0)),
                            Text(
                                'Profil bilgilerini sırayla ve doğru olarak giriniz',
                                style: GoogleFonts.bigShouldersText(
                                    color: Color(0xFFA59FB0), fontSize: 15.0)),
                            SizedBox(height: 2.0),
                          ])),
                  AddingTextField(
                      labeltext: 'Ad Soyad',
                      maxLines: 1,
                      color: Color(0xffB6BFFF)),
                  SizedBox(height: 5.0),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: textEditingController,
                    inputFormatters: [maskFormatter],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.4)),
                        ),
                        labelText: 'Doğum Tarihi (Gün Ay Yıl)',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffB6BFFF)))),
                  ),
                  SizedBox(height: 5.0),
                  Container(
                    padding: EdgeInsets.all(5),
                    child: DropdownButton<String>(
                      value: dropdownValue,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>[
                        '   Erkek    ',
                        '   Kadın    ',
                        '   Diğer    '
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value));
                      }).toList(),
                      isExpanded: true,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  AddingTextField(
                      labeltext: 'Şehir',
                      maxLines: 1,
                      color: Color(0xffB6BFFF)),
                  SizedBox(height: 5.0),
                  AddingTextField(
                      labeltext: 'Mobil İşletim Sistemi',
                      maxLines: 1,
                      color: Color(0xffB6BFFF)),
                  SizedBox(height: 5.0),
                  Row(
                    children: [
                      radioButton("Reklam", Color(0xffB6BFFF), 0),
                      radioButton("Görev", Color(0xffB6BFFF), 1),
                    ],
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [maskFormatter1],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.4)),
                        ),
                        labelText: 'Cep telefonunuzu giriniz ...',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff32127A)))),
                  ),
                  SizedBox(height: 5.0),
                  RaisedButton(
                    color: Colors.grey[800],
                    onPressed: () {},
                    child: Text(
                      "Doğrulama Kodu Gönder",
                      style: TextStyle(color: Color(0xffB6BFFF)),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  TextField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [maskFormatter2],
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                          borderSide:
                              BorderSide(color: Colors.grey.withOpacity(0.4)),
                        ),
                        labelText: 'IBAN adresinizi giriniz ...',
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff32127A)))),
                  ),
                  SizedBox(height: 5.0),
                  RaisedButton(
                    color: Colors.grey[800],
                    onPressed: () {},
                    child: Text(
                      "  IBAN adresimi kaydet  ",
                      style: TextStyle(color: Color(0xffB6BFFF)),
                    ),
                  ),
                  SizedBox(height: 5.0),
                  RaisedButton(
                    color: Colors.grey[800],
                    onPressed: () {},
                    child: Text(
                      " Profili Güncelle  ",
                      style: TextStyle(color: Colors.indigoAccent),
                    ),
                  )
                ]))));
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0),
      child: FlatButton(
        color: currentindex == index ? color : Colors.grey[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: () {
          changeIndex(index);
        },
        child: Text(
          value,
          style: TextStyle(color: currentindex == index ? Colors.black : color),
        ),
      ),
    ));
  }
}
