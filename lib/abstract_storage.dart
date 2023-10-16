abstract class AbstractStorage {
  void set(String key, dynamic value);
  dynamic get(String key);
  void remove(String key);
  void clear();
  void listen(String key, Function listener);
}
