import 'package:isar_community/isar.dart';
import 'package:murmur/data/models/weekly_insight_model.dart';
import 'package:murmur/repositories/insight_repository.dart';

import '../../domain/entities/weekly_insight_entity.dart';

class InsightRepositoryImpl implements InsightRepository {
  final Isar _isar;

  InsightRepositoryImpl(this._isar);

  @override
  Future<WeeklyInsightEntity> saveInsight(WeeklyInsightEntity insight) async {
    final model = WeeklyInsightModel.fromEntity(insight);

    await _isar.writeTxn(() async {
      await _isar.weeklyInsightModels.put(model);
    });

    return model.toEntity();
  }

  @override
  Future<WeeklyInsightEntity?> getLatestInsight() async {
    final model = await _isar.weeklyInsightModels
        .where()
        .sortByWeekStartDesc()
        .findFirst();

    return model?.toEntity();
  }

  @override
  Future<List<WeeklyInsightEntity>> getAllInsights() async {
    final models = await _isar.weeklyInsightModels
        .where()
        .sortByWeekStartDesc()
        .findAll();

    return models.map((m) => m.toEntity()).toList();
  }
}
