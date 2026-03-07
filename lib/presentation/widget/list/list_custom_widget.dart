
import 'package:enrutamiento/config/router/router_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ListCustomWidget extends StatelessWidget {
  final RouterModel routerModel;
  final bool drawer;

  const ListCustomWidget({super.key, required this.routerModel, this.drawer = false});

  @override
  Widget build(BuildContext context) {
    return ListTile(
            title: Text(routerModel.name),
            subtitle: Text(routerModel.description),
            onTap: () {
              if(drawer){
                Navigator.pop(context);
              }
              context.go(routerModel.path);
            },
          );
  }
}

