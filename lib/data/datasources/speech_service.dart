import 'package:murmur/core/utils/logger.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  final SpeechToText _speech = SpeechToText();
  bool _isInitialized = false;
  void Function(String status)? _onStatusCallback;

  Future<bool> initialize({void Function(String status)? onStatus}) async {
    _onStatusCallback = onStatus;

    if (_isInitialized) return true;

    _isInitialized = await _speech.initialize(
      onStatus: (status) => _onStatusCallback?.call(status),
      onError: (error) => Logger.error('Speech error: $error'),
    );
    return _isInitialized;
  }

  Future<void> startListening({
    required void Function(String text) onResult,
  }) async {
    await _speech.listen(
      onResult: (result) => onResult(result.recognizedWords),
      listenOptions: SpeechListenOptions(
        partialResults: true,
        cancelOnError: true,
        listenMode: ListenMode.dictation,
        listenFor: const Duration(minutes: 5),
        pauseFor: const Duration(seconds: 5),
      ),
    );
  }

  Future<void> stopListening() async {
    await _speech.stop();
  }
}
