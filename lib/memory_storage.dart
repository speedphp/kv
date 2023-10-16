import 'package:kv/abstract_storage.dart';

class MemoryStorage extends AbstractStorage {
  static final MemoryStorage _instance = MemoryStorage._internal();

  factory MemoryStorage() {
    return _instance;
  }

  MemoryStorage._internal();

  final Map<String, dynamic> _data = {};
  final Map<String, Function> _listeners = {};

  @override
  void set(String key, dynamic value) {
    if (_listeners[key] != null) {
      _listeners[key]!(value);
    }
    if (_data[key] != value) {
      _data[key] = value;
    }
  }

  @override
  void listen(String key, Function listener) {
    _listeners[key] = listener;
  }

  @override
  dynamic get(String key) {
    return _data[key];
  }

  @override
  void remove(String key) {
    _data.remove(key);
  }

  @override
  void clear() {
    _data.clear();
  }

  @override
  List<String> keys() {
    return _data.keys.toList();
  }
}
