import 'package:e_waris/views/widgets/custom_button1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../core/utils/app_utils.dart';
import '../../data/models/asset_model.dart';
import '../../view_models/add_edit_asset_provider.dart';
import '../../view_models/asset_provider.dart';

class AddEditAssetScreen extends StatefulWidget {
  const AddEditAssetScreen({super.key});

  @override
  State<AddEditAssetScreen> createState() => _AddEditAssetScreenState();
}

class _AddEditAssetScreenState extends State<AddEditAssetScreen> {
  late AddEditAssetProvider addEditAssetProvider;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final assetProvider = context.read<AssetProvider>();
      final assetId = ModalRoute.of(context)!.settings.arguments as String?;

      AssetModel? existing;

      if (assetId != null) {
        existing = assetProvider.assets.firstWhere((e) => e.id == assetId);
      }

      addEditAssetProvider = context.read<AddEditAssetProvider>();
      addEditAssetProvider.init(existing);
    });
  }

  @override
  Widget build(BuildContext context) {
    addEditAssetProvider = context.watch<AddEditAssetProvider>();

    return Scaffold(
      backgroundColor: const Color(0xFFECEFF8),
      appBar: _buildAppBar(onPressed: () => Navigator.pop(context)),
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
              controller: addEditAssetProvider.assetNameCtrl,
              hint: 'e.g. Binance Wallet',
              icon: Icons.account_balance_wallet_rounded,
              iconColor: const Color(0xFF3B5BDB),
              iconBg: const Color(0xFFEEF2FF),
            ),
            const SizedBox(height: 18),

            // 2. Category
            _buildLabel('2. Category', required: true),
            const SizedBox(height: 8),
            _buildCategoryDropdown(provider: addEditAssetProvider),
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
                        controller: addEditAssetProvider.platformCtrl,
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
                        controller: addEditAssetProvider.usernameCtrl,
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
              controller: addEditAssetProvider.recoveryHintCtrl,
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
            _buildNotesField(provider: addEditAssetProvider),
            const SizedBox(height: 18),

            // 8 & 9. Nominee + Sensitive
            _buildLabel('8. Assign to Nominee'),
            const SizedBox(height: 8),
            _buildNomineeDropdown(provider: addEditAssetProvider),
            const SizedBox(height: 12),

            const SizedBox(height: 18),
            // SAVE
            CustomButton1(btnText: 'Save Asset', onPressed: () async{
              final ok = await addEditAssetProvider.saveAsset(AppUtils.userId);
              if (!context.mounted) return;
              if (ok) Navigator.pop(context);
            },),

            const SizedBox(height: 14),
            // DELETE
            if (addEditAssetProvider.isEditMode)
            CustomButton1(btnText: 'Delete Asset', backgroundColor: AppColors.red.withOpacity(0.8),onPressed: () async {
              final ok = await addEditAssetProvider.delete(AppUtils.userId);
              if (!context.mounted) return;
              if (ok) Navigator.pop(context);
            }),
            
          ],
        ),
      ),
    );
  }
}

// ---------------------------------------------
//  APP BAR
// ---------------------------------------------
PreferredSizeWidget _buildAppBar({required VoidCallback onPressed}) {
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
        onPressed: onPressed,
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

// ---------------------------------------------
//  SECURITY BANNER
// ---------------------------------------------
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

// ---------------------------------------------
//  LABEL
// ---------------------------------------------
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

// ---------------------------------------------
//  TEXT FIELD
// ---------------------------------------------
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

// ---------------------------------------------
//  CATEGORY DROPDOWN
// ---------------------------------------------
Widget _buildCategoryDropdown({required AddEditAssetProvider provider}) {
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
        value: provider.selectedCategory,
        isExpanded: true,
        icon: const Icon(
          Icons.keyboard_arrow_down_rounded,
          color: Colors.black54,
        ),
        items: provider.categories.map((cat) {
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
        onChanged: (val) => provider.changeCategory(val!),
      ),
    ),
  );
}

// ---------------------------------------------
//  NOTES FIELD
// ---------------------------------------------
Widget _buildNotesField({required AddEditAssetProvider provider}) {
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
      controller: provider.notesCtrl,
      maxLines: 4,
      maxLength: 300,
      // onChanged: (_) => setState(() {}),
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
        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
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

// ---------------------------------------------
//  NOMINEE DROPDOWN
// ---------------------------------------------
Widget _buildNomineeDropdown({required AddEditAssetProvider provider}) {
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
        value: provider.selectedNominee,
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
        items: provider.nominees.map((nominee) {
          return DropdownMenuItem<String>(
            value: nominee,
            child: Text(nominee, style: const TextStyle(fontSize: 13)),
          );
        }).toList(),
        onChanged: (val) => provider.changeNominee(val),
      ),
    ),
  );
}

// ---------------------------------------------
//  BOTTOM NOTE
// ---------------------------------------------
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
