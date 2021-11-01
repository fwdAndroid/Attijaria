import 'package:attijaria/screens/Filters/filtersappartments.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Telephone extends StatefulWidget {
  const Telephone({Key? key}) : super(key: key);

  @override
  _TelephoneState createState() => _TelephoneState();
}

class _TelephoneState extends State<Telephone> {
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
              child: Icon(
                Icons.search,
              ))
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
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
              hintText: ("Engine BTP"),
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
          ),
        ),
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
            'Marque',
          ),
        ),
        Container(
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
        Container(
          padding: EdgeInsets.only(top: 20, left: 10),
          alignment: Alignment.centerLeft,
          child: Text(
            'Etat',
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
              hintText: ("Etat"),
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
            'Capacité de stockage',
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (ctx) => AppartmentsFilters()));
          },
          child: Container(
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
                hintText: ("Capacité de stockage"),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                    borderSide: BorderSide(
                      color: HexColor('#F8B800'),
                    )),
              ),
            ),
          ),
        ),
      ])),
    );
  }
}
