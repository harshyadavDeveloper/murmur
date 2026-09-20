import 'package:isar_community/isar.dart';

import 'package:murmur/domain/entities/weekly_insight_entity.dart';

part 'weekly_insight_model.g.dart';

@collection
class WeeklyInsightModel {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late DateTime weekStart;

  late double avgSentiment;
  List<String> topKeywords = [];
  late int entryCount;

  WeeklyInsightEntity toEntity() {
    return WeeklyInsightEntity(
      id: id,
      weekStart: weekStart,
      avgSentiment: avgSentiment,
      topKeywords: topKeywords,
      entryCount: entryCount,
    );
  }

  static WeeklyInsightModel fromEntity(WeeklyInsightEntity entity) {
    final model = WeeklyInsightModel()
      ..weekStart = entity.weekStart
      ..avgSentiment = entity.avgSentiment
      ..topKeywords = entity.topKeywords
      ..entryCount = entity.entryCount;

    if (entity.id != null) {
      model.id = entity.id!;
    }

    return model;
  }
}
