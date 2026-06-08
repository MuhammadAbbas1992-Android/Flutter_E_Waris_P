import 'package:flutter/material.dart';

import '../data/models/asset_model.dart';
import '../data/models/nominee_model.dart';
import '../views/widgets/app_icons.dart';

class AssetProvider extends ChangeNotifier {

  List<AssetModel> get _assets => [
  AssetModel(
  name: 'Binance Wallet',
  category: 'Crypto Wallet',
  assignedTo: 'Ali Khan',
  assignedColor: const Color(0xFF3B5BDB),
  icon: BinanceIcon(),
  ),
  AssetModel(
  name: 'Gmail Account',
  category: 'Email Account',
  assignedTo: 'Brother',
  assignedColor: const Color(0xFF3B5BDB),
  icon: GmailIcon(),
  ),
  AssetModel(
  name: 'Hostinger Domain',
  category: 'Domain & Hosting',
  assignedTo: 'Wife',
  assignedColor: const Color(0xFF3B5BDB),
  icon: HostingerIcon(),
  ),
  AssetModel(
  name: 'Facebook Account',
  category: 'Social Media',
  assignedTo: 'Ali Khan',
  assignedColor: const Color(0xFF3B5BDB),
  icon: FacebookIcon(),
  ),
  AssetModel(
  name: 'WhatsApp Account',
  category: 'Messaging',
  assignedTo: 'Brother',
  assignedColor: const Color(0xFF3B5BDB),
  icon: WhatsAppIcon(),
  ),
  ];
  List<AssetModel> get assets => _assets;
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
}