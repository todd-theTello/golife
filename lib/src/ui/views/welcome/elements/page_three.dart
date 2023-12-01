part of 'welcome_elements.dart';

///
class PageThreeElement extends StatelessWidget {
  ///
  const PageThreeElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/plan.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned.fill(
          child: ColoredBox(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
        SafeArea(
          child: Column(
            children: [
              Text(
                'Digital Disruption',
                style: kHeading1(fontWeight: FontWeight.w600, color: Colors.white).copyWith(fontSize: 64),
              ).paddingOnly(top: 120, bottom: 8),
              Text(
                'We leverage on modern technology to give you the best experience, so sit back and relax',
                style: kBody1(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ],
          ),
        ).paddingSymmetric(horizontal: 24),
      ],
    );
  }
}
