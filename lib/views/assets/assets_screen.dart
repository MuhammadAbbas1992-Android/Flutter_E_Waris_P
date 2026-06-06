import 'package:e_waris/data/models/asset_model.dart';
import 'package:flutter/material.dart';

class AssetsScreen extends StatelessWidget {
  const AssetsScreen({super.key});

  static const Color _primaryBlue = Color(0xFF3B5BDB);
  static const Color _bgColor = Color(0xFFF4F6FB);
  static const Color _cardBg = Colors.white;
  static const Color _textDark = Color(0xFF1A1A2E);
  static const Color _textGrey = Color(0xFF8A8FA8);

  List<AssetModel> get _assets => [
    AssetModel(
      name: 'Binance Wallet',
      category: 'Crypto Wallet',
      assignedTo: 'Ali Khan',
      assignedColor: const Color(0xFF3B5BDB),
      icon: _BinanceIcon(),
    ),
    AssetModel(
      name: 'Gmail Account',
      category: 'Email Account',
      assignedTo: 'Brother',
      assignedColor: const Color(0xFF3B5BDB),
      icon: _GmailIcon(),
    ),
    AssetModel(
      name: 'Hostinger Domain',
      category: 'Domain & Hosting',
      assignedTo: 'Wife',
      assignedColor: const Color(0xFF3B5BDB),
      icon: _HostingerIcon(),
    ),
    AssetModel(
      name: 'Facebook Account',
      category: 'Social Media',
      assignedTo: 'Ali Khan',
      assignedColor: const Color(0xFF3B5BDB),
      icon: _FacebookIcon(),
    ),
    AssetModel(
      name: 'WhatsApp Account',
      category: 'Messaging',
      assignedTo: 'Brother',
      assignedColor: const Color(0xFF3B5BDB),
      icon: _WhatsAppIcon(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Header ──
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'My Assets',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w800,
                      color: _textDark,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: const BoxDecoration(
                        color: _primaryBlue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 24),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // ── Info Banner ──
              _InfoBanner(
                icon: Icons.shield_outlined,
                iconColor: _primaryBlue,
                iconBg: const Color(0xFFE8EDFB),
                text: 'All your digital assets are encrypted\nand stored securely.',
              ),
              const SizedBox(height: 14),

              // ── Asset List ──
              Expanded(
                child: ListView.separated(
                  itemCount: _assets.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    final asset = _assets[index];
                    return _AssetCard(asset: asset);
                  },
                ),
              ),
              const SizedBox(height: 14),

              // ── Bottom Note ──
              _InfoBanner(
                icon: Icons.lock_outline,
                iconColor: _primaryBlue,
                iconBg: const Color(0xFFE8EDFB),
                text: 'Tap on any asset to view or edit details.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Info Banner ──────────────────────────────────────────────────────────────

class _InfoBanner extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final String text;

  const _InfoBanner({
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: iconBg, shape: BoxShape.circle),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13,
                color: Color(0xFF5A6080),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Asset Card ───────────────────────────────────────────────────────────────

class _AssetCard extends StatelessWidget {
  final AssetModel asset;

  const _AssetCard({required this.asset});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
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
            // Icon
            SizedBox(width: 48, height: 48, child: asset.icon),
            const SizedBox(width: 14),

            // Name & category
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    asset.name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1A2E),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    asset.category,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF8A8FA8),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.person_outline,
                          size: 14, color: Color(0xFF8A8FA8)),
                      const SizedBox(width: 4),
                      const Text(
                        'Assigned: ',
                        style: TextStyle(fontSize: 12, color: Color(0xFF8A8FA8)),
                      ),
                      Text(
                        asset.assignedTo,
                        style: TextStyle(
                          fontSize: 12,
                          color: asset.assignedColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Icon(Icons.chevron_right, color: Color(0xFFB0B5C8), size: 22),
          ],
        ),
      ),
    );
  }
}

// ─── Custom Icons ─────────────────────────────────────────────────────────────

class _BinanceIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text('◆', style: TextStyle(fontSize: 22, color: Color(0xFFF3BA2F))),
      ),
    );
  }
}

class _GmailIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFFFF0F0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text('M',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color(0xFFEA4335))),
      ),
    );
  }
}

class _HostingerIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF3EEFF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text('H',
            style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: Color(0xFF7B2FBE))),
      ),
    );
  }
}

class _FacebookIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8F0FE),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Text('f',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Color(0xFF1877F2))),
      ),
    );
  }
}

class _WhatsAppIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFE8F8F0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Icon(Icons.chat, color: Color(0xFF25D366), size: 26),
      ),
    );
  }
}