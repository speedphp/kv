import 'memory_storage.dart';
import 'abstract_storage.dart';

class KV {
  static final KV _instance = KV._internal();

  AbstractStorage _storage = MemoryStorage();

  factory KV([AbstractStorage? storage]) {
    if (storage == null) {
      return _instance;
    }
    return KV._internal(storage);
  }

  KV._internal([AbstractStorage? storage]) {
    if (storage != null) {
      _storage = storage;
    }
  }

  void set(String key, dynamic value) {
    _storage.set(key, value);
  }

  // 泛型的get方法
  T get<T>(String key) {
    return _storage.get(key) as T;
  }

  void remove(String key) {
    _storage.remove(key);
  }

  void clear() {
    _storage.clear();
  }

  void listen(String key, Function listener) {
    _storage.listen(key, listener);
  }

  List<String> keys() {
    return _storage.keys();
  }
}
