import 'package:blab_design_system/blab_design_system.dart';
import 'package:flutter/material.dart';

class ButtonStory extends StatelessWidget {
  const ButtonStory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(BLabSpacing.lg),
      children: [
        _label('Primary', context),
        BLabButton(text: 'Primary button', onPressed: () {}),
        SizedBox(height: BLabSpacing.lg),
        BLabButton(
          text: 'Primary with icon',
          icon: Icons.favorite,
          onPressed: () {},
        ),
        SizedBox(height: BLabSpacing.lg),
        BLabButton(
          text: 'Full width',
          isFullWidth: true,
          onPressed: () {},
        ),
        SizedBox(height: BLabSpacing.xxl),

        _label('Secondary', context),
        BLabButton(
          text: 'Secondary',
          variant: BLabButtonVariant.secondary,
          onPressed: () {},
        ),
        SizedBox(height: BLabSpacing.lg),
        BLabButton(
          text: 'Secondary with icon',
          icon: Icons.settings,
          variant: BLabButtonVariant.secondary,
          onPressed: () {},
        ),
        SizedBox(height: BLabSpacing.xxl),

        _label('Destructive', context),
        BLabButton(
          text: 'Destructive',
          variant: BLabButtonVariant.destructive,
          onPressed: () {},
        ),
        SizedBox(height: BLabSpacing.xxl),

        _label('Disabled', context),
        const BLabButton(text: 'Disabled primary'),
        SizedBox(height: BLabSpacing.lg),
        const BLabButton(
          text: 'Disabled secondary',
          variant: BLabButtonVariant.secondary,
        ),
      ],
    );
  }

  Widget _label(String text, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: BLabSpacing.md),
      child: Text(
        text,
        style: BLabTypography.subtitle.copyWith(
          color: BLabColors.textPrimary(context),
        ),
      ),
    );
  }
}
