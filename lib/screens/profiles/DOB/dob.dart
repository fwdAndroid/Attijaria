import 'package:flutter/material.dart';
import 'package:flutter_neat_and_clean_calendar/flutter_neat_and_clean_calendar.dart';

class DOB extends StatefulWidget {
  const DOB({Key? key}) : super(key: key);

  @override
  _DOBState createState() => _DOBState();
}

class _DOBState extends State<DOB> {
  String dropdownValue = 'Female';

  @override
  Widget build(BuildContext context) {
    var _events;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          title: Text(
            'Date of Birth',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          height: MediaQuery.of(context).size.height * 1,
          margin: EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.only(
                topLeft: const Radius.circular(40.0),
                topRight: const Radius.circular(40.0),
              )),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, top: 20),
                child: Text(
                  'Date of Birth',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                width: 320,
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                    hintText: '12/31/1992..',
                    suffixIcon: Icon(
                      Icons.calendar_today,
                      color: Colors.yellow,
                    ),
                    hintStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white70,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      borderSide: BorderSide(color: Colors.yellow, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide: BorderSide(color: Colors.yellow, width: 2),
                    ),
                  ),
                ),
              ),
              Calendar(
                startOnMonday: true,
                weekDays: ['Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa', 'So'],
                events: _events,
                isExpandable: true,
                eventDoneColor: Colors.green,
                selectedColor: Colors.pink,
                todayColor: Colors.blue,
                dayBuilder: (BuildContext context, DateTime day) {
                  return new Text("!");
                },
                eventColor: Colors.grey,
                locale: 'de_DE',
                todayButtonText: 'Heute',
                expandableDateFormat: 'EEEE, dd. MMMM yyyy',
                dayOfWeekStyle: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 11),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffF8B800),
                          onPrimary: Colors.white,
                          onSurface: Colors.grey,
                        ),
                        onPressed: () {},
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
