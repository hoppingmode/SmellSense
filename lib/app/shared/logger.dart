import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:logger/logger.dart' as dart_logger;
import 'package:smellsense/app/shared/string_builder.dart';

class AppLogPrinter extends dart_logger.PrettyPrinter {
  AppLogPrinter({
    super.lineLength = 150,
    super.colors = true,
    super.printEmojis = true,
    super.printTime = true,
    super.methodCount = 0,
    super.errorMethodCount = 5,
    super.excludeBox = const {
      dart_logger.Level.all: false,
      dart_logger.Level.trace: true,
    },
  });

  @override
  String stringifyMessage(dynamic message) => stringifyClassObject(message);

  String stringifyClassObject(dynamic object) => object.toString();
}

class Log {
  static var logger = dart_logger.Logger(
    printer: AppLogPrinter(),
    output: dart_logger.MultiOutput(
      [
        dart_logger.ConsoleOutput(),
        dart_logger.FileOutput(
          file: File.fromRawPath(
            Uint8List.fromList('log.txt'.codeUnits),
          ),
          encoding: const Utf8Codec(),
          overrideExisting: false,
        ),
      ],
    ),
  );

  static trace(dynamic message) {
    logger.t(StringBuilder.builder().append(message).toString());
  }

  static debug(dynamic message) {
    logger.d(StringBuilder.builder().append(message).toString());
  }

  static info(dynamic message) {
    logger.i(StringBuilder.builder().append(message).toString());
  }

  static warn(dynamic message) {
    logger.w(StringBuilder.builder().append(message).toString());
  }

  static error(dynamic message) {
    logger.e(StringBuilder.builder().append(message).toString());
  }
}
