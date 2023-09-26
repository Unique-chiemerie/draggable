import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Drag(),
    ),
  );
}

class Drag extends StatefulWidget {
  const Drag({super.key});

  @override
  State<Drag> createState() => _DragState();
}

class _DragState extends State<Drag> {
  double left = 0;
  double top = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 210, 150, 220),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 70,
          ),
          Center(
            child: Text(
              'Drag test',
              style: GoogleFonts.baloo2(fontSize: 30, color: Colors.white),
            ),
          ),
          const SizedBox(
            height: 90,
          ),
          GestureDetector(
            onPanUpdate: (details) {
              setState(() {
                top = (top + details.delta.dy).clamp(0.0, double.maxFinite);
                left = (left + details.delta.dx).clamp(0.0, double.maxFinite);
              });
            },
            child: Container(
              margin: EdgeInsets.only(left: left, top: top),
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
