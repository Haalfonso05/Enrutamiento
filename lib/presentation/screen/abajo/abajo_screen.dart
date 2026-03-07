
import 'package:flutter/material.dart';
  final List<Widget> pantalla = const [
      Center(child: Text("Pantalla Uno"),),
      Center(child: Text("Pantalla Dos :)"),),
    ];
class AbajoScreen extends StatefulWidget {
  const AbajoScreen({super.key});

  @override
  State<AbajoScreen> createState() => _AbajoScreenState();
}

class _AbajoScreenState extends State<AbajoScreen> {

  int _indicador = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pantalla[_indicador],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indicador,
        onTap: (value) {
          setState(() {
            _indicador = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            
            icon: Icon(Icons.sports_football),
            label: "Sports_football",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_football_outlined),
            label: "Sports_football_outlined",
          ),
        ],
      ),
    );
  }
}