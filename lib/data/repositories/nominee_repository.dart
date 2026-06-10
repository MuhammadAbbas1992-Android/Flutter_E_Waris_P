import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/nominee_model.dart';

class NomineeRepository {
  final FirebaseFirestore _firestore;

  NomineeRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  // ------------------------------------------------
  // USER COLLECTION
  // ------------------------------------------------

  CollectionReference<Map<String, dynamic>> _userCollection(
      String userId,
      ) {
    if (userId.isEmpty) {
      throw Exception("User ID cannot be empty");
    }

    return _firestore
        .collection('Nominees')
        .doc(userId)
        .collection('userNominees');
  }

  // ------------------------------------------------
  // READ (Realtime)
  // ------------------------------------------------

  Stream<List<NomineeModel>> getNominees(
      String userId,
      ) {
    return _userCollection(userId)
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.map((doc) {
        return NomineeModel.fromJson({
          ...doc.data(),
          'id': doc.id,
        });
      }).toList(),
    );
  }

  // ------------------------------------------------
  // CREATE
  // ------------------------------------------------

  Future<NomineeModel> createNominee(
      NomineeModel nominee,
      String userId,
      ) async {
    final docRef = _userCollection(userId).doc();

    final newNominee = nominee.copyWith(
      id: docRef.id,
    );

    await docRef.set(
      newNominee.toJson(),
    );

    return newNominee;
  }

  // ------------------------------------------------
  // UPDATE
  // ------------------------------------------------

  Future<void> updateNominee(
      NomineeModel nominee,
      String userId,
      ) async {
    if (nominee.id == null || nominee.id!.isEmpty) {
      throw Exception(
        "Cannot update nominee: ID is null",
      );
    }

    await _userCollection(userId)
        .doc(nominee.id)
        .update(
      nominee.toJson(),
    );
  }

  // ------------------------------------------------
  // DELETE
  // ------------------------------------------------

  Future<void> deleteNominee(
      String userId,
      String nomineeId,
      ) async {
    if (nomineeId.isEmpty) {
      throw Exception(
        "Nominee ID cannot be empty",
      );
    }

    await _userCollection(userId)
        .doc(nomineeId)
        .delete();
  }
}