class JournalEntryEntity {
  final int? id;
  final DateTime createdAt;
  final String transcribedText;
  final String? audioFilePath;
  final double? sentimentScore;
  final List<String> extractedKeywords;
  final DateTime dayBucket;

  const JournalEntryEntity({
    this.id,
    required this.createdAt,
    required this.transcribedText,
    this.audioFilePath,
    this.sentimentScore,
    this.extractedKeywords = const [],
    required this.dayBucket,
  });

  JournalEntryEntity copyWith({
    int? id,
    DateTime? createdAt,
    String? transcribedText,
    String? audioFilePath,
    double? sentimentScore,
    List<String>? extractedKeywords,
    DateTime? dayBucket,
  }) {
    return JournalEntryEntity(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      transcribedText: transcribedText ?? this.transcribedText,
      audioFilePath: audioFilePath ?? this.audioFilePath,
      sentimentScore: sentimentScore ?? this.sentimentScore,
      extractedKeywords: extractedKeywords ?? this.extractedKeywords,
      dayBucket: dayBucket ?? this.dayBucket,
    );
  }
}
