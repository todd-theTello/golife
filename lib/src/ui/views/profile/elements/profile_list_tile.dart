part of 'profile_elements.dart';

/// Settings list tile widget
class ProfileListTile extends StatelessWidget {
  /// constructor
  const ProfileListTile({required this.onTapped, required this.title, this.subtitle, super.key});

  /// Void callback to handle tap events
  final VoidCallback onTapped;

  /// Title string on list tile widget
  final String title;

  /// Subtitle string on list tile widget
  final String? subtitle;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      onTap: onTapped,
      title: Text(title, style: kBody2(fontWeight: FontWeight.w500)),
      subtitle: subtitle != null ? Text(subtitle!, style: theme.textTheme.bodySmall) : null,
      trailing: const Icon(Iconsax.arrow_right_2),
    );
  }
}
