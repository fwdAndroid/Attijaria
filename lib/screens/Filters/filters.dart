import 'package:attijaria/screens/Filters/filtersmoto.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Voiture extends StatefulWidget {
  const Voiture({Key? key}) : super(key: key);

  @override
  _VoitureState createState() => _VoitureState();
}

class _VoitureState extends State<Voiture> {
  RangeValues _currentRangeValues = RangeValues(0, 100);
  RangeValues _currentRangeValues1 = RangeValues(0, 100);
  Widget RangeFunctions(RangeValues currentCal, double mains, double mins) {
    return RangeSlider(
      values: _currentRangeValues,
      min: mains,
      max: mins,
      divisions: 5,
      labels: RangeLabels(
        currentCal.start.round().toString(),
        currentCal.end.round().toString(),
      ),
      onChanged: (RangeValues values) {
        setState(() {
          currentCal = values;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Filtrer', style: TextStyle(color: HexColor("#18191A"))),
          backgroundColor: HexColor('#FFFFFF'),
          toolbarHeight: 100,
          // ignore: prefer_const_constructors
          leading: Icon(
            Icons.close,
            color: HexColor('#18191A'),
          ),
          actions: const [
            Padding(
                padding: EdgeInsets.only(
                  right: 20,
                ),
                child: Icon(Icons.search))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 85,
                width: MediaQuery.of(context).size.width / .5,
                padding: EdgeInsets.only(top: 30, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                    color: HexColor('#9098B1'),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    prefixIcon: Icon(Icons.search),
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor('#9098B1'))),
                    // ignore: prefer_const_constructors
                    hintText: ("Que recherchez vous ?"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: HexColor('#F8B800'),
                        )),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Catégorie',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / .5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                    color: HexColor('#9098B1'),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor('#9098B1'))),
                    // ignore: prefer_const_constructors
                    hintText: ("Voitures"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: HexColor('#F8B800'),
                        )),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ville',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / .5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                    color: HexColor('#9098B1'),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor('#9098B1'))),
                    // ignore: prefer_const_constructors
                    hintText: ("Entrez le nom de la ville"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: HexColor('#F8B800'),
                        )),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Type d’annonce',
                  )),
              Row(
                children: [
                  Radio(
                    value: 1,
                    groupValue: 2,
                    activeColor: HexColor('#F8B800'),
                    onChanged: (val) {
                      //  setSelectedRadio(val);
                    },
                  ),
                  Text('Vente'),
                  SizedBox(
                    width: 100,
                  ),
                  Radio(
                    value: 1,
                    groupValue: 2,
                    activeColor: HexColor('#F8B800'),
                    onChanged: (val) {
                      //  setSelectedRadio(val);
                    },
                  ),
                  Text('Demande'),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Type de voiture',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / .5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                    color: HexColor('#9098B1'),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor('#9098B1'))),
                    // ignore: prefer_const_constructors
                    hintText: ("Type de voiture"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: HexColor('#F8B800'),
                        )),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Marque',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / .5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                    color: HexColor('#9098B1'),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor('#9098B1'))),
                    // ignore: prefer_const_constructors
                    hintText: ("Marque"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: HexColor('#F8B800'),
                        )),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 20, left: 10),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Modèle',
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / .5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                    color: HexColor('#9098B1'),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor('#9098B1'))),
                    // ignore: prefer_const_constructors
                    hintText: ("Modèle"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: HexColor('#F8B800'),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      )),
                  // prix slider
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 30),
                        leading: Image.asset('assets/icons/solidmoney.png'),
                        title: Text(
                          'Prix (DH)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55, right: 140),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: HexColor('#9098B1'),
                                  )),
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: HexColor('#9098B1'),
                                  ))
                            ]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 3.7,
                            height: 40,
                            child: TextField(
                              style: TextStyle(
                                color: HexColor('#9098B1'),
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                // ignore: prefer_const_constructors
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: HexColor('#9098B1'))),
                                // ignore: prefer_const_constructors
                                hintText: ("0"),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: HexColor('#F8B800'),
                                    )),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 3.5,
                            height: 40,
                            child: TextField(
                              style: TextStyle(
                                color: HexColor('#9098B1'),
                              ),
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                // ignore: prefer_const_constructors
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: HexColor('#9098B1'))),
                                // ignore: prefer_const_constructors
                                hintText: ("9000000"),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                    borderSide: BorderSide(
                                      color: HexColor('#F8B800'),
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      RangeSlider(
                        values: _currentRangeValues,
                        min: 0,
                        max: 100,
                        divisions: 5,
                        labels: RangeLabels(
                          _currentRangeValues.start.round().toString(),
                          _currentRangeValues.end.round().toString(),
                        ),
                        onChanged: (RangeValues values) {
                          setState(() {
                            _currentRangeValues = values;
                          });
                        },
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 30),
                        leading: Image.asset('assets/icons/anneemodele.png'),
                        title: Text(
                          'Année-Modèle',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 120),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('1980',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: HexColor('#F8B800'),
                                  )),
                              Text('2021',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: HexColor('#F8B800'),
                                  ))
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55, right: 140),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: HexColor('#9098B1'),
                                  )),
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: HexColor('#9098B1'),
                                  ))
                            ]),
                      ),
                      // RangeSlider(
                      //   activeColor: HexColor('#F8B800'),
                      //   values: _currentRangeValues,
                      //   min: 0,
                      //   max: 100,
                      //   labels: RangeLabels(
                      //     _currentRangeValues.start.round().toString(),
                      //     _currentRangeValues.end.round().toString(),
                      //   ),
                      //   onChanged: (RangeValues values) {
                      //     setState(() {
                      //       _currentRangeValues = values;
                      //     });
                      //   },
                      // ),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text('Type de carburant')),
              Container(
                width: MediaQuery.of(context).size.width / .5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                    color: HexColor('#9098B1'),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: HexColor('#9098B1'))),
                    // ignore: prefer_const_constructors
                    hintText: ("Boite vitesse"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: HexColor('#F8B800'),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 30),
                        leading: Image.asset('assets/icons/kmrange.png'),
                        title: Text(
                          'Kilométrage (Km)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 100),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('0',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xffF8B800),
                                  )),
                              Text('500000+',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xffF8B800),
                                  ))
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55, right: 140),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff9098B1),
                                  )),
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff9098B1),
                                  ))
                            ]),
                      ),
                      // RangeSlider(
                      //   activeColor: Color(0xffF8B800),
                      //   values: _currentRangeValues,
                      //   min: 0,
                      //   max: 100,
                      //   labels: RangeLabels(
                      //     _currentRangeValues.start.round().toString(),
                      //     _currentRangeValues.end.round().toString(),
                      //   ),
                      //   onChanged: (RangeValues values) {
                      //     setState(() {
                      //       _currentRangeValues = values;
                      //     });
                      //   },
                      // ),
                    ],
                  )
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text('Première main')),
              Container(
                width: MediaQuery.of(context).size.width / .5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                    color: Color(0xff9098B1),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff9098B1))),
                    // ignore: prefer_const_constructors
                    hintText: ("Première main"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Color(0xffF8B800),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 30),
                        leading: Image.asset('assets/icons/puissance.png'),
                        title: Text(
                          'Puissance Fiscale (CV)',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 130),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('5',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xffF8B800),
                                  )),
                              Text('20+',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xffF8B800),
                                  ))
                            ]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 55, right: 140),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff9098B1),
                                  )),
                              Text('min',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Color(0xff9098B1),
                                  ))
                            ]),
                      ),
                      // RangeSlider(
                      //   activeColor: Color(0xffF8B800),
                      //   values: _currentRangeValues,
                      //   min: 0,
                      //   max: 100,
                      //   labels: RangeLabels(
                      //     _currentRangeValues.start.round().toString(),
                      //     _currentRangeValues.end.round().toString(),
                      //   ),
                      //   onChanged: (RangeValues values) {
                      //     setState(() {
                      //       _currentRangeValues = values;
                      //     });
                      //   },
                      // ),
                    ],
                  )
                ],
              ),
              Container(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text('Boite vitesse')),
              Container(
                width: MediaQuery.of(context).size.width / .5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                    color: Color(0xff9098B1),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff9098B1))),
                    // ignore: prefer_const_constructors
                    hintText: ("Boite vitesse"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Color(0xffF8B800),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text('Couleurs')),
              Container(
                width: MediaQuery.of(context).size.width / .5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                    color: Color(0xff9098B1),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff9098B1))),
                    // ignore: prefer_const_constructors
                    hintText: ("choisir votre couleur"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Color(0xffF8B800),
                        )),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                  padding: EdgeInsets.only(top: 20, left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text('Détails supplémantaires')),
              Container(
                width: MediaQuery.of(context).size.width / .5,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                child: TextField(
                  style: TextStyle(
                    color: Color(0xff9098B1),
                  ),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    // ignore: prefer_const_constructors
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff9098B1))),
                    // ignore: prefer_const_constructors
                    hintText: ("Autres options"),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: BorderSide(
                          color: Color(0xffF8B800),
                        )),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: 2,
                        activeColor: Color(0xffF8B800),
                        onChanged: (val) {
                          //  setSelectedRadio(val);
                        },
                      ),
                      Text('Annonces avec images'),
                    ],
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: 2,
                        activeColor: Color(0xffF8B800),
                        onChanged: (val) {
                          //  setSelectedRadio(val);
                        },
                      ),
                      Text('Annonces avec prix'),
                    ],
                  ),
                  SizedBox(height: 30),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Moto()));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        width: MediaQuery.of(context).size.width / 1.1,
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffF8B800)),
                        child: Text(
                          'Rechercher',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
