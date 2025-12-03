import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/core/theme/app_colors.dart';
import 'package:to_do/core/theme/theme_provider.dart';

class ProfileInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Function(String newValue) onEdit;

  const ProfileInfoRow({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Column(
      children: [
        Row(
          children: [
            Icon(icon, size: 22, color: themeProvider.textColor),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                "$label: $value",
                style: TextStyle(fontSize: 16, color: themeProvider.textColor),
              ),
            ),
            IconButton(
              onPressed: () => _showEditDialog(context),
              icon: Icon(Icons.edit, size: 20, color: themeProvider.textColor),
            ),
          ],
        ),
        Divider(
          thickness: 1,
          color: themeProvider.borderColor,
          indent: 20,
          endIndent: 20,
        ),
      ],
    );
  }

  void _showEditDialog(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context, listen: false);
    final controller = TextEditingController(text: value);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          "Edit $label",
          style: TextStyle(color: themeProvider.textColor),
        ),
        backgroundColor: themeProvider.cardColor,
        content: TextField(
          controller: controller,
          style: TextStyle(color: themeProvider.textColor),
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.primary),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(color: themeProvider.textColor),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                onEdit(controller.text);
              }
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }
}