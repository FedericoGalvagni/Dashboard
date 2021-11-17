import 'dart:convert';

String responseBody = a2;
final mechanicalGroup = groupFromJson(responseBody);

Group groupFromJson(String str) => Group.fromJson(json.decode(str));

String groupToJson(Group data) => json.encode(data.toJson());

class Group {
  Group({
    required this.groups,
  });

  List<GroupElement> groups;

  factory Group.fromJson(Map<String, dynamic> json) => Group(
        groups: List<GroupElement>.from(
            json["Groups"].map((x) => GroupElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Groups": List<dynamic>.from(groups.map((x) => x.toJson())),
      };
}

class GroupElement {
  GroupElement({
    required this.name,
    required this.actuators,
  });

  String name;
  List<Actuator> actuators;

  factory GroupElement.fromJson(Map<String, dynamic> json) => GroupElement(
        name: json["name"],
        actuators: List<Actuator>.from(
            json["actuators"].map((x) => Actuator.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "actuators": List<dynamic>.from(actuators.map((x) => x.toJson())),
      };
}

class Actuator {
  Actuator(
      {required this.name,
      required this.type,
      required this.value,
      required this.id});

  String name;
  String type;
  String value;
  String id;

  factory Actuator.fromJson(Map<String, dynamic> json) => Actuator(
      name: json["name"],
      type: json["type"],
      value: json["value"],
      id: json["id"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "value": value,
        "id": id,
      };
}

String a2 =
    '{"Groups":[{"name":"Laser","actuators":[{"name":"asseX","type":"motor","value":"10","id":"0"},{"name":"asseY","type":"motor","value":"2","id":"1"},{"name":"asseZ","type":"motor","value":"10","id":"2"},{"name":"cassetto","type":"pneumatic","value":"1","id":"3"},{"name":"bo","type":"pneumatic","value":"0","id":"4"}]},{"name":"Conveyor","actuators":[{"name":"asseX","type":"motor","value":"10","id":"5"},{"name":"asseY","type":"motor","value":"2","id":"6"},{"name":"asseZ","type":"motor","value":"10","id":"7"},{"name":"cassetto","type":"pneumatic","value":"1","id":"8"},{"name":"bo","type":"pneumatic","value":"0","id":"9"}]}]}';
