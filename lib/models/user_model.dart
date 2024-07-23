class UserModel {
  String? id;
  String nom;
  String email;
  String tel;
  String mdp;

  UserModel({
    this.id,
    required this.nom,
    required this.email,
    required this.tel,
    required this.mdp,
  });

  // Convert a UserModel object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'email': email,
      'tel': tel,
      'mdp': mdp,
    };
  }

  // Convert a Map object into a UserModel object
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'],
      nom: map['nom'],
      email: map['email'],
      tel: map['tel'],
      mdp: map['mdp'],
    );
  }
}
