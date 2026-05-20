import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      leading: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.lightRed,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.warning_amber_rounded,
            color: AppColors.red,
            size: 28,
          ),
        ),
      ),

      title:  Text(
        "Inactivity Alert",
        style: Theme.of(context).textTheme.titleMedium
      ),

      subtitle:  Padding(
        padding: EdgeInsets.only(top: 4),
        child: Text(
          "Hama has been inactive for\n15 days. Please check their\ndigital assets.",
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),

      trailing: const Text(
        "Just now",
        style: TextStyle(
          fontSize: 12,
          color: AppColors.grey,
        ),
      ),
    );
  }
}
