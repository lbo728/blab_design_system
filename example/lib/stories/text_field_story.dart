import 'package:blab_design_system/blab_design_system.dart';
import 'package:flutter/material.dart';

class TextFieldStory extends StatefulWidget {
  const TextFieldStory({super.key});

  @override
  State<TextFieldStory> createState() => _TextFieldStoryState();
}

class _TextFieldStoryState extends State<TextFieldStory> {
  final _plain = TextEditingController();
  final _withLabel = TextEditingController(text: 'Sample input');
  final _obscured = TextEditingController(text: 'secret');

  @override
  void dispose() {
    _plain.dispose();
    _withLabel.dispose();
    _obscured.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(BLabSpacing.lg),
      children: [
        _label('Default', context),
        BLabTextField(
          controller: _plain,
          hintText: 'Type here...',
        ),
        SizedBox(height: BLabSpacing.xl),

        _label('With label & value', context),
        BLabTextField(
          controller: _withLabel,
          label: 'Full name',
          hintText: 'Your name',
        ),
        SizedBox(height: BLabSpacing.xl),

        _label('Obscured', context),
        BLabTextField(
          controller: _obscured,
          label: 'Password',
          hintText: 'Enter password',
          obscureText: true,
        ),
        SizedBox(height: BLabSpacing.xl),

        _label('Multi-line', context),
        BLabTextField(
          controller: TextEditingController(),
          label: 'Notes',
          hintText: 'Write anything',
          maxLines: 4,
        ),
        SizedBox(height: BLabSpacing.xl),

        _label('Read-only', context),
        BLabTextField(
          controller: TextEditingController(text: 'Cannot edit this'),
          label: 'Read only',
          readOnly: true,
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
