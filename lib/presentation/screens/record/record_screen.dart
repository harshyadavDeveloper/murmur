import 'package:flutter/material.dart';
import 'package:murmur/presentation/providers/journal_provider.dart';
import 'package:murmur/presentation/providers/recording_provider.dart';
import 'package:provider/provider.dart';

class RecordScreen extends StatelessWidget {
  const RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New entry')),
      body: Consumer<RecordingProvider>(
        builder: (context, recording, _) {
          return Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      recording.transcript.isEmpty
                          ? 'Tap the mic and start talking...'
                          : recording.transcript,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 72,
                  icon: Icon(
                    recording.isListening ? Icons.stop_circle : Icons.mic,
                    color: recording.isListening ? Colors.red : Colors.indigo,
                  ),
                  onPressed: () async {
                    if (recording.isListening) {
                      await recording.stopRecording();
                    } else {
                      await recording.startRecording();
                    }
                  },
                ),
                if (recording.transcript.isNotEmpty && !recording.isListening)
                  ElevatedButton(
                    onPressed: () async {
                      await context.read<JournalProvider>().saveEntry(
                        recording.transcript,
                      );
                      recording.reset();
                      if (context.mounted) Navigator.pop(context);
                    },
                    child: const Text('Save entry'),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
