import 'package:blab_design_system/blab_design_system.dart';
import 'package:flutter/material.dart';

enum _Option { one, two, three }

class SegmentedStory extends StatefulWidget {
  const SegmentedStory({super.key});

  @override
  State<SegmentedStory> createState() => _SegmentedStoryState();
}

class _SegmentedStoryState extends State<SegmentedStory> {
  _Option _two = _Option.one;
  _Option _three = _Option.two;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(BLabSpacing.lg),
      children: [
        _label('Two segments', context),
        BLabSegmentedControl<_Option>(
          items: const [
            BLabSegmentedItem(value: _Option.one, label: 'Light'),
            BLabSegmentedItem(value: _Option.two, label: 'Dark'),
          ],
          selectedValue: _two,
          onChanged: (v) => setState(() => _two = v),
        ),
        SizedBox(height: BLabSpacing.xl),

        _label('Three segments', context),
        BLabSegmentedControl<_Option>(
          items: const [
            BLabSegmentedItem(value: _Option.one, label: 'All'),
            BLabSegmentedItem(value: _Option.two, label: 'Active'),
            BLabSegmentedItem(value: _Option.three, label: 'Archived'),
          ],
          selectedValue: _three,
          onChanged: (v) => setState(() => _three = v),
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
