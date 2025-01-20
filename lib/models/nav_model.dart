import 'package:flutter/material.dart';

class NavModel {
  final String title;
  final String icon;
  final Widget? route;

  NavModel({required this.icon, required this.title, this.route});
}
