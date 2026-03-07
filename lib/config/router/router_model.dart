import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterModel {
  String name;
  String description;
  String path;
  Widget Function(BuildContext, GoRouterState) widget;
  RouterModel({
    required this.name,
    required this.description,
    required this.path,
    required this.widget,
  });
}