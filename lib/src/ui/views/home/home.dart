import 'package:cached_network_image/cached_network_image.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../../utils/extensions/widget.dart';
import '../../themes/themes.dart';
import '../../widgets/buttons/buttons.dart';

/// Home view
class HomeView extends ConsumerStatefulWidget {
  /// constructor
  const HomeView({super.key});

  @override
  ConsumerState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 72,
          pinned: true,
          leadingWidth: 24,
          title: CustomAnimatedScale(
            onPressed: () {
              context.goNamed('profile');
            },
            child: Row(
              children: [
                ClipOval(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://imgs.search.brave.com/NEuZHrK3bs4KgCXaenI9nSqVmSTJzsPzUlsWRzwb4T8/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMuc2stc3RhdGlj/LmNvbS9pbWFnZXMv/bWVkaWEvaW1nL2Nv/bDMvMjAxNzA0MDQt/MjAyNDEwLTk3OTIx/NS5qcGc',
                    width: 64,
                    height: 64,
                    fit: BoxFit.fill,
                  ),
                ).paddingOnly(right: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome,',
                      style: kHeading1(),
                    ),
                    Text(
                      'Todd Nii-Tello Nelson',
                      style: kBody1(),
                    ),
                  ],
                )
              ],
            ),
          ),
          actions: [
            CustomAnimatedScale(
              onPressed: () {},
              child: const Icon(Iconsax.notification),
            ).paddingOnly(right: 24)
          ],
        ),
        SliverList.list(
          children: [
            // FilledButton(
            //   onPressed: () {
            //     ref.read(themeModeProvider.notifier).setDarkMode();
            //   },
            //   child: Text('Dark'),
            // ),
            // OutlinedButton(
            //   onPressed: () {
            //     ref.read(themeModeProvider.notifier).setLightMode();
            //   },
            //   child: Text('Light'),
            // ),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF828282).withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Explore Our Products',
                        style: kHeading2(color: theme.colorScheme.onPrimary),
                      ),
                      const Spacer(),
                      const Icon(PhosphorIconsLight.arrowUpRight)
                    ],
                  ),
                  Text(
                    'We have a range of products that we currently offer to individuals and also to corporate bodies and groups.',
                    style: kBody2(color: theme.colorScheme.onPrimary),
                  )
                ],
              ),
            ).paddingSymmetric(horizontal: 24, vertical: 20),
            Row(
              children: [
                Text(
                  'My insurance policies',
                  style: kHeading2(),
                ),
                const Spacer(),
                ViewAllButton(onPressed: () {})
              ],
            ).paddingLTRB(24, 4, 24, 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 176),
              child: PageView.builder(
                itemBuilder: (context, index) {
                  // TODO(todd-theTello): Extract my policy card
                  return CustomAnimatedScale(
                    onPressed: () {
                      context.goNamed('user-insurance-policy-details-from-main');
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF08141B).withOpacity(0.05),
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                        color: theme.colorScheme.onSecondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'assets/images/allianz-logo.svg',
                            height: 24,
                            color: theme.brightness == Brightness.light ? null : theme.colorScheme.secondary,
                          ).paddingOnly(bottom: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                            decoration: BoxDecoration(
                              color: theme.primaryColor,
                              borderRadius: BorderRadius.circular(60),
                            ),
                            child: Text(
                              'EduFlex Insurance',
                              style: kBody3(color: theme.colorScheme.onPrimary),
                            ),
                          ).centerLeftAlign().paddingOnly(bottom: 20),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Policy number',
                                    style: kHeading2(),
                                  ),
                                  Text(
                                    'BBGDH0909871234657',
                                    style: kBody2(),
                                  ),
                                ],
                              ).expanded(),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Policy amount',
                                    style: kHeading2(),
                                  ),
                                  Text(
                                    NumberFormat.currency(symbol: 'GHS ').format(850000),
                                    style: kBody2(),
                                  ),
                                ],
                              ).expanded()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 20);
                },
              ),
            ),
            Row(
              children: [
                Text(
                  'My investments',
                  style: kHeading2(),
                ),
                const Spacer(),
                ViewAllButton(onPressed: () {})
              ],
            ).paddingLTRB(24, 4, 24, 16),
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 156),
              child: PageView.builder(
                itemBuilder: (context, index) {
                  // TODO(todd-theTello): Extract my policy card
                  return CustomAnimatedScale(
                    onPressed: () {
                      context.goNamed('user-investment-from-main');
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 24),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF08141B).withOpacity(0.05),
                            offset: const Offset(0, 2),
                            blurRadius: 4,
                          ),
                        ],
                        color: theme.colorScheme.onSecondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              ClipOval(
                                child: Image.asset('assets/images/netflix-icon.jpeg',
                                    height: 48, width: 48, fit: BoxFit.cover),
                              ).paddingOnly(right: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'NFLX',
                                    style: kHeading2(height: 1),
                                  ),
                                  Text(
                                    'Netflix inc',
                                    style: kBody2(),
                                  ),
                                ],
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Icon(PhosphorIconsLight.trendUp, size: 16, color: Colors.green)
                                      .paddingOnly(right: 8),
                                  Text(
                                    '2.34%',
                                    style: kBody2(color: Colors.green),
                                  ),
                                ],
                              ).paddingOnly(right: 24)
                            ],
                          ).paddingOnly(bottom: 16),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'My stock',
                                    style: kHeading2(),
                                  ),
                                  Text(
                                    NumberFormat.currency(symbol: 'GHS ').format(350000),
                                    style: kBody2(),
                                  ),
                                ],
                              ).expanded(),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Stock price',
                                    style: kHeading2(),
                                  ),
                                  Text(
                                    NumberFormat.currency(symbol: 'GHS ').format(2350),
                                    style: kBody2(),
                                  ).paddingOnly(right: 12),
                                ],
                              ).expanded()
                            ],
                          ),
                        ],
                      ),
                    ),
                  ).paddingOnly(bottom: 20);
                },
              ),
            ),
            Row(
              children: [
                Text(
                  'Recommended Insurances',
                  style: kHeading2(),
                ),
                const Spacer(),
                ViewAllButton(
                  onPressed: () {},
                ),
              ],
            ).paddingLTRB(24, 4, 24, 16),
          ],
        ),
        SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, mainAxisExtent: 72),
          itemBuilder: (context, index) {
            return CustomAnimatedScale(
              onPressed: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: theme.colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/${recommendedInsurance[index]}-insurance.svg',
                      width: 64,
                    ).paddingOnly(right: 8),
                    Text(
                      '${recommendedInsurance[index].capitalize} insurance',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: kBody2(fontWeight: FontWeight.w600),
                    ).expanded(),
                  ],
                ),
              ),
            );
          },
          itemCount: 4,
        ).sliverPaddingLTRB(24, 0, 24, 20),
        SliverToBoxAdapter(
          child: Row(
            children: [
              Text(
                'Best performing stocks',
                style: kHeading2(),
              ),
              const Spacer(),
              ViewAllButton(
                onPressed: () {},
              ),
            ],
          ).paddingLTRB(24, 12, 24, 16),
        ),
        SliverList.separated(
          itemBuilder: (context, index) {
            return CustomAnimatedScale(
              onPressed: () {},
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF08141B).withOpacity(0.05),
                      offset: const Offset(0, 2),
                      blurRadius: 4,
                    ),
                  ],
                  color: theme.colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ClipOval(
                          child: Image.asset(
                            'assets/images/netflix-icon.jpeg',
                            height: 48,
                            width: 48,
                            fit: BoxFit.cover,
                          ),
                        ).paddingOnly(right: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'NFLX',
                              style: kHeading2(height: 1),
                            ),
                            Text(
                              'Netflix inc',
                              style: kBody2(),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              NumberFormat.currency(symbol: 'GHS ').format(2350),
                              style: kBody2(),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Icon(PhosphorIconsLight.trendUp, size: 16, color: Colors.green)
                                    .paddingOnly(right: 8),
                                Text(
                                  '2.34%',
                                  style: kBody2(color: Colors.green),
                                ),
                              ],
                            ).paddingOnly(right: 24),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) {
            return const SizedBox(height: 8);
          },
          itemCount: 4,
        ).sliverPaddingOnly(bottom: 24)
      ],
    );
  }
}

/// View all button
class ViewAllButton extends StatelessWidget {
  ///
  const ViewAllButton({required this.onPressed, super.key});

  /// void callback to trigger action on pressed
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return CustomAnimatedScale(
      onPressed: onPressed,
      child: ColoredBox(
        color: theme.scaffoldBackgroundColor,
        child: Row(
          children: [
            const Text('View all').paddingOnly(right: 4),
            const Icon(PhosphorIconsLight.arrowCircleRight, size: 20)
          ],
        ),
      ),
    );
  }
}

final List<String> recommendedInsurance = ['vehicle', 'health', 'house', 'education'];
