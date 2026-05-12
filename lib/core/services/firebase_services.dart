import 'package:e_waris/data/models/nominee_model.dart';
import 'package:firebase_database/firebase_database.dart';

import '../utils/app_utils.dart';

class FirebaseServices{

  // Add a new Medicine items into Firebase
  static Future<bool> addNominee(NomineeModel nomineeModel) async {
    final DatabaseReference databaseReference = FirebaseDatabase.instance.ref(AppUtils.dbName);

    try {
      final petRef = databaseReference.child('UserKey').child(AppUtils.nominees).push();
      nomineeModel.id = petRef.key!;
      await petRef.set(nomineeModel.toMap());
      return true;
    } catch (e) {
      return false;
    }
  }

}