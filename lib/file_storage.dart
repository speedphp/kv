import 'dart:convert';
import 'dart:io';
import 'package:kv/abstract_storage.dart';

class FileStorage extends AbstractStorage {
  final String path;
  final Map<String, Function> _listeners = {};
  static final Map<String, FileStorage> _cache = {};
  late final Map<String, dynamic> _content;

  factory FileStorage(String path) {
    if (_cache.containsKey(path)) {
      return _cache[path]!;
    } else {
      final file = FileStorage._internal(path);
      _cache[path] = file;
      return file;
    }
  }

  FileStorage._internal(this.path) {
    final fileContent = File(path).readAsStringSync();
    _content = fileContent.isNotEmpty ? jsonDecode(fileContent) : {};
  }

  @override
  void clear() {
    _content.clear();
    _saveToFile();
  }

  @override
  dynamic get(String key) {
    return _content[key];
  }

  @override
  void listen(String key, Function listener) {
    _listeners[key] = listener;
  }

  @override
  void remove(String key) {
    _content.remove(key);
    _saveToFile();
  }

  @override
  void set(String key, dynamic value) {
    if (_listeners[key] != null) {
      _listeners[key]!(value);
    }
    _content[key] = value;
    _saveToFile();
  }

  Future<void> _saveToFile() async {
    final file = File(path);
    await file.writeAsString(jsonEncode(_content));
  }
}
