import 'package:flutter/material.dart';
import 'google';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const drag(),
    ),
  );
}

class drag extends StatefulWidget {
  const drag({super.key});

  @override
  State<drag> createState() => _dragState();
}

class _dragState extends State<drag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade50,
      body: ListView(
        children: [
          Draggable(
            feedback: feedback,
            child: Container(
              child: Text(
                'Drag me?',
                style: Google,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
