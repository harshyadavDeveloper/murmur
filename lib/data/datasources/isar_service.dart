import 'dart:io';

import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/journal_entry_model.dart';
import '../models/weekly_insight_model.dart';

class IsarService {
  static Isar? _instance;

  static Future<Isar> getInstance() async {
    if (_instance != null) return _instance!;

    final dir = await getApplicationDocumentsDirectory();

    _instance = await Isar.open([
      JournalEntryModelSchema,
      WeeklyInsightModelSchema,
    ], directory: dir.path);

    return _instance!;
  }
}
