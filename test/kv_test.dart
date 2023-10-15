import 'package:kv/kv.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    final kv = Kv.fromJson({'key': 'awesome', 'value': 'dart'});

    setUp(() {
      // Additional setup goes here.
    });

    test('First Test', () {
      expect(kv.toJson(), {'key': 'awesome', 'value': 'dart'});
    });
  });
}
