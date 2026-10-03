import 'package:flutter/material.dart';
import 'package:murmur/core/utils/logger.dart';
import 'package:murmur/domain/entities/journal_entry_entity.dart';
import 'package:murmur/repositories/journal_repository.dart';

class SearchProvider extends ChangeNotifier {
  final JournalRepository _repository;

  SearchProvider(this._repository);

  List<JournalEntryEntity> _results = [];
  List<JournalEntryEntity> get results => _results;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> search(String query) async {
    if (query.trim().isEmpty) {
      _results = [];
      notifyListeners();
      return;
    }

    _isLoading = true;
    notifyListeners();

    try {
      _results = await _repository.searchEntries(query.trim());
    } catch (e) {
      Logger.error('search failed: $e');
      _results = [];
    }

    _isLoading = false;
    notifyListeners();
  }
}
