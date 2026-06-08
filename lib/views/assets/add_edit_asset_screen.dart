import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class AddEditAssetScreen extends StatefulWidget {
  const AddEditAssetScreen({super.key});

  @override
  State<AddEditAssetScreen> createState() => _AddEditAssetScreenState();
}

class _AddEditAssetScreenState extends State<AddEditAssetScreen> {
  final _assetNameController = TextEditingController();
  final _platformController = TextEditingController();
  final _usernameController = TextEditingController();
  final _recoveryHintController = TextEditingController();
  final _notesController = TextEditingController();

  String _selectedCategory = 'Crypto Wallet';
  String? _selectedNominee;
  String _importanceLevel = 'High';
  bool _isSensitive = true;

  final List<String> _categories = [
    'Crypto Wallet',
    'Bank Account',
    'Email Account',
    'Social Media',
    'Investment',
    'Insurance',
    'Other',
  ];

  final List<String> _nominees = ['John Doe', 'Jane Doe', 'Ali Hassan'];

  @override
  void dispose() {
    _assetNameController.dispose();
    _platformController.dispose();
    _usernameController.dispose();
    _recoveryHintController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  // ─────────────────────────────────────────────
  //  BUILD
  // ─────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECEFF8),
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSecurityBanner(),
            const SizedBox(height: 20),

            // 1. Asset Name
            _buildLabel('1. Asset Name', required: true),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _assetNameController,
              hint: 'e.g. Binance Wallet',
              icon: Icons.account_balance_wallet_rounded,
              iconColor: const Color(0xFF3B5BDB),
              iconBg: const Color(0xFFEEF2FF),
            ),
            const SizedBox(height: 18),

            // 2. Category
            _buildLabel('2. Category', required: true),
            const SizedBox(height: 8),
            _buildCategoryDropdown(),
            const SizedBox(height: 18),

            // 3 & 4. Platform + Username
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('3. Platform / Website'),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _platformController,
                        hint: 'e.g. binance.com',
                        icon: Icons.language_rounded,
                        iconColor: const Color(0xFF2ECC71),
                        iconBg: const Color(0xFFE8F8F0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('4. Username / Email'),
                      const SizedBox(height: 8),
                      _buildTextField(
                        controller: _usernameController,
                        hint: 'e.g. hamza@gmail.com',
                        icon: Icons.person_rounded,
                        iconColor: const Color(0xFF3B5BDB),
                        iconBg: const Color(0xFFEEF2FF),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),

            // 5. Recovery Hint
            _buildLabel('5. Recovery Hint', required: true),
            const SizedBox(height: 8),
            _buildTextField(
              controller: _recoveryHintController,
              hint:
                  'e.g. Password diary me hai / Recovery email brother ke paas hai',
              icon: Icons.key_rounded,
              iconColor: const Color(0xFFF39C12),
              iconBg: const Color(0xFFFEF9EE),
            ),
            const SizedBox(height: 18),

            // 6. Important Notes
            _buildLabel('6. Important Notes'),
            const SizedBox(height: 8),
            _buildNotesField(),
            const SizedBox(height: 18),

            // 7. Importance Level
            /*_buildLabel('7. Importance Level'),
            const SizedBox(height: 10),
            _buildImportanceLevelSelector(),*/
            //const SizedBox(height: 18),

            // 8 & 9. Nominee + Sensitive
            _buildLabel('8. Assign to Nominee'),
            const SizedBox(height: 8),
            _buildNomineeDropdown(),
            const SizedBox(height: 12),
            /*Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('8. Assign to Nominee'),
                      const SizedBox(height: 8),
                      _buildNomineeDropdown(),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildLabel('9. Mark as Sensitive'),
                      const SizedBox(height: 8),
                      _buildSensitiveToggle(),
                    ],
                  ),
                ),
              ],
            ),*/
            const SizedBox(height: 18),

            // 10. Attach File
            /* _buildAttachFile(),
            const SizedBox(height: 28),*/

            // Save Button
            _buildSaveButton(),
            const SizedBox(height: 14),
            _buildBottomNote(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  APP BAR
  // ─────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFFECEFF8),
      elevation: 0,
      leading: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      title: const Text(
        'Add New Asset',
        style: TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w700,
          fontSize: 18,
        ),
      ),
      centerTitle: true,
      actions: [
        Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2FF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.shield_rounded,
            color: AppColors.primary,
            size: 22,
          ),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  SECURITY BANNER
  // ─────────────────────────────────────────────
  Widget _buildSecurityBanner() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.lock_rounded,
              color: Color(0xFF3B5BDB),
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your information is encrypted and kept secure.',
                  style: TextStyle(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  'Only your trusted nominee can access it when needed.',
                  style: TextStyle(color: Colors.black54, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  LABEL
  // ─────────────────────────────────────────────
  Widget _buildLabel(String text, {bool required = false}) {
    return RichText(
      text: TextSpan(
        text: text,
        style: const TextStyle(
          color: Colors.black87,
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
        children: required
            ? const [
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Color(0xFFE74C3C)),
                ),
              ]
            : [],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  TEXT FIELD
  // ─────────────────────────────────────────────
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
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 4,
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  CATEGORY DROPDOWN
  // ─────────────────────────────────────────────
  Widget _buildCategoryDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedCategory,
          isExpanded: true,
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black54,
          ),
          items: _categories.map((cat) {
            return DropdownMenuItem<String>(
              value: cat,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.grid_view_rounded,
                      color: Color(0xFF3B5BDB),
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    cat,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
          onChanged: (val) => setState(() => _selectedCategory = val!),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  NOTES FIELD
  // ─────────────────────────────────────────────
  Widget _buildNotesField() {
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
        controller: _notesController,
        maxLines: 4,
        maxLength: 300,
        onChanged: (_) => setState(() {}),
        style: const TextStyle(fontSize: 13, color: Colors.black87),
        decoration: InputDecoration(
          hintText:
              'Is account ke bare mein koi important information ya instructions...',
          hintStyle: const TextStyle(color: Colors.black38, fontSize: 13),
          prefixIcon: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: const Color(0xFFFFF8E7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.sticky_note_2_rounded,
                color: Color(0xFFF39C12),
                size: 16,
              ),
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
            borderSide: const BorderSide(color: Color(0xFF3B5BDB), width: 1.5),
          ),
          filled: true,
          fillColor: Colors.white,
          counterStyle: const TextStyle(color: Colors.black38, fontSize: 12),
          contentPadding: const EdgeInsets.fromLTRB(4, 14, 14, 10),
          alignLabelWithHint: true,
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  IMPORTANCE LEVEL
  // ─────────────────────────────────────────────
  Widget _buildImportanceLevelSelector() {
    return Row(
      children: [
        _importanceButton(
          label: 'Low',
          dotColor: const Color(0xFF3B5BDB),
          selectedBg: const Color(0xFFEEF2FF),
        ),
        const SizedBox(width: 10),
        _importanceButton(
          label: 'Medium',
          dotColor: const Color(0xFFF39C12),
          selectedBg: const Color(0xFFFEF9EE),
        ),
        const SizedBox(width: 10),
        _importanceButton(
          label: 'High',
          dotColor: const Color(0xFFE74C3C),
          selectedBg: const Color(0xFFFFF0EE),
        ),
      ],
    );
  }

  Widget _importanceButton({
    required String label,
    required Color dotColor,
    required Color selectedBg,
  }) {
    final bool isSelected = _importanceLevel == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _importanceLevel = label),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? selectedBg : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected
                  ? dotColor.withOpacity(0.5)
                  : Colors.transparent,
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 9,
                height: 9,
                decoration: BoxDecoration(
                  color: dotColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? dotColor : Colors.black54,
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  NOMINEE DROPDOWN
  // ─────────────────────────────────────────────
  Widget _buildNomineeDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
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
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedNominee,
          isExpanded: true,
          hint: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEF2FF),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  Icons.people_alt_rounded,
                  color: Color(0xFF3B5BDB),
                  size: 15,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Select Nominee',
                style: TextStyle(color: Colors.black38, fontSize: 13),
              ),
            ],
          ),
          icon: const Icon(
            Icons.keyboard_arrow_down_rounded,
            color: Colors.black38,
            size: 20,
          ),
          items: _nominees.map((nominee) {
            return DropdownMenuItem<String>(
              value: nominee,
              child: Text(nominee, style: const TextStyle(fontSize: 13)),
            );
          }).toList(),
          onChanged: (val) => setState(() => _selectedNominee = val),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  SENSITIVE TOGGLE
  // ─────────────────────────────────────────────
  Widget _buildSensitiveToggle() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: const Color(0xFFFFF0EE),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.shield_rounded,
              color: Color(0xFFE74C3C),
              size: 15,
            ),
          ),
          const SizedBox(width: 8),
          const Expanded(
            child: Text(
              'Sensitive Asset',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch(
              value: _isSensitive,
              onChanged: (val) => setState(() => _isSensitive = val),
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFF3B5BDB),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  ATTACH FILE
  // ─────────────────────────────────────────────
  Widget _buildAttachFile() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF2FF),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(
              Icons.attach_file_rounded,
              color: Color(0xFF3B5BDB),
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '10. Attach File',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: 4),
                    Text(
                      '(Optional)',
                      style: TextStyle(fontSize: 12, color: Colors.black45),
                    ),
                  ],
                ),
                SizedBox(height: 2),
                Text(
                  'Upload documents, screenshots, or any relevant files',
                  style: TextStyle(fontSize: 11, color: Colors.black38),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton.icon(
            onPressed: _onAttachFileTapped,
            icon: const Icon(Icons.upload_rounded, size: 15),
            label: const Text('Upload', style: TextStyle(fontSize: 12)),
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF3B5BDB),
              side: const BorderSide(color: Color(0xFF3B5BDB)),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  SAVE BUTTON
  // ─────────────────────────────────────────────
  Widget _buildSaveButton() {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton.icon(
        onPressed: _onSaveAssetTapped,
        icon: const Icon(Icons.lock_rounded, color: Colors.white, size: 18),
        label: const Text(
          'Save Asset',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 3,
          shadowColor: const Color(0xFF3B5BDB).withOpacity(0.4),
        ),
      ),
    );
  }

  // ─────────────────────────────────────────────
  //  BOTTOM NOTE
  // ─────────────────────────────────────────────
  Widget _buildBottomNote() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.shield_outlined, color: Colors.black38, size: 14),
        SizedBox(width: 5),
        Text(
          'You can edit or delete this asset anytime.',
          style: TextStyle(color: Colors.black45, fontSize: 12),
        ),
      ],
    );
  }

  // ─────────────────────────────────────────────
  //  ACTIONS
  // ─────────────────────────────────────────────
  void _onSaveAssetTapped() {
    // TODO: Implement save logic
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Asset saved successfully!'),
        backgroundColor: const Color(0xFF3B5BDB),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  void _onAttachFileTapped() {
    // TODO: Implement file picker logic (e.g. file_picker package)
  }
}
