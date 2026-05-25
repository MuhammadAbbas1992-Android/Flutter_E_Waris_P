import 'package:e_waris/views/widgets/custom_input_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/emergency_provider.dart';

class EmergencyMessageScreen extends StatefulWidget {
  const EmergencyMessageScreen({super.key});

  @override
  State<EmergencyMessageScreen> createState() => _EmergencyMessageScreenState();
}

class _EmergencyMessageScreenState extends State<EmergencyMessageScreen> {
  late TextEditingController _messageController;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController(text: context.read<EmergencyProvider>().emergencyMessage);
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
        title: const Text('Emergency Message', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18)),
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
                    CustomInputField(
                      label: 'Write a message for your loved ones (optional)',
                      hintText: 'Type your message...',
                      controller: _messageController,
                      maxLines: 8,
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
                    context.read<EmergencyProvider>().updateEmergencyMessage(_messageController.text);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Message successfully saved.')));
                  },
                  child: const Text('Save Message', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}