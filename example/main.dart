import 'package:kv/kv.dart';
import 'package:kv/storage/memory.dart';

void main() {
  var memoryStorage = KV.by(Memory());
  memoryStorage.listen("key", (newVal) {
    print('You will set: $newVal');
  });
  memoryStorage.set("key", "new value");
  print('Welcome: ${memoryStorage.get("key")}');
}
