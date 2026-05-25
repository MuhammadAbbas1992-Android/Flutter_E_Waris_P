import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/asset_provider.dart';

class AssetDetailScreen extends StatelessWidget {
  const AssetDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssetProvider>(context);
    final asset = provider.selectedAsset;

    if (asset == null) {
      return const Scaffold(
        body: Center(child: Text("No Asset Selected")),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text("Asset Detail")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Platform: ${asset.platformName}",
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text("Category: ${asset.category}"),
                Text("Email: ${asset.email}"),
                const SizedBox(height: 10),
                Text("Notes: ${asset.notes}"),
                const SizedBox(height: 20),

                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text("Edit"),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text("Delete"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}