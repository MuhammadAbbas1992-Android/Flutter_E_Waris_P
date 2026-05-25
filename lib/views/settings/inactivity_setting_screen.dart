import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_models/emergency_provider.dart';

class InactivitySettingScreen extends StatelessWidget {
  const InactivitySettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<EmergencyProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FC),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Inactivity Settings', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Check every', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87)),
              const SizedBox(height: 12),

              // Days Selection List
              Container(
                decoration: BorderRadius.circular(12).asBoxDecoration(Colors.white),
                child: Column(
                  children: [7, 15, 30].map((days) {
                    return RadioListTile<int>(
                      title: Text('$days days'),
                      value: days,
                      groupValue: provider.checkEveryDays,
                      activeColor: const Color(0xFF1E60D9),
                      onChanged: (val) => context.read<EmergencyProvider>().setInactivityDays(val!),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 24),

              // Switch Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Enable inactivity trigger', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(height: 4),
                        Text(
                          "If you don't respond, your nominee will be notified.",
                          style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                  Switch(
                    value: provider.isInactivityTriggerEnabled,
                    activeColor: const Color(0xFF1E60D9),
                    onChanged: (val) => context.read<EmergencyProvider>().toggleInactivityTrigger(val),
                  )
                ],
              ),
              const Spacer(),

              // Information Box Matching Bottom layout
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E60D9).withOpacity(0.06),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFF1E60D9).withOpacity(0.1)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.info_outline, color: Color(0xFF1E60D9), size: 20),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'We will send you a reminder based on the selected period.',
                        style: TextStyle(color: Colors.grey.shade800, fontSize: 13, height: 1.4),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

extension on BorderRadius {
  BoxDecoration asBoxDecoration(Color color) => BoxDecoration(color: color, borderRadius: this);
}