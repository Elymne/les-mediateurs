import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

final logger = Logger(
  output: FileOutput(),
  printer: PrettyPrinter(
    methodCount: 2,
    errorMethodCount: 8,
    lineLength: 200,
    colors: true,
    printEmojis: true,
    printTime: true,
  ),
);

class FileOutput extends LogOutput {
  @override
  void output(OutputEvent event) async {
    // final Directory directory = await getApplicationDocumentsDirectory();
    // final date = DateTime.now();
    // final String folderName = '${date.year}_${date.month}_${date.day}';
    // final File file = File('${directory.path}/logs/$folderName/log.txt');
    for (var line in event.lines) {
      if (kDebugMode) print(line);
      //await file.writeAsString("${line.toString()}\n", mode: FileMode.writeOnlyAppend);
    }
  }
}
