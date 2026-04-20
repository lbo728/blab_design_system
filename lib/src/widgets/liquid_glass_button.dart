import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_colors.dart';
import '../theme/app_glass.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import '../theme/app_typography.dart';
import 'pressable_wrapper.dart';

enum BLabButtonVariant { primary, secondary, destructive }

class BLabButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final IconData? icon;
  final BLabButtonVariant variant;
  final bool isFullWidth;
  final Widget? child;

  const BLabButton({
    super.key,
    required this.text,
    this.onPressed,
    this.icon,
    this.variant = BLabButtonVariant.primary,
    this.isFullWidth = false,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    Color backgroundColor;
    Color textColor;

    switch (variant) {
      case BLabButtonVariant.primary:
        backgroundColor = BLabColors.primary;
        textColor = Colors.white;
        break;
      case BLabButtonVariant.destructive:
        backgroundColor = BLabColors.error;
        textColor = Colors.white;
        break;
      case BLabButtonVariant.secondary:
        backgroundColor = BLabGlass.fill(context);
        textColor = isDark ? Colors.white : Colors.black;
        break;
    }

    final content = ClipRRect(
      borderRadius: BLabRadius.mdRect,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: BLabGlass.blur, sigmaY: BLabGlass.blur),
        child: Container(
          width: isFullWidth ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BLabRadius.mdRect,
            border: Border.all(
              color: variant == BLabButtonVariant.secondary
                  ? BLabGlass.border(context)
                  : Colors.transparent,
              width: 0.5,
            ),
          ),
          child:
              child ??
              Row(
                mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[
                    Icon(icon, color: textColor, size: 20),
                    SizedBox(width: BLabSpacing.sm),
                  ],
                  Text(
                    text,
                    style: BLabTypography.button.copyWith(color: textColor),
                  ),
                ],
              ),
        ),
      ),
    );

    if (onPressed == null) {
      return Opacity(opacity: 0.5, child: content);
    }

    return BLabPressableWrapper(
      onTap: () {
        HapticFeedback.selectionClick();
        onPressed!();
      },
      child: content,
    );
  }
}
