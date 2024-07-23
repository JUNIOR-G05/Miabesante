// rdv_model.dart
class RdvModel {
  String id;
  String cause;
  String docteurId;
  String date;
  String heure;
  String lieu;
  String nomPatient;

  RdvModel({
    required this.id,
    required this.cause,
    required this.docteurId,
    required this.date,
    required this.heure,
    required this.lieu,
    required this.nomPatient,
  });

  // Convert a RdvModel object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'cause': cause,
      'docteur_id': docteurId,
      'date': date,
      'heure': heure,
      'lieu': lieu,
      'nom_patient': nomPatient,
    };
  }

  // Create a RdvModel object from a Map object
  factory RdvModel.fromMap(Map<String, dynamic> map, String id) {
    return RdvModel(
      id: id,
      cause: map['cause'],
      docteurId: map['docteur_id'],
      date: map['date'],
      heure: map['heure'],
      lieu: map['lieu'],
      nomPatient: map['nom_patient'],
    );
  }
}
