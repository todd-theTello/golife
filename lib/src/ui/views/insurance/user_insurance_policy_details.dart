part of 'insurance.dart';

/// user's policy details view
/// Show break down and further details of a selected policy of a user
class UserPolicyDetailView extends ConsumerStatefulWidget {
  /// constructor
  const UserPolicyDetailView({super.key});

  @override
  ConsumerState createState() => _MyPolicyDetailViewState();
}

class _MyPolicyDetailViewState extends ConsumerState<UserPolicyDetailView> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: const DefaultAppBar(title: 'Policy details'),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        children: [
          Container(
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
                    Column(
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
                          child: Text('EduFlex Insurance', style: kBody3(color: theme.colorScheme.onPrimary)),
                        ).centerLeftAlign().paddingOnly(bottom: 20),
                        Text('Policy number', style: kHeading2()),
                        Text('BBGDH0909871234657', style: kBody2()),
                      ],
                    ).expanded(),
                    SvgPicture.asset('assets/images/education-insurance.svg', height: 132)
                  ],
                ).paddingOnly(bottom: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserPolicyDetailsCardDetails(
                      title: 'Maturity date',
                      subtitle: DateFormat.yMMMEd().format(
                        DateTime.now().add(const Duration(days: 365 * 10)),
                      ),
                      icon: PhosphorIconsLight.tree,
                    ),
                    UserPolicyDetailsCardDetails(
                      title: 'Sum assured',
                      subtitle: NumberFormat.currency(symbol: 'GHS ').format(850000),
                      icon: Iconsax.money_recive,
                    ),
                    UserPolicyDetailsCardDetails(
                      title: 'Date issued',
                      subtitle: DateFormat.yMMMEd().format(DateTime.now()),
                      icon: Iconsax.calendar_2,
                    ),
                  ],
                )
              ],
            ),
          ).paddingOnly(bottom: 32),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Outstanding premium', style: kBody2()).paddingOnly(bottom: 4),
                  Text(
                    NumberFormat.currency(symbol: 'GHS ').format(0),
                    style: kBody1(color: theme.primaryColor, fontWeight: FontWeight.w500),
                  ),
                ],
              ).expanded(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Monthly premium', style: kBody2()).paddingOnly(bottom: 4),
                  Text(
                    NumberFormat.currency(symbol: 'GHS ').format(750),
                    style: kBody1(fontWeight: FontWeight.w500),
                  ),
                ],
              ).expanded(),
            ],
          ).paddingOnly(bottom: 32),
          Container(
            padding: const EdgeInsets.only(left: 24),
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
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total payments made', style: kHeading1()).paddingOnly(bottom: 8),
                    Text(
                      NumberFormat.currency(symbol: 'GHS ').format(750),
                      style: kBody1(fontWeight: FontWeight.w500),
                    ),
                  ],
                ).expanded(),
                SvgPicture.asset('assets/images/savings.svg').expanded(),
              ],
            ),
          ).paddingOnly(bottom: 32),
          Row(
            children: [
              Text('Recent transactions', style: kHeading2()),
              const Spacer(),
              ViewAllButton(onPressed: () {}),
            ],
          ).paddingOnly(bottom: 8),
          Text(
            'Here is a summary of your premium contribution for your policy.',
            style: kBody2(),
          ).paddingOnly(bottom: 24),
          ListView.separated(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF08141B).withOpacity(0.05),
                      offset: const Offset(0, 1),
                      blurRadius: 2,
                    ),
                  ],
                  color: theme.colorScheme.onSecondary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('MTN Mobile Money', style: kBody1(fontWeight: FontWeight.w500)),
                        Text(DateFormat.yMMMEd().format(DateTime.now()), style: kBody2()),
                      ],
                    ).expanded(),
                    CircleContainer(
                      padding: const EdgeInsets.all(4),
                      color: Colors.green.withOpacity(0.2),
                      child: const Icon(PhosphorIconsLight.arrowDownLeft, color: Colors.green, size: 16),
                    ).paddingOnly(right: 16),
                    Text(NumberFormat.currency(symbol: 'GHS ').format(750), style: kBody1())
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 12);
            },
            itemCount: 3,
          ),
        ],
      ),
    );
  }
}

/// User policy details card sub details widget
class UserPolicyDetailsCardDetails extends StatelessWidget {
  /// constructors
  const UserPolicyDetailsCardDetails({required this.title, required this.subtitle, required this.icon, super.key});

  /// Icon data to pass to icon widget
  final IconData icon;

  /// Title of the widget
  final String title;

  /// subtitle of the widget
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 28),
        Text(title, style: kBody2()),
        Text(subtitle, style: theme.textTheme.bodySmall),
      ],
    );
  }
}
