import 'package:flutter/material.dart';

import '../data/models/asset_model.dart';
import '../data/models/nominee_model.dart';

class AssetProvider extends ChangeNotifier {
  List<AssetModel> _assets = [];
  List<NomineeModel> _nominees = [];

  List<AssetModel> get assets => _assets;
  List<NomineeModel> get nominees => _nominees;

  AssetModel? _selectedAsset;
  AssetModel? get selectedAsset => _selectedAsset;

  void addAsset(AssetModel asset) {
    _assets.add(asset);
    notifyListeners();
  }

  void setSelectedAsset(AssetModel asset) {
    _selectedAsset = asset;
    notifyListeners();
  }

  void addNominee(NomineeModel nominee) {
    _nominees.add(nominee);
    notifyListeners();
  }

  void removeNominee(String id) {
    _nominees.removeWhere((e) => e.id == id);
    notifyListeners();
  }
}