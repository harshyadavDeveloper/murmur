import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:murmur/presentation/providers/insights_provider.dart';
import 'package:provider/provider.dart';
import 'package:smart_date_formatter/smart_date_formatter.dart';

class InsightsScreen extends StatefulWidget {
  const InsightsScreen({super.key});

  @override
  State<InsightsScreen> createState() => _InsightsScreenState();
}

class _InsightsScreenState extends State<InsightsScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<InsightsProvider>().computeAndLoadWeeklyInsight();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weekly Insights')),
      body: Consumer<InsightsProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.currentInsight == null) {
            return const Center(child: Text('No entries this week yet.'));
          }

          final insight = provider.currentInsight!;

          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Week of ${insight.weekStart.calendar}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 8),
                Text('${insight.entryCount} entries this week'),
                const SizedBox(height: 24),
                Text(
                  'Average mood: ${insight.avgSentiment > 0.1
                      ? '🙂 Positive'
                      : insight.avgSentiment < -0.1
                      ? '🙁 Low'
                      : '😐 Neutral'}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(height: 24),
                if (provider.history.length > 1) ...[
                  const Text('Mood trend'),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 180,
                    child: LineChart(
                      LineChartData(
                        minY: -1,
                        maxY: 1,
                        lineBarsData: [
                          LineChartBarData(
                            spots: provider.history
                                .asMap()
                                .entries
                                .map(
                                  (e) => FlSpot(
                                    e.key.toDouble(),
                                    e.value.avgSentiment,
                                  ),
                                )
                                .toList(),
                            isCurved: true,
                            color: Colors.indigo,
                            dotData: const FlDotData(show: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
                const Text('Top themes this week'),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  children: insight.topKeywords
                      .map((k) => Chip(label: Text(k)))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
