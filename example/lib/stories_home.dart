import 'package:blab_design_system/blab_design_system.dart';
import 'package:flutter/material.dart';

import 'stories/button_story.dart';
import 'stories/card_story.dart';
import 'stories/segmented_story.dart';
import 'stories/snackbar_story.dart';
import 'stories/text_field_story.dart';
import 'stories/tokens_story.dart';

class StoriesHome extends StatelessWidget {
  final ThemeMode themeMode;
  final VoidCallback onThemeToggle;

  const StoriesHome({
    super.key,
    required this.themeMode,
    required this.onThemeToggle,
  });

  static const List<_Story> _stories = [
    _Story(
      name: 'Tokens',
      category: 'Foundations',
      subtitle: 'Colors, typography, spacing, radius, shadow',
      builder: _buildTokens,
    ),
    _Story(
      name: 'Button',
      category: 'Inputs',
      subtitle: 'Primary / Secondary / Destructive',
      builder: _buildButton,
    ),
    _Story(
      name: 'TextField',
      category: 'Inputs',
      subtitle: 'Glass-fill input with label and clear',
      builder: _buildTextField,
    ),
    _Story(
      name: 'SegmentedControl',
      category: 'Inputs',
      subtitle: 'Pill-shaped segmented picker',
      builder: _buildSegmented,
    ),
    _Story(
      name: 'Card',
      category: 'Surfaces',
      subtitle: 'Glass-fill container with radius 16',
      builder: _buildCard,
    ),
    _Story(
      name: 'Snackbar',
      category: 'Feedback',
      subtitle: 'success / error / warning / info',
      builder: _buildSnackbar,
    ),
  ];

  static Widget _buildTokens(BuildContext context) => const TokensStory();
  static Widget _buildButton(BuildContext context) => const ButtonStory();
  static Widget _buildTextField(BuildContext context) => const TextFieldStory();
  static Widget _buildSegmented(BuildContext context) => const SegmentedStory();
  static Widget _buildCard(BuildContext context) => const CardStory();
  static Widget _buildSnackbar(BuildContext context) => const SnackbarStory();

  @override
  Widget build(BuildContext context) {
    final Map<String, List<_Story>> grouped = {};
    for (final story in _stories) {
      grouped.putIfAbsent(story.category, () => <_Story>[]).add(story);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('BLab Storybook'),
        actions: [
          IconButton(
            icon: Icon(
              themeMode == ThemeMode.light ? Icons.dark_mode : Icons.light_mode,
            ),
            tooltip: themeMode == ThemeMode.light ? 'Dark mode' : 'Light mode',
            onPressed: onThemeToggle,
          ),
          SizedBox(width: BLabSpacing.sm),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(BLabSpacing.md),
        children: [
          for (final entry in grouped.entries) ...[
            Padding(
              padding: EdgeInsets.fromLTRB(
                BLabSpacing.sm,
                BLabSpacing.md,
                BLabSpacing.sm,
                BLabSpacing.sm,
              ),
              child: Text(
                entry.key.toUpperCase(),
                style: BLabTypography.caption.copyWith(
                  color: BLabColors.textTertiary(context),
                  letterSpacing: 0.5,
                ),
              ),
            ),
            BLabCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  for (int i = 0; i < entry.value.length; i++) ...[
                    if (i > 0)
                      Divider(
                        height: 1,
                        color: BLabColors.borderSubtle(context),
                      ),
                    _StoryTile(
                      story: entry.value[i],
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (ctx) => _StoryPage(story: entry.value[i]),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
          SizedBox(height: BLabSpacing.xxl),
        ],
      ),
    );
  }
}

class _Story {
  final String name;
  final String category;
  final String subtitle;
  final Widget Function(BuildContext) builder;

  const _Story({
    required this.name,
    required this.category,
    required this.subtitle,
    required this.builder,
  });
}

class _StoryTile extends StatelessWidget {
  final _Story story;
  final VoidCallback onTap;

  const _StoryTile({required this.story, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: BLabSpacing.lg,
          vertical: BLabSpacing.md,
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(story.name, style: BLabTypography.body),
                  SizedBox(height: BLabSpacing.xs),
                  Text(
                    story.subtitle,
                    style: BLabTypography.caption.copyWith(
                      color: BLabColors.textTertiary(context),
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: BLabColors.textTertiary(context),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoryPage extends StatelessWidget {
  final _Story story;

  const _StoryPage({required this.story});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(story.name)),
      body: story.builder(context),
    );
  }
}
