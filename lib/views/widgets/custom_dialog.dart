import 'package:e_waris/views/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';

class CustomDialog extends StatelessWidget {
  // 1. Define the properties (fields)
  final String title;
  final String message;
  final String confirmLabel;
  final String cancelLabel;
  final Color confirmLabelColor;
  final Color cancelLabelColor;

  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  final IconData? icon;
  final Color? iconColor;

  // 2. The Constructor
  const CustomDialog({
    super.key,
    required this.title,
    required this.message,
    this.confirmLabel = "Confirm",
    this.cancelLabel = 'Cancel',
    this.confirmLabelColor= AppColors.primary,
    this.cancelLabelColor=AppColors.darkGrey,
    this.onConfirm,
    this.onCancel,
    this.icon,
    this.iconColor,
  });

  // 3. The instance method to trigger the dialog
  Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      // 'this' refers to this specific instance of CustomDialog
      builder: (BuildContext context) => this,
    );
  }

  @override
  Widget build(BuildContext context) {
    /*showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Logout',
          style: TextStyle(fontWeight: FontWeight.w700, color: AppColors.black87),
        ),
        content: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(color: AppColors.darkGrey),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel', style: TextStyle(color: AppColors.darkGrey)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              // TODO: handle logout
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    ); */
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 10.0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 24.0),
      actionsPadding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 16.0),
      title: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, color: iconColor ?? Theme.of(context).primaryColor),
            const SizedBox(width: 12),
          ],
          Expanded(
            child:
            CustomText(text: title,fontSize: 20, fontWeight: FontWeight.w700,fontColor: AppColors.primary,),
          ),
        ],
      ),
      content: SingleChildScrollView(

        child:
        CustomText(text: message,fontSize: 16,fontColor: AppColors.darkGrey,),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (onCancel != null) onCancel!();
          },
          child: Text(cancelLabel, style: TextStyle(color: Colors.grey[600])),
        ),

        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              if (onConfirm != null) onConfirm!();
            },
            child: const Text(
              'Logout',
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w700),
            )),
        /*ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            if (onConfirm != null) onConfirm!();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: //iconColor ?? Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
          child: Text(confirmLabel, style: const TextStyle(color: Colors.white)),
        ),*/
      ],
    );
  }
}