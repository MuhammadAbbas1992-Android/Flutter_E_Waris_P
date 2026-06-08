import 'package:e_waris/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ─── Data ─────────────────────────────────────────────────────────────────────

const List<String> kInactivityOptions = [
  '15 Days',
  '30 Days',
  '60 Days',
  '90 Days',
];

// ─── Bottom Sheet Widget ──────────────────────────────────────────────────────

class NotifyScreen extends StatefulWidget {
  /// The currently selected period (e.g. '30 Days').
  /// Defaults to '30 Days' if not provided.
  final String initialValue;

  const NotifyScreen({
    super.key,
    this.initialValue = '30 Days',
  });

  // ── Static helper to show the sheet ────────────────────────────────────────
  /// Call this from any screen:
  ///
  /// ```dart
  /// NotifyBottomSheet.show(
  ///   context,
  ///   initialValue: _selectedPeriod,
  ///   onSaved: (value) => setState(() => _selectedPeriod = value),
  /// );
  /// ```
  static Future<void> show(
      BuildContext context, {
        String initialValue = '30 Days',
      }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black.withOpacity(0.55),
      builder: (_) => NotifyScreen(
        initialValue: initialValue,
      ),
    );
  }

  @override
  State<NotifyScreen> createState() => _NotifyScreenState();
}

class _NotifyScreenState extends State<NotifyScreen> {
  static const Color _primasryBlue = AppColors.primary;
  static const Color _textDark = Color(0xFF1A1A2E);
  static const Color _textGrey = Color(0xFF8A8FA8);

  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialValue;
  }


  void _save() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('notify_period', _selected);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Notification setting saved")),
      );

      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ── Drag Handle ──
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 42,
              height: 4,
              decoration: BoxDecoration(
                color: const Color(0xFFDDE3F0),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // ── Title ──
          const Text(
            'Choose Inactivity Period',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: _textDark,
            ),
          ),
          const SizedBox(height: 8),

          // ── Subtitle ──
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              'If no activity is detected during this period,\nyour nominee will be notified.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: _textGrey,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 20),

          // ── Options ──
          ...List.generate(kInactivityOptions.length, (index) {
            final option = kInactivityOptions[index];
            final isSelected = _selected == option;
            final isLast = index == kInactivityOptions.length - 1;

            return Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() => _selected = option),
                  behavior: HitTestBehavior.opaque,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Row(
                      children: [
                        // Radio circle
                        Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : const Color(0xFFCDD2E8),
                              width: isSelected ? 0 : 2,
                            ),
                            color: isSelected
                                ? AppColors.primary
                                : Colors.transparent,
                          ),
                          child: isSelected
                              ? const Center(
                            child: Icon(Icons.circle,
                                color: Colors.white, size: 10),
                          )
                              : null,
                        ),
                        const SizedBox(width: 16),

                        // Label
                        Expanded(
                          child: Text(
                            option,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: isSelected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: _textDark,
                            ),
                          ),
                        ),

                        // "Current" badge
                        if (option == widget.initialValue)
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              color: const Color(0xFFEEF2FF),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: const Color(0xFFBDCAF7), width: 1),
                            ),
                            child: const Text(
                              'Current',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primary,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),

                // Divider (not after last item)
                if (!isLast)
                  const Divider(
                    height: 1,
                    thickness: 1,
                    indent: 64,
                    endIndent: 24,
                    color: Color(0xFFF0F2FA),
                  ),
              ],
            );
          }),

          const SizedBox(height: 24),

          // ── Cancel / Save Buttons ──
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                // Cancel
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                            color: AppColors.primary, width: 1.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),

                // Save
                Expanded(
                  child: SizedBox(
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _save, // ✅ SIMPLE VOIDCALLBACK STYLE
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}