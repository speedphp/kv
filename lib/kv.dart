library kv;

class Kv {
  String key;
  String value;

  Kv(this.key, this.value);

  Kv.fromJson(Map<String, dynamic> json)
      : key = json['key'],
        value = json['value'];

  Map<String, dynamic> toJson() => {
        'key': key,
        'value': value,
      };
}
