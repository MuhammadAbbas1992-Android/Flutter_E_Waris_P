import 'package:e_waris/core/constants/app_colors.dart';
import 'package:e_waris/data/models/nominee_model.dart';
import 'package:e_waris/view_models/nominee_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes/routs_name.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_nominee_card.dart';
import '../widgets/info_banner.dart';

class NomineesScreen extends StatelessWidget {
  const NomineesScreen({super.key});

  static const Color _primaryBlue = Color(0xFF3B5BDB);
  static const Color _bgColor = Color(0xFFF4F6FB);
  static const Color _textDark = Color(0xFF1A1A2E);


  @override
  Widget build(BuildContext context) {
    final nomineeProvider = Provider.of<NomineeProvider>(context);
    return Scaffold(
        backgroundColor: _bgColor,
        appBar: CustomAppBar(textColor: _textDark,
          text: 'My Nominees',
          onTap: () =>
              Navigator.pushNamed(context, RoutsName.addEditNomineeScreen,)),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Info Banner ──
                  InfoBanner(
                    icon: Icons.people_outline,
                    iconColor: _primaryBlue,
                    iconBg: const Color(0xFFE8EDFB),
                    text: 'These trusted contacts will be notified\nif you become inactive.',
                  ),
                  const SizedBox(height: 14),

                  // ── Nominee List ──
                  Expanded(
                    child: ListView.separated(
                      itemCount: nomineeProvider.nominees.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (context, index) {
                        final nominee = nomineeProvider.nominees[index];
                        return CustomNomineeCard(nominee: nominee,
                            onTap: () =>
                                Navigator.pushNamed(
                                    context, RoutsName.addEditNomineeScreen,
                                    arguments: nominee.id));
                      }
                    ),
                  ),
                  const SizedBox(height: 14),

                  // ── Bottom Note ──
                  InfoBanner(
                    icon: Icons.lock_outline,
                    iconColor: AppColors.primary,
                    iconBg: const Color(0xFFE8EDFB),
                    text: "Your nominees' information is private and secure.",
                  ),
                ],
              ),
            ),
          ),
        );
    }
}
