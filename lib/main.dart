import 'package:flutter/material.dart';
import 'Line.dart';

void main() {
  runApp(MyScroll());
}

class MyScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      theme:  ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const MyHomePage(title: 'Navigate'),
    );
  }
}
const IconData location_on = IconData(0xe3ab, fontFamily: 'MaterialIcons');
class MyHomePage extends StatefulWidget {
   const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() =>  _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  double angle = 0.0;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        body: SizedBox(height: 2000, width: 2000, child: Line()),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton(

                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  backgroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                  child: const Icon(Icons.search_outlined,color: Colors.black,),


                ),
                FloatingActionButton(
                  onPressed: () {
                    // Add your onPressed code here!
                  },
                  backgroundColor: Colors.black,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))
                  ),
                  child: const Icon(Icons.location_on),


                ),
              ],
            ),
          )

      ),
    );
  }
}

// class MyCanvasView extends CustomPainter{
//   @override
//   void paint(Canvas canvas, Size size) {
//     // var paint =  Paint();
//     Paint paint = new Paint()
//       ..color = Color(0xffE5E4E2)
//       ..style = PaintingStyle.fill;
//     canvas.drawRect(new Offset(0.0, 0.0)&size, paint);
//     var path = new Path();
//     path.moveTo(0.0, size.height);
//     path.lineTo(1*size.width/4, 0*size.height/4);
//     path.lineTo(2*size.width/4, 2*size.height/4);
//     path.lineTo(3*size.width/4, 0*size.height/4);
//     path.lineTo(4*size.width/4, 4*size.height/4);
//     canvas.drawPath(path, new Paint()..color = Colors.black ..strokeWidth = 01 .. style = PaintingStyle.stroke);
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
//
// }