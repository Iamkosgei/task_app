import 'package:flutter/material.dart';
import 'package:taks_app/core/ui/app_colors.dart';

class CustomRadio extends StatelessWidget {
  final VoidCallback onTap;
  final bool isComplete;
  const CustomRadio({super.key, required this.onTap, required this.isComplete});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          color: isComplete ? checkedColor : null,
          border: Border.all(
            color: primaryTextColor,
            width: 1.5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        child: isComplete
            ? const Icon(
                Icons.check,
                color: checkedIconColor,
              )
            : const SizedBox(),
      ),
    );
  }
}
