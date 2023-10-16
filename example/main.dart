import 'package:kv/file_storage.dart';
import 'package:kv/kv.dart';
import 'package:kv/memory_storage.dart';

void main() {
  var memoryKV = KV(MemoryStorage());
  memoryKV.listen("key", (newVal) {
    print('You will set: $newVal');
  });
  memoryKV.set("key", "new value");
  print('Welcome by Memory: ${memoryKV.get("key")}');

  var fileKV = KV(FileStorage("example/file_storage.json"));
  var fileKVCopy = KV(FileStorage("example/file_storage_copy.json"));
  fileKV.listen("key", (newVal) {
    print('You will set: $newVal');
  });
  var value = fileKV.get("key");
  if (value == null) {
    fileKV.set("key", "new file");
  }
  fileKVCopy.set("key", "new file copy");
  var valueCopy = fileKVCopy.get("key");
  print('Copy value: $valueCopy');
  print('Welcome by File: ${fileKV.get("key")}');
}
