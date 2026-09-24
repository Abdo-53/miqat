import 'package:flutter/material.dart';

class SettingMenuItem<T> {
  final String title;
  final T value;

  const SettingMenuItem({required this.title, required this.value});
}

class SettingPopupMenu<T> extends StatelessWidget {
  const SettingPopupMenu({
    super.key,
    required this.currentValue,
    required this.items,
    required this.onSelected,
  });

  final T currentValue;
  final List<SettingMenuItem<T>> items;
  final ValueChanged<T> onSelected;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      tooltip: '',
      initialValue: currentValue,
      onSelected: onSelected,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      itemBuilder: (context) {
        return items.map((item) {
          return PopupMenuItem<T>(
            value: item.value,
            child: Row(
              children: [
                Expanded(child: Text(item.title)),
                if (item.value == currentValue)
                  const Icon(Icons.check, size: 18),
              ],
            ),
          );
        }).toList();
      },
    );
  }
}
