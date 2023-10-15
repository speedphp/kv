import 'package:kv/kv.dart';
import 'package:test/test.dart';
import 'package:kv/storage/memory.dart';

void main() {
  group('A group of tests', () {
    var memoryStorage = KV.by(Memory());

    setUp(() {
      memoryStorage.set("key", "new value");
    });

    test('First Test', () {
      expect(memoryStorage.get("key"), "new value");
    });
  });
}
