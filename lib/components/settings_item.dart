import 'package:flutter/material.dart';

import 'forward_button.dart';

class SettingSItem extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final Function() onTap;
  final String? value;
  final IconData icon;
  final Color titleColor;
  final bool isDarkMode; // Add isDarkMode parameter

  const SettingSItem({
    Key? key,
    required this.title,
    required this.bgColor,
    required this.iconColor,
    required this.onTap,
    this.value,
    required this.icon,
    required this.titleColor,
    required this.isDarkMode, // Add isDarkMode parameter
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: bgColor,
            ),
            child: Icon(
              icon,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: isDarkMode ? Colors.white : titleColor,
            ),
          ),
          const Spacer(),
          value != null
              ? Text(
            value!,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: isDarkMode ? Colors.grey : Colors.grey,
            ),
          )
              : Container(),
          const SizedBox(width: 10),
          ForwardButton(
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
