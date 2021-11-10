class Actuator {
  String name;
  String value;
  String type;

  Actuator(this.name, this.value, this.type);

  factory Actuator.fromJson(dynamic json) {
    return Actuator(json['name'] as String, json['value'] as String,
        json["type"] as String);
  }
}
