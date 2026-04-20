import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../theme/app_glass.dart';
import '../theme/app_radius.dart';
import '../theme/app_spacing.dart';
import 'pressable_wrapper.dart';

class BLabCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  const BLabCard({
    super.key,
    required this.child,
    this.padding,
    this.borderRadius,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final cardContent = ClipRRect(
      borderRadius: borderRadius ?? BLabRadius.lgRect,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: BLabGlass.blur, sigmaY: BLabGlass.blur),
        child: Container(
          padding: padding ?? EdgeInsets.all(BLabSpacing.lg),
          decoration: BoxDecoration(
            color: BLabGlass.fill(context),
            borderRadius: borderRadius ?? BLabRadius.lgRect,
            border: Border.all(color: BLabGlass.border(context), width: 0.5),
          ),
          child: child,
        ),
      ),
    );

    if (onTap != null || onLongPress != null) {
      return BLabPressableWrapper(
        onTap: () {
          HapticFeedback.selectionClick();
          onTap?.call();
        },
        onLongPress: onLongPress,
        child: cardContent,
      );
    }

    return cardContent;
  }
}
