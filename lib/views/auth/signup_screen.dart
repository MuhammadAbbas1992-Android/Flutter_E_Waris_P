import 'package:e_waris/providers/auth_providers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProviders>(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0, iconTheme: const IconThemeData(color: Colors.black)),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Create Account", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                const Text("Fill the details to get started", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 32),

                _buildField("Full Name", "John Doe"),
                const SizedBox(height: 20),
                _buildField("Email", "your@email.com"),
                const SizedBox(height: 20),
                _buildField("Password", "••••••••", isPassword: true, provider: authProvider),

                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: authProvider.isLoading ? null : () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E61D8),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, String hint, {bool isPassword = false, AuthProviders? provider}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword ? !provider!.isPasswordVisible : false,
          decoration: InputDecoration(
            hintText: hint,
            filled: true,
            fillColor: const Color(0xFFF3F6FF),
            suffixIcon: isPassword ? IconButton(
              icon: Icon(provider!.isPasswordVisible ? Icons.visibility : Icons.visibility_off_outlined),
              onPressed: () => provider.togglePasswordVisibility(),
            ) : null,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }
}