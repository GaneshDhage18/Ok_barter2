import 'package:flutter/material.dart';

void showDeleteAccountDialog(
  BuildContext context, {
  required VoidCallback onConfirm,
}) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        title: const Text(
          'Delete Account',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.red),
        ),
        content: const Text(
          'Are you sure you want to delete your account?\n'
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // close dialog
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              Navigator.pop(context); // close dialog
              onConfirm(); // 🔥 delete logic here
            },
            child: const Text('Delete'),
          ),
        ],
      );
    },
  );
}
