/// The part file `smellsense.db.g.dart` is generated by the `floor` package and is part of this
/// module. Members used in the part file are imported from here.
// ignore_for_file: dangling_library_doc_comments, unused_import

import 'dart:async'; // generated `floor` SQLite database part imports `StreamController` from `dart:async`

import 'package:floor/floor.dart';
import 'package:smellsense/app/db/daos/training_period.dao.dart';
import 'package:smellsense/app/db/daos/training_scent.dao.dart';
import 'package:smellsense/app/db/daos/training_session.dao.dart';
import 'package:smellsense/app/db/daos/training_session_entry.dao.dart';
import 'package:smellsense/app/db/entities/training_period.entity.dart';
import 'package:smellsense/app/db/entities/training_scent.entity.dart';
import 'package:smellsense/app/db/entities/training_session.entity.dart';
import 'package:smellsense/app/db/type-converters/datetime.type_converter.dart';
import 'package:smellsense/app/shared/string_builder.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart'
    as sqflite; // generated `floor` SQLite database part uses aliased sqflite import under the hood

import 'entities/training_session_entry.entity.dart';

part 'smellsense.db.g.dart';

@Database(version: 1, entities: [
  TrainingScentEntity,
  TrainingPeriodEntity,
  TrainingSessionEntity,
  TrainingSessionEntryEntity
])
@TypeConverters([DateTimeTypeConverter])
abstract class SmellSenseDatabase extends FloorDatabase {
  TrainingPeriodDao get trainingPeriodDao;
  TrainingSessionDao get trainingSessionDao;
  TrainingSessionEntryDao get trainingSessionEntryDao;
  TrainingScentDao get trainingScentDao;
}

class SmellSenseDatabaseException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  SmellSenseDatabaseException(this.message, [this.stackTrace]);

  @override
  String toString() {
    return StringBuilder.builder()
        .append('SmellSenseDatabaseException: $message')
        .appendLine(
          stackTrace,
        )
        .toString();
  }
}
