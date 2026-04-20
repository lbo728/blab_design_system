import 'package:blab_design_system/blab_design_system.dart';
import 'package:flutter/material.dart';

class SnackbarStory extends StatelessWidget {
  const SnackbarStory({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(BLabSpacing.lg),
      children: [
        _label('Types', context),
        BLabButton(
          text: 'Show success',
          onPressed: () => BLabSnackbar.show(
            context,
            message: 'Draft saved',
            type: BLabSnackbarType.success,
          ),
        ),
        SizedBox(height: BLabSpacing.md),
        BLabButton(
          text: 'Show error',
          variant: BLabButtonVariant.destructive,
          onPressed: () => BLabSnackbar.show(
            context,
            message: "Couldn't save. Check your connection.",
            type: BLabSnackbarType.error,
          ),
        ),
        SizedBox(height: BLabSpacing.md),
        BLabButton(
          text: 'Show warning',
          variant: BLabButtonVariant.secondary,
          onPressed: () => BLabSnackbar.show(
            context,
            message: 'Unsaved changes will be lost',
            type: BLabSnackbarType.warning,
          ),
        ),
        SizedBox(height: BLabSpacing.md),
        BLabButton(
          text: 'Show info',
          variant: BLabButtonVariant.secondary,
          onPressed: () => BLabSnackbar.show(
            context,
            message: 'Synced just now',
            type: BLabSnackbarType.info,
          ),
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
