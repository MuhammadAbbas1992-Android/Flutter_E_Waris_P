// add_nominee_hamza.dart

import 'package:e_waris/core/constants/app_colors.dart';
import 'package:e_waris/data/models/nominee_model.dart';
import 'package:e_waris/view_models/nominee_provider.dart';
import 'package:e_waris/views/widgets/custom_button1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../core/utils/app_utils.dart';
import '../../view_models/add_edit_nominee_provider.dart';

class AddEditNomineeScreen extends StatefulWidget {
  const AddEditNomineeScreen({super.key});

  @override
  State<AddEditNomineeScreen> createState() => _AddNomineeScreenState();
}

class _AddNomineeScreenState extends State<AddEditNomineeScreen> {
  late AddEditNomineeProvider addEditNomineeProvider;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final nomineeProvider = context.read< NomineeProvider>();
      final nomineeId = ModalRoute.of(context)!.settings.arguments as String?;

      NomineeModel? existing;

      if (nomineeId != null) {
        existing = nomineeProvider.nominees.firstWhere((e) => e.id == nomineeId);
      }

      addEditNomineeProvider = context.read<AddEditNomineeProvider>();
      addEditNomineeProvider.init(existing);
    });
  }


  // ───────────────────────────────────────────────────────────
  //  BUILD
  // ───────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    addEditNomineeProvider = context.watch<AddEditNomineeProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFFECEFF8),
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
              controller: addEditNomineeProvider.fullNameCtrl,
              hint: 'Enter full name',
              icon: Icons.person_outline_rounded,
              iconColor: const Color(0xFF3B5BDB),
              iconBg: const Color(0xFFEEF2FF),
            ),
            _buildHelperText("Enter nominee's full name"),
            const SizedBox(height: 22),

            // ── Email Address ──
            _buildLabel('Email Address', required: true),
            const SizedBox(height: 8),
            _buildTextField(
              controller: addEditNomineeProvider.emailCtrl,
              hint: 'Enter email address',
              icon: Icons.mail_outline_rounded,
              iconColor: const Color(0xFF3B5BDB),
              iconBg: const Color(0xFFEEF2FF),
            ),
            _buildHelperText('Notifications will be sent to this email'),
            const SizedBox(height: 22),

            // ── Phone Number ──
            _buildLabel('Phone Number', required: true),
            const SizedBox(height: 8),
            _buildTextField(
              controller:addEditNomineeProvider.phoneCtrl,
              hint: 'Enter phone number',
              icon: Icons.phone_outlined,
              iconColor: const Color(0xFF3B5BDB),
              iconBg: const Color(0xFFEEF2FF),
            ),
            _buildHelperText('Include country code (e.g. +92 300 1234567)'),
            const SizedBox(height: 22),

            // ── Relationship ──
            _buildLabel('Relationship', required: true),
            const SizedBox(height: 8),
            _buildRelationshipDropdown(provider: addEditNomineeProvider),
            _buildHelperText('Select how this person is related to you'),
            const SizedBox(height: 26),

            // ── Privacy Note ──
            _buildPrivacyNote(),
            const SizedBox(height: 28),

            // ── Save Button ──
            CustomButton1(btnText: 'Save Nominee', onPressed: () async{
              final ok = await addEditNomineeProvider.saveNominee(AppUtils.userId);
              if (!context.mounted) return;
              if (ok) { Navigator.pop(context);
              AppUtils.showSnack(context: context, msg:'Nominee saved successfully' );}

            },),

            const SizedBox(height: 14),
            // DELETE
            if (addEditNomineeProvider.isEditMode)
              CustomButton1(
                btnText: 'Delete Nominee',
                backgroundColor: AppColors.red.withOpacity(0.8),
                onPressed: () async {
                  final ok = await addEditNomineeProvider.deleteNominee(AppUtils.userId);
                  if (!context.mounted) return;
                  if (ok) {
                    Navigator.pop(context);
                    AppUtils.showSnack(
                      context: context,
                      msg: 'Nominee deleted successfully',
                    );
                  }
                },
              ),
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
      backgroundColor: const Color(0xFFECEFF8),
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
              color: AppColors.primary,
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
        color: Colors.white,
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
              color: const Color(0xFFEEF2FF),
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
    required Color iconColor,
    required Color iconBg,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(fontSize: 13, color: Colors.black87),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: iconColor, size: 16),
            ),
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
            borderSide: const BorderSide(color: Color(0xFF3B5BDB), width: 1.5),
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 14, horizontal: 4),
        ),
      ),
    );
  }

  // ───────────────────────────────────────────────────────────
  //  RELATIONSHIP DROPDOWN
  // ───────────────────────────────────────────────────────────
  Widget _buildRelationshipDropdown({required AddEditNomineeProvider provider}) {
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
          value:provider.selectedRelationship,
          isExpanded: true,
          hint: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.people_alt_rounded,
                  color: AppColors.primary,
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
          items: provider.relationships.map((String relation) {
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
          onChanged: (val) => provider.changeRelationship(val!),)
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

}