import 'package:flutter/material.dart';

class FeatureVip {
  final VoidCallback runFeature;
  final int price;

  void run() => runFeature();

  FeatureVip({required this.runFeature, required this.price});
}
