/*
SEARCH FOR "TODO" for tasks

LINKS:
General Design: https://whimsical.co/2jbY96yxpqqDxoeaLKFHDk

Three page: https://www.youtube.com/watch?v=b2fgMCeSNpY
Tinder-esque: https://www.youtube.com/watch?v=NMHhzd5ewP4

Task Manager: https://github.com/jiachangyang1025/flutter-sqflite-todo-app
Database: 
https://github.com/smartherd/Flutter-Demos
https://www.youtube.com/watch?v=1BwjNEKD8g8&index=25&list=PLlxmoA0rQ-Lw6tAs2fGFuXGP13-dWdKsB
Misc Demo: https://github.com/rahulkp220/Learning-Flutter
Published app: https://github.com/FrazileDevelopers/Wallfy
Flutter Studio: http://mutisya.com/
*/

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:glowing_guacamole/models/job_card.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'dart:convert';
import 'dart:async';
import './models/job.dart';
// TODO: merge legacy.dart
// TODO: add database_helper.dart


void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
      // theme: themeData,
  ));
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext ctx) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Job Search",
          style: TextStyle(
            color: Colors.black
            ),
          ),
        // backgroundColor: Theme.of(ctx).accentColor,
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: new IconButton(
          icon: new Icon(
            Icons.inbox,
            color: Colors.black,
          ),
          onPressed: () => Navigator.push(ctx, SavedPage()),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: (){
              Navigator.push(ctx, SettingsPage());
            },
          )
        ],
      ),
      
      // TODO: add card class and make it work with api
      // (can test with hard coded joblist before incorportating api)
      body: Container(
        color: Colors.white,
        child: JobCard(
          Job(
            "Facebook", 
            "New York, NY", 
            "Software Engineer, Intern/Co-op", 
            "Code high-volume software using primarily C++ and Java, create web applications using primarily PHP, implement web interfaces using XHTML, CSS, and JavaScript, build report interfaces and data feeds",
            "https://www.facebook.com",
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 0.0,
        // TODO: LATER TASK: work out padding so it looks better maybe. it might be fine as is
        child: new Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            bottom: 16.0,
            left: 24.0,
            right: 24.0
            ),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new RoundIconButton.large(
                icon: Icons.clear,
                iconColor: Colors.red[500],
                onPressed: () {
                  // TODO: ignore job
                },
              ),
              new RoundIconButton.small(
                icon: Icons.refresh,
                iconColor: Colors.orange,
                onPressed: () {
                  // TODO: refresh job list with api
                },
              ),
              new RoundIconButton.large(
                icon: Icons.favorite,
                iconColor: Colors.green[500],
                onPressed: () {
                  // TODO: add job to database
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SavedPage extends MaterialPageRoute<Null> {
  SavedPage() : super(builder: (BuildContext ctx) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "SAVED",
            style: TextStyle(
              color: Colors.black
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.check, 
                color: Colors.black
              ),
              onPressed: () {
                Navigator.popUntil(ctx, ModalRoute.withName(Navigator.defaultRouteName));
              },
            )
          ],
        ),
        
        // TODO: umm list out jobs from database, follow task manager as guide
        body: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              left: 32.0,
              right: 32.0,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Facebook",
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Software Engineer, Intern/Co-op",
                              style: TextStyle(
                                fontSize: 14.0, color: Colors.black
                              ),
                            ),
                          ],
                        )
                      ),
                      SizedBox(width: 6.0),
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          size: 36.0,
                        ),
                        onPressed: () {
                          // TODO: delete the saved job
                        },
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Uber",
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Product Designer, Uber Eats",
                              style: TextStyle(
                                fontSize: 14.0, color: Colors.black
                              ),
                            ),
                          ],
                        )
                      ),
                      SizedBox(width: 6.0),
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          size: 36.0,
                        ),
                        onPressed: () {
                          // TODO: delete the saved job
                        },
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black,
                  height: 16.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Amazon",
                              style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Front End Engineer",
                              style: TextStyle(
                                fontSize: 14.0, color: Colors.black
                              ),
                            ),
                          ],
                        )
                      ),
                      SizedBox(width: 6.0),
                      IconButton(
                        icon: Icon(
                          Icons.delete_outline,
                          size: 36.0,
                        ),
                        onPressed: () {
                          // TODO: delete the saved job
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
  });
}

class SettingsPage extends MaterialPageRoute<Null> {
  final positionController = TextEditingController();

  SettingsPage() : super(builder: (BuildContext ctx) {
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
              children: <Widget>[
                TextField(
                  // controller: positionController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                        Icons.person,
                        color: Colors.black,
                      ),
                    labelText: "Position",
                    labelStyle: TextStyle(
                      color: Colors.black
                    ),
                    hintText: "Software Engineer",
                  ),
                ),
                TextField(
                  // controller: positionController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                        Icons.location_city,
                        color: Colors.black,
                      ),
                    labelText: "City",
                    labelStyle: TextStyle(
                      color: Colors.black
                    ),
                    hintText: "New York",
                  ),
                ),
                // TODO: need to implement DropDownButton
              ],
            ),
          )
        ),
      );
  });

}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;

  RoundIconButton.large({
      this.icon,
      this.iconColor,
      this.onPressed,
  }) : size = 90.0;

  RoundIconButton.small({
      this.icon,
      this.iconColor,
      this.onPressed,
  }) : size = 50.0;

  RoundIconButton({
      this.icon,
      this.iconColor,
      this.size,
      this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: size,
      height: size,
      decoration: new BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          new BoxShadow(
            color: const Color(0x11000000),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        child: new Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
