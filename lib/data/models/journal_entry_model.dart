import 'package:isar_community/isar.dart';

import '../../domain/entities/journal_entry_entity.dart';

part 'journal_entry_model.g.dart';

@collection
class JournalEntryModel {
  Id id = Isar.autoIncrement;

  late DateTime createdAt;
  late String transcribedText;
  String? audioFilePath;
  double? sentimentScore;
  List<String> extractedKeywords = [];

  @Index()
  late DateTime dayBucket;

  JournalEntryEntity toEntity() {
    return JournalEntryEntity(
      id: id,
      createdAt: createdAt,
      transcribedText: transcribedText,
      audioFilePath: audioFilePath,
      sentimentScore: sentimentScore,
      extractedKeywords: extractedKeywords,
      dayBucket: dayBucket,
    );
  }

  static JournalEntryModel fromEntity(JournalEntryEntity entity) {
    final model = JournalEntryModel()
      ..createdAt = entity.createdAt
      ..transcribedText = entity.transcribedText
      ..audioFilePath = entity.audioFilePath
      ..sentimentScore = entity.sentimentScore
      ..extractedKeywords = entity.extractedKeywords
      ..dayBucket = entity.dayBucket;

    if (entity.id != null) {
      model.id = entity.id!;
    }

    return model;
  }
}
