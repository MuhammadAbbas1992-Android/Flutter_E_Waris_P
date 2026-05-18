import 'package:e_waris/providers/emergency_provider.dart';
import 'package:e_waris/views/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddNomineeScreen extends StatefulWidget {
  const AddNomineeScreen({super.key});

  @override
  State<AddNomineeScreen> createState() => _AddNomineeScreenState();
}

class _AddNomineeScreenState extends State<AddNomineeScreen> {
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneController;
  String _selectedRelationship = 'Sister';

  final List<String> _relationships = ['Sister', 'Brother', 'Parent', 'Spouse', 'Child', 'Friend'];

  @override
  void initState() {
    super.initState();
    final provider = context.read<EmergencyProvider>();
    _nameController = TextEditingController(text: provider.fullName);
    _emailController = TextEditingController(text: provider.emailAddress);
    _phoneController = TextEditingController(text: provider.phoneNumber);
    _selectedRelationship = provider.relationship;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Add Nominee', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomInputField(label: 'Full Name', hintText: 'e.g. Ayesha Khan', controller: _nameController),
                    CustomInputField(label: 'Email Address', hintText: 'e.g. ayesha@email.com', controller: _emailController, keyboardType: TextInputType.emailAddress),
                    CustomInputField(label: 'Phone Number', hintText: 'e.g. +92 300 1234567', controller: _phoneController, keyboardType: TextInputType.phone),

                    const Text('Relationship', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black87)),
                    const SizedBox(height: 8),
                    DropdownButtonFormField<String>(
                      value: _selectedRelationship,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade50,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.shade200)),
                      ),
                      items: _relationships.map((r) => DropdownMenuItem(value: r, child: Text(r))).toList(),
                      onChanged: (val) => setState(() => _selectedRelationship = val!),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E60D9),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: () {
                    context.read<EmergencyProvider>().updateNominee(
                      name: _nameController.text,
                      email: _emailController.text,
                      phone: _phoneController.text,
                      relationship: _selectedRelationship,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Nominee successfully saved.')));
                  },
                  child: const Text('Save Nominee', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}