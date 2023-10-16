library kv;

import 'package:kv/memory_storage.dart';
import 'package:kv/abstract_storage.dart';

class KV {
  static final KV _instance = KV._internal();

  AbstractStorage _storage = MemoryStorage();

  // factory KV() {
  //   return _instance;
  // }

  factory KV(AbstractStorage? storage) {
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

  dynamic get(String key) {
    return _storage.get(key);
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
}
