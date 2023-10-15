import 'package:kv/kv.dart';

void main() {
  var kv = Kv.fromJson({'key': 'awesome', 'value': 'dart'});
  print('Welcome: ${kv.toJson()}');
}
