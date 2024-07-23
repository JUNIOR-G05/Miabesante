import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:miabesante/models/rdv_model.dart';

class RdvService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createRdv(RdvModel rdv) async {
    await _firestore.collection('rdv').add(rdv.toMap());
  }

  Future<void> updateRdv(String id, RdvModel rdv) async {
    await _firestore.collection('rdv').doc(id).update(rdv.toMap());
  }

  Future<void> deleteRdv(String id) async {
    await _firestore.collection('rdv').doc(id).delete();
  }

  Future<RdvModel?> getRdvById(String id) async {
    DocumentSnapshot doc = await _firestore.collection('rdv').doc(id).get();
    if (doc.exists) {
      return RdvModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }
    return null;
  }

  Stream<List<RdvModel>> getRdvsByDocteurId(String docteurId) {
    return _firestore
        .collection('rdv')
        .where('docteur_id', isEqualTo: docteurId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return RdvModel.fromMap(doc.data() as Map<String, dynamic>, doc.id);
      }).toList();
    });
  }
}
