import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DarkModeSwitch extends StatelessWidget {
  final String title;
  final Color bgColor;
  final Color iconColor;
  final Function(bool value) onTap;
  final bool value;
  final IconData icon;
  const DarkModeSwitch({super.key,
    required this.title,
    required this.bgColor,
    required this.iconColor,
    required this.onTap,
    required this.value,
    required this.icon, required Color titleColor
  });

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
            child:  Icon(
              icon,
              color: iconColor,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              // color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            value
            ? "On":"Off",
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
               Container(), // Added a container to handle null value

          const SizedBox(width: 10),
          CupertinoSwitch(
              value: value,
              onChanged: onTap),

        ],
      ),
    );
  }
}

