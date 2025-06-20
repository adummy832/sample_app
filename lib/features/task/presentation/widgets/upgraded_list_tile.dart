import 'package:flutter/material.dart';

class UpgradedListTile extends StatefulWidget {
  final Widget Function(bool value) leadingBuilder;
  final Widget content;
  final Widget trailing;
  final bool initialValue;
  final ValueChanged<bool>? onChanged;

  const UpgradedListTile({
    super.key,
    required this.leadingBuilder,
    required this.content,
    required this.trailing,
    this.initialValue = false,
    this.onChanged,
  });

  @override
  State<UpgradedListTile> createState() => _UpgradedListTileState();
}

class _UpgradedListTileState extends State<UpgradedListTile> {
  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  void _toggleCheck() {
    setState(() {
      _isChecked = !_isChecked;
    });
    widget.onChanged?.call(_isChecked);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _toggleCheck,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 12.0,
        ),
        child: Row(
          children: [
            widget.leadingBuilder(_isChecked),
            const SizedBox(width: 12),
            Expanded(child: widget.content),
            const SizedBox(width: 12),
            widget.trailing,
          ],
        ),
      ),
    );
  }
}
