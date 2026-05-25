import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/models/nominee_model.dart';
import '../../view_models/asset_provider.dart';

class NomineeListScreen extends StatelessWidget {
  const NomineeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AssetProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Nominees List")),
      body: Column(
        children: [
          Expanded(
            child: provider.nominees.isEmpty
                ? const Center(child: Text("No nominees added"))
                : ListView.builder(
              itemCount: provider.nominees.length,
              itemBuilder: (context, index) {
                final nominee = provider.nominees[index];

                return ListTile(
                  leading: CircleAvatar(
                    child: Text(nominee.name[0]),
                  ),
                  title: Text(nominee.name),
                  subtitle: Text(nominee.email),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      provider.removeNominee(nominee.id!);
                    },
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(12),
            child: ElevatedButton(
              onPressed: () {
                provider.addNominee(
                  NomineeModel(
                    id: DateTime.now().toString(),
                    name: "Ayesha Khan",
                    email: "ayesha@email.com",
                    phone: "+92 300 1234567",
                    relation: '',
                  ),
                );
              },
              child: const Text("Add Nominee"),
            ),
          )
        ],
      ),
    );
  }
}