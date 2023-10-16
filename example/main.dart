import 'package:kv/kv.dart';

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

  var userDto = UserDTO("John", "John@gmail.com", "123456");

  fileKV.set("newKey", userDto);
  var keys = fileKV.keys();
  print('Keys: $keys');
  print(
      'Last key: ${keys.last}, and value is ${fileKV.get<UserDTO>(keys.last)}');
}

class UserDTO {
  final String name;
  final String email;
  final String password;

  UserDTO(this.name, this.email, this.password);

  UserDTO.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'password': password,
      };
}
