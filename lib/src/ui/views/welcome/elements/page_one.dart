part of 'welcome_elements.dart';

///
class PageOneElement extends StatelessWidget {
  ///
  const PageOneElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/insurance.jpeg'),
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
                'A Market Place',
                style: kHeading1(fontWeight: FontWeight.w600, color: Colors.white).copyWith(fontSize: 65),
              ).paddingOnly(top: 120, bottom: 8),
              Text(
                'All Your Financial Needs in one place from insurance, financial planning and investment.',
                style: kBody1(fontWeight: FontWeight.w500, color: Colors.white),
              ),
            ],
          ),
        ).paddingSymmetric(horizontal: 24),
      ],
    );
  }
}
