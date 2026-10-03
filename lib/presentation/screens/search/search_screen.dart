import 'package:flutter/material.dart';
import 'package:murmur/presentation/providers/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:smart_date_formatter/smart_date_formatter.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          autofocus: true,
          decoration: const InputDecoration(
            hintText: 'Search your entries...',
            border: InputBorder.none,
          ),
          onChanged: (query) => context.read<SearchProvider>().search(query),
        ),
      ),
      body: Consumer<SearchProvider>(
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.results.isEmpty) {
            return const Center(child: Text('No matching entries.'));
          }

          return ListView.builder(
            itemCount: provider.results.length,
            itemBuilder: (context, index) {
              final entry = provider.results[index];
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
    );
  }
}
