import 'package:murmur/domain/entities/weekly_insight_entity.dart';

abstract class InsightRepository {
  /// Persists a computed weekly insight (replaces any existing one for the same week).
  Future<WeeklyInsightEntity> saveInsight(WeeklyInsightEntity insight);

  /// Returns the most recently computed weekly insight, if one exists.
  Future<WeeklyInsightEntity?> getLatestInsight();

  /// Returns all stored weekly insights, most recent first — for trend history.
  Future<List<WeeklyInsightEntity>> getAllInsights();
}
