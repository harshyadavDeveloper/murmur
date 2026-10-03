import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:murmur/data/insights/insight_engine.dart';

class LocalLexiconEngine implements InsightEngine {
  final Sentiment _sentiment = Sentiment();

  static const _stopwords = {
    'i',
    'me',
    'my',
    'we',
    'our',
    'you',
    'your',
    'he',
    'she',
    'it',
    'they',
    'them',
    'is',
    'am',
    'are',
    'was',
    'were',
    'be',
    'been',
    'a',
    'an',
    'the',
    'and',
    'or',
    'but',
    'if',
    'so',
    'to',
    'of',
    'in',
    'on',
    'at',
    'for',
    'with',
    'this',
    'that',
    'have',
    'has',
    'had',
    'do',
    'did',
    'not',
    'just',
  };

  @override
  ({double sentimentScore, List<String> keywords}) analyze(String text) {
    final result = _sentiment.analysis(text);
    final comparative = (result['comparative'] as num).toDouble();
    final normalized = comparative.clamp(-1.0, 1.0);

    final words = text
        .toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), '')
        .split(RegExp(r'\s+'))
        .where((w) => w.length > 2 && !_stopwords.contains(w));

    final frequency = <String, int>{};
    for (final word in words) {
      frequency[word] = (frequency[word] ?? 0) + 1;
    }

    final sortedKeywords = frequency.keys.toList()
      ..sort((a, b) => frequency[b]!.compareTo(frequency[a]!));

    return (
      sentimentScore: normalized,
      keywords: sortedKeywords.take(5).toList(),
    );
  }
}
