import 'dart:convert';

final parameter = emptyFromJson(parametersJS);

Parameters emptyFromJson(String str) => Parameters.fromJson(json.decode(str));

String emptyToJson(Parameters data) => json.encode(data.toJson());

class Parameters {
  Parameters({
    required this.motorParameters,
  });

  List<MotorParameter> motorParameters;

  factory Parameters.fromJson(Map<String, dynamic> json) => Parameters(
        motorParameters: List<MotorParameter>.from(
            json["MotorParameters"].map((x) => MotorParameter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "MotorParameters":
            List<dynamic>.from(motorParameters.map((x) => x.toJson())),
      };
}

class MotorParameter {
  MotorParameter({
    required this.groupName,
    required this.motorList,
  });

  String groupName;
  List<MotorList> motorList;

  factory MotorParameter.fromJson(Map<String, dynamic> json) => MotorParameter(
        groupName: json["GroupName"],
        motorList: List<MotorList>.from(
            json["motorList"].map((x) => MotorList.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "GroupName": groupName,
        "motorList": List<dynamic>.from(motorList.map((x) => x.toJson())),
      };
}

class MotorList {
  MotorList({
    required this.motorName,
    required this.parameters,
  });

  String motorName;
  List<Parameter> parameters;

  factory MotorList.fromJson(Map<String, dynamic> json) => MotorList(
        motorName: json["motorName"],
        parameters: List<Parameter>.from(
            json["parameters"].map((x) => Parameter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "motorName": motorName,
        "parameters": List<dynamic>.from(parameters.map((x) => x.toJson())),
      };
}

class Parameter {
  Parameter({
    required this.name,
    required this.value,
  });

  String name;
  String value;

  factory Parameter.fromJson(Map<String, dynamic> json) => Parameter(
        name: json["name"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
      };
}

String parametersJS =
    '{"MotorParameters":[{"GroupName":"Conveyor","motorList":[{"motorName":"Asse X","parameters":[{"name":"Limite Positivo","value":"150"},{"name":"Limite Negativo","value":"-90"},{"name":"","value":""},{"name":"Posizione per homing","value":"0"},{"name":"Poisizione di attesa in ciclo","value":"56"},{"name":"Vel Rapido","value":"60"},{"name":"Vel Lento","value":"10"},{"name":"Vel Homing","value":"30"},{"name":"","value":""},{"name":"Decelerazione Stop","value":"25"},{"name":"Accelerazione Rapido","value":"25"},{"name":"Accelerazione Lento","value":"25"},{"name":"Decelarazione Rapido","value":"4"},{"name":"Decelerazione Lento","value":"3"},{"name":"Jerk Rapido","value":"16"},{"name":"Jerk Lento","value":"25"},{"name":"","value":""},{"name":"","value":"25"},{"name":"Vel JOG","value":"5"},{"name":"Acc JOG","value":"25"},{"name":"Dec JOG","value":"25"},{"name":"","value":""},{"name":"Limite Coppia Positivo","value":"6"},{"name":"","value":""},{"name":"","value":""},{"name":"Zero Offset\/ RefPos","value":"13"},{"name":"Ritorno da Zero\/RefMove","value":"9"},{"name":"Accelerazione Ricerca Zero","value":"0.6"},{"name":"Velocita Ricerca Zero","value":"26"},{"name":"Velocita Ricerca Tacca","value":"3"},{"name":"Limite Coppia Ricerca Zero","value":"1"},{"name":"","value":""}]},{"motorName":"Asse Y","parameters":[{"name":"Limite Positivo","value":"150"},{"name":"Limite Negativo","value":"-90"},{"name":"","value":""},{"name":"Posizione per homing","value":"0"},{"name":"Poisizione di attesa in ciclo","value":"56"},{"name":"Vel Rapido","value":"60"},{"name":"Vel Lento","value":"10"},{"name":"Vel Homing","value":"30"},{"name":"","value":""},{"name":"Decelerazione Stop","value":"25"},{"name":"Accelerazione Rapido","value":"25"},{"name":"Accelerazione Lento","value":"25"},{"name":"Jerk Lento","value":"25"},{"name":"","value":""},{"name":"","value":"25"},{"name":"Vel JOG","value":"5"},{"name":"Acc JOG","value":"25"},{"name":"Dec JOG","value":"25"},{"name":"","value":""},{"name":"Limite Coppia Positivo","value":"6"},{"name":"","value":""},{"name":"","value":""},{"name":"Zero Offset\/ RefPos","value":"13"},{"name":"Ritorno da Zero\/RefMove","value":"9"},{"name":"Accelerazione Ricerca Zero","value":"0.6"},{"name":"Velocita Ricerca Zero","value":"26"},{"name":"Velocita Ricerca Tacca","value":"3"},{"name":"Limite Coppia Ricerca Zero","value":"1"},{"name":"","value":""}]}]},{"GroupName":"Table","motorList":[{"motorName":"Asse X","parameters":[{"name":"Limite Positivo","value":"150"},{"name":"Limite Negativo","value":"-90"},{"name":"","value":""},{"name":"Posizione per homing","value":"0"},{"name":"Poisizione di attesa in ciclo","value":"56"},{"name":"Vel Rapido","value":"60"},{"name":"Vel Lento","value":"10"},{"name":"Vel Homing","value":"30"},{"name":"","value":""},{"name":"Decelerazione Stop","value":"25"},{"name":"Accelerazione Rapido","value":"25"},{"name":"Accelerazione Lento","value":"25"},{"name":"Jerk Lento","value":"25"},{"name":"","value":""},{"name":"","value":"25"},{"name":"Vel JOG","value":"5"},{"name":"Acc JOG","value":"25"},{"name":"Dec JOG","value":"25"},{"name":"","value":""},{"name":"Limite Coppia Positivo","value":"6"},{"name":"","value":""},{"name":"","value":""},{"name":"Zero Offset\/ RefPos","value":"13"},{"name":"Ritorno da Zero\/RefMove","value":"9"},{"name":"Accelerazione Ricerca Zero","value":"0.6"},{"name":"Velocita Ricerca Zero","value":"26"},{"name":"Velocita Ricerca Tacca","value":"3"},{"name":"Limite Coppia Ricerca Zero","value":"1"},{"name":"","value":""}]}]},{"GroupName":"Portal","motorList":[{"motorName":"Asse X","parameters":[{"name":"Limite Positivo","value":"150"},{"name":"Limite Negativo","value":"-90"},{"name":"","value":""},{"name":"Posizione per homing","value":"0"},{"name":"Poisizione di attesa in ciclo","value":"56"},{"name":"Vel Rapido","value":"60"},{"name":"Vel Lento","value":"10"},{"name":"Vel Homing","value":"30"},{"name":"","value":""},{"name":"Decelerazione Stop","value":"25"},{"name":"Accelerazione Rapido","value":"25"},{"name":"Accelerazione Lento","value":"25"},{"name":"Jerk Lento","value":"25"},{"name":"","value":""},{"name":"","value":"25"},{"name":"Vel JOG","value":"5"},{"name":"Acc JOG","value":"25"},{"name":"Dec JOG","value":"25"},{"name":"","value":""},{"name":"Limite Coppia Positivo","value":"6"},{"name":"","value":""},{"name":"","value":""},{"name":"Zero Offset\/ RefPos","value":"13"},{"name":"Ritorno da Zero\/RefMove","value":"9"},{"name":"Accelerazione Ricerca Zero","value":"0.6"},{"name":"Velocita Ricerca Zero","value":"26"},{"name":"Velocita Ricerca Tacca","value":"3"},{"name":"Limite Coppia Ricerca Zero","value":"1"},{"name":"","value":""}]}]}]}';
