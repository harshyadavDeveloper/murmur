import 'package:flutter/foundation.dart';
import 'package:murmur/core/utils/logger.dart';
import 'package:murmur/data/insights/insight_engine.dart';
import 'package:murmur/repositories/journal_repository.dart';

import 'package:murmur/domain/entities/journal_entry_entity.dart';

class JournalProvider extends ChangeNotifier {
  final JournalRepository _repository;
  final InsightEngine _insightEngine;

  JournalProvider(this._repository, this._insightEngine);

  List<JournalEntryEntity> _entries = [];
  List<JournalEntryEntity> get entries => _entries;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  Future<void> loadEntries() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _entries = await _repository.getAllEntries();
    } catch (e) {
      _error = 'Could not load entries. Please try again.';
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> saveEntry(String transcribedText) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final now = DateTime.now();
      final analysis = _insightEngine.analyze(transcribedText);

      final entry = JournalEntryEntity(
        createdAt: now,
        transcribedText: transcribedText,
        dayBucket: DateTime(now.year, now.month, now.day),
        sentimentScore: analysis.sentimentScore,
        extractedKeywords: analysis.keywords,
      );

      await _repository.createEntry(entry);
      _entries = await _repository.getAllEntries();
      Logger.success('Entry saved with sentiment ${analysis.sentimentScore}');
    } catch (e) {
      _error = 'Could not save your entry. Please try again.';
      Logger.error('saveEntry failed: $e');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> deleteEntry(int id) async {
    try {
      await _repository.deleteEntry(id);
      _entries = await _repository.getAllEntries();
      notifyListeners();
    } catch (e) {
      _error = 'Could not delete entry.';
      notifyListeners();
    }
  }
}
