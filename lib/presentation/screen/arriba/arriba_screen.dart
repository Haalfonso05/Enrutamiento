
import 'package:flutter/material.dart';

class ArribaScreen extends StatelessWidget {
  const ArribaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar:AppBar(
          title: Text("Tabs Arriba"),
          bottom: TabBar(
            tabs: [
              Tab(text: "Tab 1",),
              Tab(text: "Tab 2",)
            ]
          ),
        ),
        body:  TabBarView(
          children: [
            Center(child: Text("Tab numero 1")),
            Center(child: Text("Tab numero 2")),
          ],
        )
      ),
    );
  }
}