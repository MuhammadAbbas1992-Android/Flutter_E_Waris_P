import 'dart:async';

import 'package:flutter/cupertino.dart';

import '../data/models/asset_model.dart';
import '../data/repositories/asset_repository.dart';
enum AssetStatus { initial, loading, loaded, saving, error }
class AssetProvider extends ChangeNotifier {
  final AssetRepository _repository;

  AssetProvider({AssetRepository? repository})
      : _repository = repository ?? AssetRepository();

  StreamSubscription<List<AssetModel>>? _subscription;

  List<AssetModel> _assets = [];
  AssetStatus _status = AssetStatus.initial;
  String? _errorMessage;

  String? _userId;

  List<AssetModel> get assets => _assets;
  AssetStatus get status => _status;
  String? get errorMessage => _errorMessage;

  bool get isLoading => _status == AssetStatus.loading;

  // ✅ FIXED INIT
  void init(String userId) {
    if (userId.isEmpty) return;
    if (_userId == userId) return;

    _userId = userId;

    _subscription?.cancel();

    _status = AssetStatus.loading;
    notifyListeners();

    _subscription = _repository.getAssets(userId).listen(
          (data) {
        _assets = data;
        _status = AssetStatus.loaded;
        notifyListeners();
      },
      onError: (e) {
        _status = AssetStatus.error;
        _errorMessage = e.toString();
        notifyListeners();
      },
    );
  }

  // ✅ CREATE / UPDATE
  Future<bool> saveAsset(AssetModel asset) async {
    if (_userId == null || _userId!.isEmpty) return false;
    print('ABC save asset1');
    _status = AssetStatus.saving;
    notifyListeners();
    print('ABC save asset1');
    try {
      if (asset.id == null || asset.id!.isEmpty) {
        print('ABC createAsset Called');
        await _repository.createAsset(asset, _userId!);
      } else {
        print('ABC updateAsset Called');
        await _repository.updateAsset(asset, _userId!);
      }
      _status = AssetStatus.loaded; // ✅ IMPORTANT
      notifyListeners();
      return true;
    } catch (e) {
      _status = AssetStatus.error;
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  // ✅ DELETE
  Future<bool> deleteAsset(String assetId) async {
    if (_userId == null) return false;

    try {
      await _repository.deleteAsset(_userId!, assetId);
      return true;
    } catch (e) {
      _errorMessage = e.toString();
      notifyListeners();
      return false;
    }
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}