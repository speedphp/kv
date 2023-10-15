library kv;

import 'package:kv/storage/memory.dart';
import 'package:kv/storage/storage.dart';

class KV {
  static final KV _instance = KV._internal();

  Storage _storage = Memory();

  factory KV() {
    return _instance;
  }

  factory KV.by(Storage storage) {
    _instance._storage = storage;
    return _instance;
  }

  KV._internal();

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
