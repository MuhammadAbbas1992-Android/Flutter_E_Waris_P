import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_waris/core/utils/app_utils.dart';
import '../models/asset_model.dart';

class AssetRepository {
  final FirebaseFirestore _firestore;

  AssetRepository({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  // ─────────────────────────────────────────────
  // 🔥 USER COLLECTION
  // ─────────────────────────────────────────────
  CollectionReference<Map<String, dynamic>> _userCollection(String userId) {
    if (userId.isEmpty) {
      throw Exception("User email cannot be empty");
    }

    return _firestore
        .collection(AppUtils.assets)
        .doc(userId)
        .collection('userAssets');
  }

  // ─────────────────────────────────────────────
  // 🔥 READ (REALTIME)
  // ─────────────────────────────────────────────
  Stream<List<AssetModel>> getAssets(String userId) {
    return _userCollection(userId).snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return AssetModel.fromJson({...doc.data(), 'id': doc.id});
      }).toList();
    });
  }

  // ─────────────────────────────────────────────
  // 🔥 CREATE (AUTO ID SAFE)
  // ─────────────────────────────────────────────
  Future<AssetModel> createAsset(AssetModel asset, String userId) async {
    final docRef = _userCollection(userId).doc();

    final newAsset = asset.copyWith(id: docRef.id);

    await docRef.set(newAsset.toJson());

    return newAsset;
  }

  // ─────────────────────────────────────────────
  // 🔥 UPDATE (SAFE CHECK ADDED)
  // ─────────────────────────────────────────────
  Future<void> updateAsset(AssetModel asset, String userId) async {
    if (asset.id == null || asset.id!.isEmpty) {
      throw Exception("Cannot update asset: ID is null");
    }

    await _userCollection(userId).doc(asset.id).update(asset.toJson());
  }

  // ─────────────────────────────────────────────
  // 🔥 DELETE (SAFE CHECK ADDED)
  // ─────────────────────────────────────────────
  Future<void> deleteAsset(String email, String assetId) async {
    if (assetId.isEmpty) {
      throw Exception("Asset ID cannot be empty");
    }

    await _userCollection(email).doc(assetId).delete();
  }
}
