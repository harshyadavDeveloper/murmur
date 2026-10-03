import 'package:flutter/material.dart';
import 'package:murmur/presentation/screens/record/record_screen.dart';
import 'package:murmur/presentation/screens/search/search_screen.dart';
import 'package:provider/provider.dart';

import 'package:murmur/presentation/providers/journal_provider.dart';
import 'package:smart_date_formatter/smart_date_formatter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Murmur'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const SearchScreen()),
              );
            },
          ),
        ],
      ),
      body: Consumer<JournalProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading && provider.entries.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }

          if (provider.entries.isEmpty) {
            return const Center(
              child: Text('No entries yet. Tap + to record your first one.'),
            );
          }

          return ListView.builder(
            itemCount: provider.entries.length,
            itemBuilder: (context, index) {
              final entry = provider.entries[index];
              return ListTile(
                title: Text(
                  entry.transcribedText,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(entry.createdAt.timeAgo),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const RecordScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
