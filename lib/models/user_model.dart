class UserModel {
  String? id;
  String nom;
  String email;
  String tel;
  String role;
  String mdp;

  UserModel({
    this.id,
    required this.nom,
    required this.email,
    required this.tel,
    required this.role,
    required this.mdp,
  });

  // Convertit un objet UserModel en un Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom': nom,
      'email': email,
      'tel': tel,
      'role': role,
      'mdp': mdp,
    };
  }

  // Convertit un Map en un objet UserModel
  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      id: id,
      nom: map['nom'],
      email: map['email'],
      tel: map['tel'],
      role: map['role'],
      mdp: map['mdp'],
    );
  }
}
