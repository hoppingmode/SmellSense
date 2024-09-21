import 'package:flutter/material.dart';
import 'package:smellsense/app/shared/modules/training_scent/training_scent.module.dart';
import 'package:smellsense/app/shared/utils.dart';

class TrainingScentDisplay {
  final TrainingScentName name;
  final String displayName;
  final Color displayColor;
  final String displayImage;

  const TrainingScentDisplay({
    required this.name,
    required this.displayName,
    required this.displayColor,
    required this.displayImage,
  });

  @override
  String toString() {
    return formatString(this, [
      'name',
      'displayName',
      'displayColor',
      'displayImage',
    ]);
  }
}
