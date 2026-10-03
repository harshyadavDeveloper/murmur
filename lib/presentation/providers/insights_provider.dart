import 'package:flutter/material.dart';
import 'package:murmur/core/utils/logger.dart';
import 'package:murmur/domain/entities/weekly_insight_entity.dart';
import 'package:murmur/repositories/insight_repository.dart';
import 'package:murmur/repositories/journal_repository.dart';
import 'package:smart_date_formatter/smart_date_formatter.dart';

class InsightsProvider extends ChangeNotifier {
  final JournalRepository _journalRepository;
  final InsightRepository _insightRepository;

  InsightsProvider(this._journalRepository, this._insightRepository);

  WeeklyInsightEntity? _currentInsight;
  WeeklyInsightEntity? get currentInsight => _currentInsight;

  List<WeeklyInsightEntity> _history = [];
  List<WeeklyInsightEntity> get history => _history;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> computeAndLoadWeeklyInsight() async {
    _isLoading = true;
    notifyListeners();

    try {
      final range = DateRangeHelper.thisWeek();
      final entries = await _journalRepository.getEntriesBetween(
        range.start,
        range.end,
      );

      if (entries.isNotEmpty) {
        final scored = entries.where((e) => e.sentimentScore != null).toList();
        final avgSentiment = scored.isEmpty
            ? 0.0
            : scored.map((e) => e.sentimentScore!).reduce((a, b) => a + b) /
                  scored.length;

        final keywordFrequency = <String, int>{};
        for (final entry in entries) {
          for (final keyword in entry.extractedKeywords) {
            keywordFrequency[keyword] = (keywordFrequency[keyword] ?? 0) + 1;
          }
        }
        final topKeywords = keywordFrequency.keys.toList()
          ..sort(
            (a, b) => keywordFrequency[b]!.compareTo(keywordFrequency[a]!),
          );

        final insight = WeeklyInsightEntity(
          weekStart: range.start,
          avgSentiment: avgSentiment,
          topKeywords: topKeywords.take(5).toList(),
          entryCount: entries.length,
        );

        _currentInsight = await _insightRepository.saveInsight(insight);
      }

      _history = await _insightRepository.getAllInsights();
      Logger.success('Weekly insight computed: ${_history.length} weeks total');
    } catch (e) {
      Logger.error('computeAndLoadWeeklyInsight failed: $e');
    }

    _isLoading = false;
    notifyListeners();
  }
}
