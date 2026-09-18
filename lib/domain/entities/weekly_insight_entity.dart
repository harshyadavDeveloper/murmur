class WeeklyInsightEntity {
  final int? id;
  final DateTime weekStart;
  final double avgSentiment;
  final List<String> topKeywords;
  final int entryCount;

  const WeeklyInsightEntity({
    this.id,
    required this.weekStart,
    required this.avgSentiment,
    this.topKeywords = const [],
    required this.entryCount,
  });

  WeeklyInsightEntity copyWith({
    int? id,
    DateTime? weekStart,
    double? avgSentiment,
    List<String>? topKeywords,
    int? entryCount,
  }) {
    return WeeklyInsightEntity(
      id: id ?? this.id,
      weekStart: weekStart ?? this.weekStart,
      avgSentiment: avgSentiment ?? this.avgSentiment,
      topKeywords: topKeywords ?? this.topKeywords,
      entryCount: entryCount ?? this.entryCount,
    );
  }
}
