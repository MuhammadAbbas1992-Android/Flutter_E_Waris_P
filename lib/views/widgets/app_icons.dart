// ─── Custom Icons ─────────────────────────────────────────────────────────────

import 'package:flutter/material.dart';

class BinanceIcon extends StatelessWidget {
  const BinanceIcon({super.key});

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

class GmailIcon extends StatelessWidget {
  const GmailIcon({super.key});

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

class HostingerIcon extends StatelessWidget {
  const HostingerIcon({super.key});

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

class FacebookIcon extends StatelessWidget {
  const FacebookIcon({super.key});

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

class WhatsAppIcon extends StatelessWidget {
  const WhatsAppIcon({super.key});

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

