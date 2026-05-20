import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/asset_model.dart';
import '../../providers/asset_provider.dart';

class AddAssetScreen extends StatefulWidget {
  const AddAssetScreen({super.key});

  @override
  State<AddAssetScreen> createState() => _AddAssetScreenState();
}

class _AddAssetScreenState extends State<AddAssetScreen> {
  final platformCtrl = TextEditingController();
  final categoryCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final notesCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssetProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(title: const Text("Add New Asset")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: platformCtrl,
              decoration: const InputDecoration(labelText: "Platform Name"),
            ),
            TextField(
              controller: categoryCtrl,
              decoration: const InputDecoration(labelText: "Category"),
            ),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: "Email / Username"),
            ),
            TextField(
              controller: notesCtrl,
              maxLines: 3,
              decoration: const InputDecoration(labelText: "Notes"),
            ),
            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {
                final asset = AssetModel(
                  id: DateTime.now().toString(),
                  platformName: platformCtrl.text,
                  category: categoryCtrl.text,
                  email: emailCtrl.text,
                  notes: notesCtrl.text, addedOn: '',
                );

                provider.addAsset(asset);
                Navigator.pop(context);
              },
              child: const Text("Save Asset"),
            )
          ],
        ),
      ),
    );
  }
}