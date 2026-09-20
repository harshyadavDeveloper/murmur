import 'package:flutter/material.dart';
import 'package:murmur/data/datasources/speech_service.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordingProvider extends ChangeNotifier {
  final SpeechService _speechService;

  RecordingProvider(this._speechService);

  String _transcript = '';
  String get transcript => _transcript;

  bool get isListening => _speechService.isListening;

  Future<bool> requestMicPermission() async {
    final status = await Permission.microphone.request();
    return status.isGranted;
  }

  Future<void> startRecording() async {
    final hasPermission = await requestMicPermission();
    if (!hasPermission) return;

    final ready = await _speechService.initialize();
    if (!ready) return;

    _transcript = '';
    await _speechService.startListening(
      onResult: (text) {
        _transcript = text;
        notifyListeners();
      },
    );
    notifyListeners();
  }

  Future<void> stopRecording() async {
    await _speechService.stopListening();
    notifyListeners();
  }

  void reset() {
    _transcript = '';
    notifyListeners();
  }
}
