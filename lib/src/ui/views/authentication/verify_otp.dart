part of 'authentication.dart';

/// Verify OTP view. This view comes after entering sign up details
class VerifyOtpView extends StatefulHookConsumerWidget {
  /// constructor
  const VerifyOtpView({super.key});

  @override
  ConsumerState createState() => _VerifyOtpViewState();
}

class _VerifyOtpViewState extends ConsumerState<VerifyOtpView> {
  final ValueNotifier<int> seconds = ValueNotifier(60);

  void startTimer({int time = 60}) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value == 0) {
        timer.cancel();
      } else {
        seconds.value = seconds.value - 1;
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController otp = useTextEditingController();
    final ValueNotifier<bool> formIsValid = useValueNotifier(false);
    void checkForm() {
      formIsValid.value = otp.text.length == 6;
    }

    final theme = Theme.of(context);
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Column(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
            children: [
              Text('Enter code', style: kHeading1()).paddingOnly(bottom: 8),
              Text(
                'Enter the verification code we sent to your email te****@outlook.com',
                style: kBody2(),
              ).paddingOnly(bottom: 36),
              PinCodeTextField(
                appContext: context,
                controller: otp,
                length: 6,
                autoFocus: true,
                onChanged: (_) {
                  checkForm();
                },
                keyboardType: TextInputType.number,
                useHapticFeedback: true,
                pinTheme: PinTheme(
                  activeColor: theme.primaryColor,
                  inactiveColor: theme.dividerColor,
                  fieldOuterPadding: EdgeInsets.zero,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                ),
              ).paddingOnly(bottom: 12),
              ValueListenableBuilder(
                  valueListenable: seconds,
                  builder: (context, time, _) {
                    return RichTextWidget(
                      texts: [
                        if (time == 0)
                          BaseText.custom(
                              text: 'Resend code',
                              onTapped: () {
                                seconds.value = 60;
                                startTimer();
                              })
                        else ...[
                          BaseText.plain(text: 'Resend OTP in  '),
                          BaseText.custom(text: time.toHHMMSS),
                        ],
                      ],
                      styleForAll: kBody2(fontWeight: FontWeight.w500, color: theme.colorScheme.onSurfaceVariant),
                      customStyle: kBody2(fontWeight: FontWeight.w600, color: kPrimaryColor100).copyWith(
                        decoration: TextDecoration.underline,
                        decorationColor: theme.primaryColor,
                      ),
                      textAlign: TextAlign.center,
                    );
                  }),
            ],
          ).expanded(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ValueListenableBuilder(
                    valueListenable: formIsValid,
                    builder: (context, valid, _) {
                      return FilledButton(
                        onPressed: valid
                            ? () {
                                ref.read(authorizationStateProvider.notifier).setLoggedIn();
                              }
                            : null,
                        child: const Text('Send link'),
                      ).paddingOnly(bottom: 15);
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
