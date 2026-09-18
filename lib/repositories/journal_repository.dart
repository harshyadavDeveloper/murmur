import 'package:murmur/domain/entities/journal_entry_entity.dart';

abstract class JournalRepository {
  /// Persists a new journal entry and returns it with its assigned id.
  Future<JournalEntryEntity> createEntry(JournalEntryEntity entry);

  /// Updates an existing entry (e.g. after sentiment scoring completes).
  Future<void> updateEntry(JournalEntryEntity entry);

  /// Returns all entries, most recent first.
  Future<List<JournalEntryEntity>> getAllEntries();

  /// Returns entries within a given day range — used for weekly aggregation.
  Future<List<JournalEntryEntity>> getEntriesBetween(
    DateTime start,
    DateTime end,
  );

  /// Simple local text search across transcribed entries.
  Future<List<JournalEntryEntity>> searchEntries(String query);

  /// Deletes a single entry by id.
  Future<void> deleteEntry(int id);
}
