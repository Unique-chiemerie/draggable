import 'package:flutter/material.dart';

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
      backgroundColor: Colors.purple.shade50,
      body: ListView(
        children: [
          Draggable(
            feedback: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(43, 132, 58, 223),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Text(
                'Dragging!!!!',
              ),
            ),
//the ondrag logic(this one helps to mark/ note the location you started off from )
            onDragStarted: () {
              setState(() {
                left = left;
                top = top;
              });
            },
            onDragUpdate: (details) {
              setState(() {
                left += details.delta.dx;
                top += details.delta.dy;
              });
            },
            child: Positioned(
              top: top,
              left: left,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple.shade900,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  'Drag me?',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
