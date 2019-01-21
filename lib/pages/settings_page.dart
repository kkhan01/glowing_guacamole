import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _counter = 0;

  void _savesettings() {
    setState(() {
        _counter++;
    });
  }

  final TextEditingController _positionController = new TextEditingController();
  final TextEditingController _cityController = new TextEditingController();

  String selectedState;
  List<String> states = <String>[ 'AL', 'AK', 'AS', 'AZ', 'AR', 'CA', 'CO', 'CT', 'DE', 'DC', 'FM', 'FL', 'GA', 'GU', 'HI', 'ID', 'IL', 'IN', 'IA', 'KS', 'KY', 'LA', 'ME', 'MH', 'MD', 'MA', 'MI', 'MN', 'MS', 'MO', 'MT', 'NE', 'NV', 'NH', 'NJ', 'NM', 'NY', 'NC', 'ND', 'MP', 'OH', 'OK', 'OR', 'PW', 'PA', 'PR', 'RI', 'SC', 'SD', 'TN', 'TX', 'UT', 'VT', 'VI', 'VA', 'WA', 'WV', 'WI', 'WY' ];

  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "SETTINGS",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
              color: Colors.black,
            ),
            onPressed: (){
              // TODO: save settings method called here, are we using another db? we should use a json or smth....
              Navigator.popUntil(ctx, ModalRoute.withName(Navigator.defaultRouteName));
            },
          )
        ],
      ),
      
      // TODO: form for api search
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 32.0,
            right: 32.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "Search Preferences",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: Center(
                  child: Icon(
                      Icons.person,
                      size: 48.0,
                  ),
                ),
              ),
              Text(
                "Position",
                style: TextStyle(
                  fontSize: 16.0
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 16.0
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _positionController,
                  decoration: InputDecoration(
                    hintText: "Software Engineer Intern",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 16.0,
                ),
                child: Center(
                  child: Icon(
                      Icons.location_on,
                      size: 48.0,
                  ),
                ),
              ),
              Text(
                "City",
                style: TextStyle(
                  fontSize: 16.0
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 8.0,
                  bottom: 8.0,
                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: _cityController,
                  decoration: InputDecoration(
                    hintText: "New York",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                ),
                child: Text(
                  "State",
                  style: TextStyle(
                    fontSize: 16.0
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 32.0
                ),
                child: DropdownButton(
                  hint: Text(
                    "Select a state",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  value: selectedState,
                  onChanged: (String state) {
                    setState(() {
                      selectedState = state;
                    });
                  },
                  items: states.map((String state) {
                    return new DropdownMenuItem<String>(
                      value: state,
                      child: new Text(
                        state
                      ),
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        )
      ),
    );
  }
}
