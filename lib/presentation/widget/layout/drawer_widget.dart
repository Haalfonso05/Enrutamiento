import 'package:enrutamiento/config/router/router.dart';
import 'package:enrutamiento/presentation/widget/list/list_custom_widget.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: ListView.builder(
          itemCount: appRoutes.length,
          itemBuilder: (context , index){
          return ListCustomWidget(routerModel: appRoutes[index], drawer: true);
        }))
          
        ],
      ),
    );
  }
}