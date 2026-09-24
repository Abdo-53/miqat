import 'package:flutter/material.dart';

class TaspehModel {
  final String Function(BuildContext) title;
  final int target;

  const TaspehModel({required this.title, required this.target});
}
