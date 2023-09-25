import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const drag(),
    ),
  );
}

// ignore: camel_case_types
class drag extends StatefulWidget {
  const drag({super.key});

  @override
  State<drag> createState() => _dragState();
}

class _dragState extends State<drag> {
  @override
  Widget build(BuildContext context) {
    double left = 0;
    double top = 0;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 210, 150, 220),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Drag test',
              style: GoogleFonts.baloo2(fontSize: 30, color: Colors.white),
            ),
            const SizedBox(
              height: 90,
            ),
            Draggable(
              feedback: Container(
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(20),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              //ondrag start
              onDragStarted: () {
                setState(() {
                  left = left;
                  top = top;
                });
              },

              onDragUpdate: (details) {
                setState(() {
                  top += details.delta.dx;
                  left += details.delta.dy;
                });
              },
              child: Positioned(
                left: left,
                top: top,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
