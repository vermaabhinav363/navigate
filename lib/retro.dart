import 'package:flutter/material.dart';
import 'package:location/location.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Navigate BPHC',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'Navigate Home Page'),
    );
  }
}
double? latitude = 0;
double? longitude = 0;
double? altitude = 0;
Location location = Location();



class MyHomePage extends StatefulWidget {


  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  void fun () async {

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    location.onLocationChanged.listen((LocationData currentLocation) {
      setState(() {
        latitude = currentLocation.latitude;
        longitude = currentLocation.longitude;
        altitude = currentLocation.altitude;
      });
      print(currentLocation.longitude);
      print(currentLocation.latitude);
      print(currentLocation.altitude);
      print(currentLocation.heading);
    });
  }

  @override
  Widget build(BuildContext context) {
    fun();
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: LayoutBuilder(
            // Inner yellow container
            builder: (_, constraints) => Container(
              width: constraints.widthConstraints().maxWidth,
              height: constraints.heightConstraints().maxHeight,
              color: Colors.grey[400],
              child: CustomPaint(painter: FaceOutlinePainter()),
            ),
          ),
        ),
      ),
    );
  }
}
class FaceOutlinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0
      ..color = Colors.indigo;
    final redPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.red;
    canvas.drawRect(
      Rect.fromLTWH(20, 40, 100, 100),
      redPaint,
    );
  }

  @override
  bool shouldRepaint(FaceOutlinePainter oldDelegate) => false;
}