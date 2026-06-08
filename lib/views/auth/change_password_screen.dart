import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  static const Color _primaryBlue = Color(0xFF3B5BDB);
  static const Color _bgColor = Color(0xFFF4F6FB);
  static const Color _textDark = Color(0xFF1A1A2E);
  static const Color _textGrey = Color(0xFF8A8FA8);

  final _currentPassCtrl = TextEditingController();
  final _newPassCtrl = TextEditingController();
  final _confirmPassCtrl = TextEditingController();

  bool _showCurrent = false;
  bool _showNew = false;
  bool _showConfirm = false;

  // 0 = none, 1 = weak, 2 = fair, 3 = strong, 4 = very strong
  int _strengthLevel = 0;
  String _strengthLabel = '';
  Color _strengthColor = Colors.transparent;

  @override
  void initState() {
    super.initState();
    _newPassCtrl.addListener(_evaluateStrength);
  }

  @override
  void dispose() {
    _currentPassCtrl.dispose();
    _newPassCtrl.dispose();
    _confirmPassCtrl.dispose();
    super.dispose();
  }

  void _evaluateStrength() {
    final pass = _newPassCtrl.text;
    if (pass.isEmpty) {
      setState(() {
        _strengthLevel = 0;
        _strengthLabel = '';
        _strengthColor = Colors.transparent;
      });
      return;
    }

    int score = 0;
    if (pass.length >= 8) score++;
    if (RegExp(r'[A-Z]').hasMatch(pass)) score++;
    if (RegExp(r'[0-9]').hasMatch(pass)) score++;
    if (RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(pass)) score++;

    setState(() {
      _strengthLevel = score;
      if (score <= 1) {
        _strengthLabel = 'Weak';
        _strengthColor = Colors.red;
      } else if (score == 2) {
        _strengthLabel = 'Fair';
        _strengthColor = Colors.orange;
      } else if (score == 3) {
        _strengthLabel = 'Strong';
        _strengthColor = Colors.green;
      } else {
        _strengthLabel = 'Very Strong';
        _strengthColor = const Color(0xFF2DB87C);
      }
    });
  }

  void _handleUpdate() {
    final current = _currentPassCtrl.text.trim();
    final newPass = _newPassCtrl.text.trim();
    final confirm = _confirmPassCtrl.text.trim();

    if (current.isEmpty || newPass.isEmpty || confirm.isEmpty) {
      _showSnack('Please fill all fields.', isError: true);
      return;
    }
    if (newPass != confirm) {
      _showSnack('New passwords do not match.', isError: true);
      return;
    }
    if (_strengthLevel < 2) {
      _showSnack('Password is too weak.', isError: true);
      return;
    }
    _showSnack('Password updated successfully!');
  }

  void _showSnack(String msg, {bool isError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: isError ? Colors.red : const Color(0xFF2DB87C),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Column(
          children: [
            // ── App Bar ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          color: _textDark, size: 24),
                    ),
                  ),
                  const Text(
                    'Change Password',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: _textDark,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // ── Shield Icon + Subtitle ──
                    Center(
                      child: Column(
                        children: [
                          Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE6F9EE),
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.verified_user_outlined,
                                color: Color(0xFF2DB87C), size: 34),
                          ),
                          const SizedBox(height: 14),
                          const Text(
                            'For your security, please use\na strong password.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 14,
                              color: _textGrey,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // ── Current Password ──
                    _FieldLabel(label: 'Current Password'),
                    const SizedBox(height: 8),
                    _PasswordField(
                      controller: _currentPassCtrl,
                      hint: 'Enter current password',
                      obscure: !_showCurrent,
                      onToggle: () =>
                          setState(() => _showCurrent = !_showCurrent),
                    ),
                    const SizedBox(height: 20),

                    // ── New Password ──
                    _FieldLabel(label: 'New Password'),
                    const SizedBox(height: 8),
                    _PasswordField(
                      controller: _newPassCtrl,
                      hint: 'Enter new password',
                      obscure: !_showNew,
                      onToggle: () => setState(() => _showNew = !_showNew),
                    ),
                    const SizedBox(height: 10),

                    // ── Strength Bar ──
                    if (_strengthLevel > 0) ...[
                      Row(
                        children: List.generate(4, (i) {
                          final filled = i < _strengthLevel;
                          return Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: i < 3 ? 6 : 0),
                              height: 5,
                              decoration: BoxDecoration(
                                color: filled
                                    ? _strengthColor
                                    : const Color(0xFFDDE3F0),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        children: [
                          const Text(
                            'Password strength: ',
                            style:
                            TextStyle(fontSize: 12, color: _textGrey),
                          ),
                          Text(
                            _strengthLabel,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: _strengthColor,
                            ),
                          ),
                        ],
                      ),
                    ] else ...[
                      Row(
                        children: List.generate(4, (i) {
                          return Expanded(
                            child: Container(
                              margin: EdgeInsets.only(right: i < 3 ? 6 : 0),
                              height: 5,
                              decoration: BoxDecoration(
                                color: const Color(0xFFDDE3F0),
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Password strength: ',
                        style: TextStyle(fontSize: 12, color: _textGrey),
                      ),
                    ],
                    const SizedBox(height: 20),

                    // ── Confirm Password ──
                    _FieldLabel(label: 'Confirm New Password'),
                    const SizedBox(height: 8),
                    _PasswordField(
                      controller: _confirmPassCtrl,
                      hint: 'Confirm new password',
                      obscure: !_showConfirm,
                      onToggle: () =>
                          setState(() => _showConfirm = !_showConfirm),
                    ),
                    const SizedBox(height: 20),

                    // ── Requirements Box ──
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF2FF),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(Icons.info_outline,
                                  size: 16, color: _primaryBlue),
                              SizedBox(width: 6),
                              Text(
                                'Password must contain:',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: _primaryBlue,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          _Requirement(text: 'At least 8 characters'),
                          _Requirement(text: 'One uppercase letter'),
                          _Requirement(text: 'One number or special character'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // ── Update Button ──
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _handleUpdate,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          'Update Password',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Field Label ──────────────────────────────────────────────────────────────

class _FieldLabel extends StatelessWidget {
  final String label;
  const _FieldLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color(0xFF1A1A2E),
      ),
    );
  }
}

// ─── Password Field ───────────────────────────────────────────────────────────

class _PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  final VoidCallback onToggle;

  const _PasswordField({
    required this.controller,
    required this.hint,
    required this.obscure,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(fontSize: 14, color: Color(0xFF1A1A2E)),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Color(0xFFB0B5C8), fontSize: 14),
        prefixIcon: const Icon(Icons.lock_outline,
            color: Color(0xFF8A8FA8), size: 20),
        suffixIcon: GestureDetector(
          onTap: onToggle,
          child: Icon(
            obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: const Color(0xFF8A8FA8),
            size: 20,
          ),
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE8EDFB)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFFE8EDFB)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide:
          const BorderSide(color: Color(0xFF3B5BDB), width: 1.5),
        ),
      ),
    );
  }
}

// ─── Requirement Row ──────────────────────────────────────────────────────────

class _Requirement extends StatelessWidget {
  final String text;
  const _Requirement({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          const SizedBox(width: 4),
          const Text('• ',
              style: TextStyle(color: Color(0xFF3B5BDB), fontSize: 13)),
          Text(text,
              style:
              const TextStyle(fontSize: 13, color: Color(0xFF5A6080))),
        ],
      ),
    );
  }
}