import 'package:flutter/material.dart';
import 'package:location_app/home.dart';
import 'package:map_view/map_view.dart';
import 'package:location_app/login.dart';

var api_key = "AIzaSyAKxEhDmBxlLzHJoKQjXSnja-jeqkEMp3k";

void main() {
  MapView.setApiKey(api_key);
  runApp(
    MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => Home(),
        '/location': (context) => Location(),
      },
    ),
  );
}

class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  MapView mapView = new MapView();
  CameraPosition cameraPosition;
  var staticMapProvider = new StaticMapProvider(api_key);
  Uri staticMapUri;

  get showMap => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cameraPosition = new CameraPosition(Locations.centerOfUSA, 2.0);
    staticMapUri = staticMapProvider.getStaticUri(Locations.centerOfUSA, 12,
        height: 400, width: 900, mapType: StaticMapViewType.roadmap);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          new Center(
            child: new Container(
              height: 300,
              child: new Stack(
                children: <Widget>[
                  new Center(
                    child: Container(
                      child: new Text('Map should show here',
                          textAlign: TextAlign.center),
                      padding: EdgeInsets.all(20),
                    ),
                  )
                ],
              ),
            ),
          ),
          new InkWell(
            child: new Center(
              child: Image.network(''),
            ),
            onTap: () {},
          ),
          new Container(
            padding: EdgeInsets.only(top: 25),
            child: new Text(
                "Camera Position:\n\nLat: ${cameraPosition.center.latitude}\n\nLng:${cameraPosition.center.longitude}\n\nZoom: ${cameraPosition.zoom}"),
          ),
          new Container(
            padding: EdgeInsets.only(top: 10),
            child: new Text(
              'Tap the map to interact',
              style: new TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
