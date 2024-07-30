// rdv_model.dart
class RdvModel {
  String id;
  String cause;
  String docteurId;
  String date; // Date en format String
  String heure; // Heure en format String
  String lieu;
  String patientId; // Identifiant du patient
  String nomPatient; // Nom du patient

  RdvModel({
    required this.id,
    required this.cause,
    required this.docteurId,
    required this.date,
    required this.heure,
    required this.lieu,
    required this.patientId,
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
      'patient_id': patientId, // Identifiant du patient
      'nom_patient': nomPatient, // Nom du patient
    };
  }

  // Create a RdvModel object from a Map object
  factory RdvModel.fromMap(Map<String, dynamic> map, String id) {
    return RdvModel(
      id: id,
      cause: map['cause'] ?? '',
      docteurId: map['docteur_id'] ?? '',
      date: map['date'] ?? '',
      heure: map['heure'] ?? '',
      lieu: map['lieu'] ?? '',
      patientId: map['patient_id'] ?? '', // Identifiant du patient
      nomPatient: map['nom_patient'] ?? '', // Nom du patient
    );
  }
}
