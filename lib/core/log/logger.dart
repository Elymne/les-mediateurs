import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 120,
    colors: true,
    printEmojis: true,
    printTime: false,
  ),
);

class FileOutput extends LogOutput {
  late final File? file;

  @override
  Future<void> init() async {
    super.init();

    final date = DateTime.now();
    final String folderName = '${date.year}_${date.month}_${date.day}';
    file = File('/logs/$folderName/log.txt');
  }

  @override
  void output(OutputEvent event) async {
    if (file != null) {
      for (var line in event.lines) {
        await file!.writeAsString("${line.toString()}\n", mode: FileMode.writeOnlyAppend);
      }
      return;
    }

    for (var line in event.lines) {
      if (kDebugMode) print(line);
    }
  }
}
