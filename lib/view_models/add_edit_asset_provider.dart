import 'package:flutter/material.dart';
import '../data/models/asset_model.dart';
import '../data/repositories/asset_repository.dart';

class AddEditAssetProvider extends ChangeNotifier {
  final AssetRepository _repo;

  AddEditAssetProvider({AssetRepository? repo})
    : _repo = repo ?? AssetRepository();

  // ─────────────────────────────
  // Controllers (MOVE FROM SCREEN)
  // ─────────────────────────────
  final assetNameCtrl = TextEditingController();
  final platformCtrl = TextEditingController();
  final usernameCtrl = TextEditingController();
  final recoveryHintCtrl = TextEditingController();
  final notesCtrl = TextEditingController();

  // ─────────────────────────────
  // Dropdown State
  // ─────────────────────────────
  final List<String> categories = [
    'Crypto Wallet',
    'Bank Account',
    'Email Account',
    'Social Media',
    'Investment',
    'Insurance',
    'Other',
  ];

  final List<String> nominees = ['John Doe', 'Jane Doe', 'Ali Hassan'];

  String selectedCategory = 'Crypto Wallet';
  String? selectedNominee;

  // ─────────────────────────────
  // Editing asset
  // ─────────────────────────────
  AssetModel? asset;

  bool isEditMode = false;

  // ─────────────────────────────
  // INIT SCREEN DATA
  // ─────────────────────────────
  void init(AssetModel? existing) {
    asset = existing;

    if (existing != null && existing.id != null) {
      isEditMode = true;

      assetNameCtrl.text = existing.assetName;
      platformCtrl.text = existing.websiteName;
      usernameCtrl.text = existing.email;
      recoveryHintCtrl.text = existing.password;
      notesCtrl.text = existing.importantNote;

      selectedCategory = existing.category;
      selectedNominee = existing.nominee;
      notifyListeners();
    }
  }

  // ─────────────────────────────
  // CHANGE DROPDOWNS
  // ─────────────────────────────
  void changeCategory(String value) {
    selectedCategory = value;
    notifyListeners();
  }

  void changeNominee(String? value) {
    selectedNominee = value;
    notifyListeners();
  }

  // ─────────────────────────────
  // SAVE
  // ─────────────────────────────
  Future<bool> saveAsset(String userId) async {
    try {
      AssetModel assetToSave;
      print('ABC isEditMode $isEditMode');
      if (isEditMode) {
        assetToSave = asset!.copyWith(
          assetName: assetNameCtrl.text.trim(),
          category: selectedCategory,
          websiteName: platformCtrl.text.trim(),
          email: usernameCtrl.text.trim(),
          password: recoveryHintCtrl.text.trim(),
          importantNote: notesCtrl.text.trim(),
          nominee: selectedNominee,
        );
        print('ABC Update Mode');
        print('''
Asset Debug:
ID: ${assetToSave.id}
Name: ${assetToSave.assetName}
Category: ${assetToSave.category}
Website: ${assetToSave.websiteName}
Email: ${assetToSave.email}
Password: ${assetToSave.password}
Notes: ${assetToSave.importantNote}
Nominee: ${assetToSave.nominee}
''');

        await _repo.updateAsset(assetToSave, userId);
      } else {
        assetToSave = AssetModel(
          id: asset?.id,
          assetName: assetNameCtrl.text.trim(),
          category: selectedCategory,
          websiteName: platformCtrl.text.trim(),
          email: usernameCtrl.text.trim(),
          password: recoveryHintCtrl.text.trim(),
          importantNote: notesCtrl.text.trim(),
          nominee: selectedNominee,
        );
        print('ABC Create Mode');
        print('''
Asset Debug:
ID: ${assetToSave.id}
Name: ${assetToSave.assetName}
Category: ${assetToSave.category}
Website: ${assetToSave.websiteName}
Email: ${assetToSave.email}
Password: ${assetToSave.password}
Notes: ${assetToSave.importantNote}
Nominee: ${assetToSave.nominee}
''');
        await _repo.createAsset(assetToSave, userId);
      }

      return true;
    } catch (_) {
      return false;
    } finally {
      clearControllers();
    }
  }

  // ─────────────────────────────
  // DELETE
  // ─────────────────────────────
  Future<bool> delete(String userId) async {
    if (asset?.id == null) return false;

    try {
      await _repo.deleteAsset(userId, asset!.id!);
      clearControllers();
      return true;
    } catch (_) {
      return false;
    }
  }

  void clearControllers() {
    assetNameCtrl.clear();
    platformCtrl.clear();
    usernameCtrl.clear();
    recoveryHintCtrl.clear();
    notesCtrl.clear();
    changeCategory('Crypto Wallet');
    selectedNominee=null;
  }

  // ─────────────────────────────
  // DISPOSE ALL CONTROLLERS
  // ─────────────────────────────
  @override
  void dispose() {
    assetNameCtrl.dispose();
    platformCtrl.dispose();
    usernameCtrl.dispose();
    recoveryHintCtrl.dispose();
    notesCtrl.dispose();
    super.dispose();
  }
}
