import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/extensions/widget.dart';
import '../../../core/database/shared_preference.dart';
import '../../themes/themes.dart';
import '../../widgets/app_bars/app_bars.dart';
import '../../widgets/buttons/buttons.dart';
import 'elements/profile_elements.dart';

/// Profile view
class ProfileView extends ConsumerStatefulWidget {
  ///
  const ProfileView({super.key});

  @override
  ConsumerState createState() => _ProfileViewState();
}

class _ProfileViewState extends ConsumerState<ProfileView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: CustomScrollView(
        slivers: [
          SliverList.list(children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () async {
                    // await showCupertinoModalPopup<String>(
                    //   context: context,
                    //   builder: (_) => CupertinoActionSheet(
                    //     message: const Text('Select picture via'),
                    //     cancelButton: CupertinoActionSheetAction(
                    //       /// This parameter indicates the action would perform
                    //       /// a destructive action such as delete or exit and turns
                    //       /// the action's text color to red.
                    //       isDestructiveAction: true,
                    //
                    //       onPressed: () {
                    //         Navigator.pop(context);
                    //       },
                    //       child: const Text('Cancel'),
                    //     ),
                    //     actions: <CupertinoActionSheetAction>[
                    //       CupertinoActionSheetAction(
                    //         /// This parameter indicates the action would be a default
                    //         /// defualt behavior, turns the action's text to bold text.
                    //         isDefaultAction: true,
                    //         onPressed: () async {},
                    //         child: const Text('Camera'),
                    //       ),
                    //       CupertinoActionSheetAction(
                    //         onPressed: () async {
                    //           Navigator.of(context).pop();
                    //           await ImagePickerUtil.openGallery();
                    //         },
                    //         child: const Text('Gallery'),
                    //       ),
                    //
                    //       /// This parameter indicates the action would perform
                    //     ],
                    //   ),
                    // );
                  },
                  child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.blue,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10000),
                        child: CachedNetworkImage(
                          imageUrl:
                              'https://imgs.search.brave.com/NEuZHrK3bs4KgCXaenI9nSqVmSTJzsPzUlsWRzwb4T8/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuc2stc3RhdGlj/LmNvbS9pbWFnZXMv/bWVkaWEvaW1nL2Nv/bDMvMjAxNzA0MDQt/MjAyNDEwLTk3OTIx/NS5qcGc',
                          errorWidget: (context, url, error) => LocalPreference.displayName != ''
                              ? Text('T', style: theme.textTheme.displayLarge)
                              : const Icon(Iconsax.user, size: 40),
                        )),
                  ),
                ).paddingOnly(right: 24),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Todd Nii-Tello Nelson', style: kBody1(fontWeight: FontWeight.w500)),
                    Text('tello.nii.tn@gmail.com', style: kBody2()),
                    CustomAnimatedScale(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: Text(
                          'Edit',
                          style: kBody1().copyWith(decoration: TextDecoration.underline, decorationThickness: 2),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ).paddingOnly(bottom: 24, top: 24),
            Text('Personal details', style: kHeading2()),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFDFE6E9)),
              ),
              child: Column(
                children: [
                  ProfileListTile(
                    title: 'Account',
                    subtitle: 'Manage your account details',
                    onTapped: () {},
                  ),
                  ProfileListTile(
                    title: 'Preferences',
                    subtitle: 'Customize your app  preferences to get the best experience',
                    onTapped: () {},
                  ),
                ],
              ),
            ),
            Text('Settings', style: kHeading2()),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFDFE6E9),
                ),
              ),
              child: Column(
                children: [
                  ProfileListTile(title: 'Notifications', onTapped: () {}),
                  ProfileListTile(title: 'Security', onTapped: () {}),
                  ProfileListTile(title: 'Theme', onTapped: () => context.goNamed('theme-settings')),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: const Color(0xFFDFE6E9),
                ),
              ),
              child: Column(
                children: [
                  ProfileListTile(title: 'Contact support', onTapped: () {}),
                  ProfileListTile(title: 'Send feedback', onTapped: () {}),
                  ProfileListTile(title: 'Rate the app', onTapped: () {}),
                  ProfileListTile(title: 'About', onTapped: () {}),
                  ProfileListTile(title: 'Terms and conditions', onTapped: () {}),
                  ProfileListTile(title: 'Privacy policy', onTapped: () {}),
                  ProfileListTile(title: 'Software licenses', onTapped: () {}),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: theme.colorScheme.error),
              ),
              child: Column(
                children: [
                  ListTile(
                    onTap: () async {
                      // await ref.read(authenticationProvider.notifier).signOut();
                    },
                    title: Text(
                      'Sign out',
                      style: kBody2(color: theme.colorScheme.error, fontWeight: FontWeight.w500),
                    ),
                    trailing: Icon(Iconsax.logout, color: theme.colorScheme.error),
                  ),
                ],
              ),
            ).paddingOnly(bottom: 24),
          ]).sliverPaddingSymmetric(horizontal: 24)
        ],
      ),
    );
  }
}
