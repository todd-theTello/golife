part of 'app_bars.dart';

/// Custom app bar widget
class DefaultAppBar extends StatefulWidget implements PreferredSizeWidget {
  /// creates a new instance of [DefaultAppBar]
  const DefaultAppBar({this.centerTitle, this.title, this.toolBarHeight, super.key});

  /// sets the height of the app bar
  final double? toolBarHeight;

  /// sets the title of the app bar
  final String? title;

  /// sets the title of the app bar
  final bool? centerTitle;

  @override
  State<DefaultAppBar> createState() => _DefaultAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(toolBarHeight ?? kToolbarHeight);
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      leadingWidth: 64,
      toolbarHeight: 64,
      centerTitle: widget.centerTitle ?? true,
      title: widget.title != null ? Text(widget.title!, style: kHeading1()) : null,
      leading: CustomAnimatedScale(
        onPressed: () {
          context.pop();
        },
        child: CircleContainer(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          color: theme.dividerColor,
          child: const Icon(Iconsax.arrow_left),
        ),
      ).paddingOnly(left: 20),
    );
  }
}
