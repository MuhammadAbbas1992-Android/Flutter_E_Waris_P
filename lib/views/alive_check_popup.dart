import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_models/emergency_provider.dart';

class AliveCheckPopup extends StatelessWidget {
  const AliveCheckPopup({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) => const AliveCheckPopup(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      backgroundColor: Colors.white,
      child: Stack(
        children: [
          // Close Icon Button
          Positioned(
            right: 12,
            top: 12,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.grey),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Heart Pulse Icon UI Wrapper
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E60D9).withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.favorite, // Customize with custom SVG pulse asset if needed
                    color: Color(0xFF1E60D9),
                    size: 44,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Are you okay?',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
                const SizedBox(height: 8),
                Text(
                  'Please confirm that you are active.',
                  style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 28),

                // Primary Action Button
                SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E60D9),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      context.read<EmergencyProvider>().handleAliveCheckConfirmation();
                      Navigator.pop(context);
                    },
                    child: const Text("Yes, I'm active", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(height: 12),

                // Remind Me Later Button
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    'Remind me later',
                    style: TextStyle(color: Color(0xFF1E60D9), fontWeight: FontWeight.w600, fontSize: 14),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}