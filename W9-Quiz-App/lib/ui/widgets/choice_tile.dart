import 'package:flutter/material.dart';

class ChoiceTile extends StatelessWidget {
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const ChoiceTile({
    super.key,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Center(
        child: Text(
          label,
        ),
      ),
      trailing: selected ? const Icon(Icons.check, color: Colors.green) : null,
      onTap: onTap,
      tileColor: selected ? Colors.green.withOpacity(0.1) : null,
    );
  }
}
