// add_nominee_hamza.dart

import 'package:e_waris/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddNomineeScreen extends StatefulWidget {
  const AddNomineeScreen({super.key});

  @override
  State<AddNomineeScreen> createState() => _AddNomineeScreenState();
}

class _AddNomineeScreenState extends State<AddNomineeScreen> {
  // ─── Controllers ───────────────────────────────────────────
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  // ─── State Variables ────────────────────────────────────────
  String? _selectedRelationship;

  final List<String> _relationships = [
    'Spouse',
    'Parent',
    'Child',
    'Sibling',
    'Friend',
    'Business Partner',
    'Other',
  ];

  // ─── Theme Color ────────────────────────────────────────────
  static const Color _primaryBlue = AppColors.primary;
  static const Color _lightBlueBg = Color(0xFFEEF2FF);
  static const Color _bgColor = Color(0xFFECEFF8);

  // ─── Dispose ────────────────────────────────────────────────
  @override
  void dispose() {
    _fullNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  // ───────────────────────────────────────────────────────────
  //  BUILD
  // ───────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Info Banner ──
            _buildInfoBanner(),
            const SizedBox(height: 26),

            // ── Full Name ──
            _buildLabel('Full Name', required: true),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _fullNameController,
              hint: 'Enter full name',
              icon: Icons.person_outline_rounded,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
            ),
            _buildHelperText("Enter nominee's full name"),
            const SizedBox(height: 22),

            // ── Email Address ──
            _buildLabel('Email Address', required: true),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _emailController,
              hint: 'Enter email address',
              icon: Icons.mail_outline_rounded,
              keyboardType: TextInputType.emailAddress,
            ),
            _buildHelperText('Notifications will be sent to this email'),
            const SizedBox(height: 22),

            // ── Phone Number ──
            _buildLabel('Phone Number', required: true),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _phoneController,
              hint: 'Enter phone number',
              icon: Icons.phone_outlined,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.allow(RegExp(r'[0-9+\s]')),
              ],
            ),
            _buildHelperText('Include country code (e.g. +92 300 1234567)'),
            const SizedBox(height: 22),

            // ── Relationship ──
            _buildLabel('Relationship', required: true),
            const SizedBox(height: 8),
            _buildRelationshipDropdown(),
            _buildHelperText('Select how this person is related to you'),
            const SizedBox(height: 26),

            // ── Privacy Note ──
            _buildPrivacyNote(),
            const SizedBox(height: 28),

            // ── Save Button ──
            _buildSaveButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  //  APP BAR
  // ───────────────────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: _bgColor,
      elevation: 0,
      leadingWidth: 56,
      leading: Padding(
        padding: const EdgeInsets.only(left: 14),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black87,
              size: 20,
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
      ),
      title: const Text(
        'Add Nominee',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: _primaryBlue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.shield_rounded,
              color: Colors.white,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }

  // ───────────────────────────────────────────────────────────
  //  INFO BANNER
  // ───────────────────────────────────────────────────────────
  Widget _buildInfoBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: _lightBlueBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Shield icon circle
          Container(
            width: 52,
            height: 52,
            decoration: const BoxDecoration(
              color: _primaryBlue,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.shield_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add a Trusted Contact',
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'This person will be notified and can access your digital assets if you become inactive.',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  //  LABEL
  // ───────────────────────────────────────────────────────────
  Widget _buildLabel(String text, {bool required = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
        children: required
            ? const [
          TextSpan(
            text: ' *',
            style: TextStyle(
              color: Color(0xFFE74C3C),
              fontWeight: FontWeight.w700,
            ),
          ),
        ]
            : [],
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  //  HELPER TEXT (below field)
  // ───────────────────────────────────────────────────────────
  Widget _buildHelperText(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, left: 2),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black45,
          fontSize: 12,
        ),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  //  TEXT FIELD
  // ───────────────────────────────────────────────────────────
  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    TextCapitalization textCapitalization = TextCapitalization.none,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8ECF4), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        textCapitalization: textCapitalization,
        inputFormatters: inputFormatters,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.black38,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _lightBlueBg,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: _primaryBlue, size: 18),
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 0,
            minHeight: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              color: _primaryBlue,
              width: 1.5,
            ),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 4,
          ),
        ),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  //  RELATIONSHIP DROPDOWN
  // ───────────────────────────────────────────────────────────
  Widget _buildRelationshipDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFE8ECF4), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedRelationship,
          isExpanded: true,
          hint: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _lightBlueBg,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.people_alt_rounded,
                  color: _primaryBlue,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Select relationship',
                style: TextStyle(
                  color: Colors.black38,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black54,
            size: 24,
          ),
          borderRadius: BorderRadius.circular(14),
          items: _relationships.map((String relation) {
            return DropdownMenuItem<String>(
              value: relation,
              child: Text(
                relation,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? val) {
            setState(() => _selectedRelationship = val);
          },
        ),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  //  PRIVACY NOTE
  // ───────────────────────────────────────────────────────────
  Widget _buildPrivacyNote() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF6EE),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFF5E6D0),
          width: 1,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFFEEDD8),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.lock_rounded,
              color: Color(0xFFE8972A),
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Your nominee's information is kept secure and private.",
                  style: TextStyle(
                    color: Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
                SizedBox(height: 3),
                Text(
                  'They will only be notified if you become inactive.',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  //  SAVE BUTTON
  // ───────────────────────────────────────────────────────────
  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton.icon(
        onPressed: _onSaveNomineeTapped,
        icon: const Icon(
          Icons.save_rounded,
          color: Colors.white,
          size: 20,
        ),
        label: const Text(
          'Save Nominee',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
            letterSpacing: 0.3,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
          shadowColor: _primaryBlue.withOpacity(0.4),
        ),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  //  ACTIONS
  // ───────────────────────────────────────────────────────────
  void _onSaveNomineeTapped() {
    // Basic Validation
    if (_fullNameController.text.trim().isEmpty) {
      _showSnackBar("Please enter nominee's full name", isError: true);
      return;
    }
    if (_emailController.text.trim().isEmpty) {
      _showSnackBar('Please enter email address', isError: true);
      return;
    }
    if (_phoneController.text.trim().isEmpty) {
      _showSnackBar('Please enter phone number', isError: true);
      return;
    }
    if (_selectedRelationship == null) {
      _showSnackBar('Please select a relationship', isError: true);
      return;
    }

    // TODO: Implement actual save logic (API call, local DB, etc.)
    _showSnackBar('Nominee saved successfully!', isError: false);
  }

  void _showSnackBar(String message, {required bool isError}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              isError ? Icons.error_outline_rounded : Icons.check_circle_outline_rounded,
              color: Colors.white,
              size: 18,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: isError ? const Color(0xFFE74C3C) : _primaryBlue,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        duration: const Duration(seconds: 3),
      ),
    );
  }
}