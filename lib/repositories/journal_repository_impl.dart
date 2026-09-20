import 'package:isar_community/isar.dart';
import 'package:murmur/data/models/journal_entry_model.dart';
import 'package:murmur/repositories/journal_repository.dart';

import 'package:murmur/domain/entities/journal_entry_entity.dart';

class JournalRepositoryImpl implements JournalRepository {
  final Isar _isar;

  JournalRepositoryImpl(this._isar);

  @override
  Future<JournalEntryEntity> createEntry(JournalEntryEntity entry) async {
    final model = JournalEntryModel.fromEntity(entry);

    await _isar.writeTxn(() async {
      await _isar.journalEntryModels.put(model);
    });

    return model.toEntity();
  }

  @override
  Future<void> updateEntry(JournalEntryEntity entry) async {
    final model = JournalEntryModel.fromEntity(entry);

    await _isar.writeTxn(() async {
      await _isar.journalEntryModels.put(model);
    });
  }

  @override
  Future<List<JournalEntryEntity>> getAllEntries() async {
    final models = await _isar.journalEntryModels
        .where()
        .sortByCreatedAtDesc()
        .findAll();

    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<JournalEntryEntity>> getEntriesBetween(
    DateTime start,
    DateTime end,
  ) async {
    final models = await _isar.journalEntryModels
        .filter()
        .dayBucketBetween(start, end)
        .findAll();

    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<List<JournalEntryEntity>> searchEntries(String query) async {
    final models = await _isar.journalEntryModels
        .filter()
        .transcribedTextContains(query, caseSensitive: false)
        .findAll();

    return models.map((m) => m.toEntity()).toList();
  }

  @override
  Future<void> deleteEntry(int id) async {
    await _isar.writeTxn(() async {
      await _isar.journalEntryModels.delete(id);
    });
  }
}
