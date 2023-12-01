part of 'welcome_elements.dart';

///
class PageTwoElement extends StatelessWidget {
  ///
  const PageTwoElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/financial-plan.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: ColoredBox(
            color: Colors.black.withOpacity(0.6),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Text(
                'Plan your finances with us',
                style: kHeading1(fontWeight: FontWeight.w600, color: Colors.white).copyWith(fontSize: 64),
              ).paddingOnly(top: 120, bottom: 8),
              Text(
                'Take Control of Your Financial Life and make the most out of it.',
                style: kBody1(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ],
          ),
        ).paddingSymmetric(horizontal: 24),
      ],
    );
  }
}
