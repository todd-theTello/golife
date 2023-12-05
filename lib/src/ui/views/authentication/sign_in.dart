part of 'authentication.dart';

/// Create the sign in view.
/// This is where existing users perform authentication action to get into the app

class SignInView extends HookConsumerWidget with InputValidationMixin {
  /// constructor
  SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController email = useTextEditingController();
    final TextEditingController password = useTextEditingController();
    final ValueNotifier<bool> formIsValid = ValueNotifier(false);
    final ValueNotifier<bool> keepSignedIn = ValueNotifier(false);
    final ValueNotifier<bool> enableBiometrics = ValueNotifier(false);

    void checkForm() {
      formIsValid.value = isEmailValid(email: email.text.trim()) && validPassword(passwordText: password.text.trim());
    }

    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(24, 160, 24, 24),
            children: [
              Text('Welcome!', style: kHeading1()),
              Text(
                'Sign in to your account here',
                style: kBody2(),
              ).paddingOnly(bottom: 36),
              DefaultTextField(
                controller: email,
                labelText: 'Email ',
                hintText: 'Enter your email address',
                onChanged: checkForm,
                errorText: 'Please enter a valid email address',
              ).paddingOnly(bottom: 16),
              DefaultTextField(
                controller: password,
                labelText: 'Password',
                hintText: 'Enter your password',
                onChanged: checkForm,
                errorText: 'Please enter a valid email address',
              ).paddingOnly(bottom: 8),
              CustomAnimatedScale(
                onPressed: () {
                  context.goNamed('forgot-password');
                },
                child: Text(
                  'Forgot your password?',
                  style: kBody3(color: theme.primaryColor),
                ),
              ).centerRightAlign().paddingOnly(bottom: 32),
              Row(
                children: [
                  const Divider().expanded(),
                  const Text('Or').paddingSymmetric(horizontal: 16),
                  const Divider().expanded()
                ],
              ).paddingOnly(bottom: 16),
              OutlinedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/apple.svg',
                  height: 16,
                ),
                label: const Text('Sign in with Apple'),
              ).paddingOnly(bottom: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/google.svg',
                  height: 16,
                ),
                label: const Text('Sign in with Google'),
              ).paddingOnly(bottom: 32),
              Row(
                children: [
                  Text(
                    'Keep me signed in',
                    style: kBody2(),
                  ),
                  const Spacer(),
                  ValueListenableBuilder(
                      valueListenable: keepSignedIn,
                      builder: (context, keep, _) {
                        return CupertinoSwitch(
                            activeColor: theme.primaryColor,
                            value: keep,
                            onChanged: (_) {
                              keepSignedIn.value = !keepSignedIn.value;
                            });
                      })
                ],
              ).paddingOnly(bottom: 24),
              Row(
                children: [
                  Text(
                    'Enable Face ID/Fingerprint',
                    style: kBody2(),
                  ),
                  const Spacer(),
                  ValueListenableBuilder(
                      valueListenable: enableBiometrics,
                      builder: (context, enabled, _) {
                        return CupertinoSwitch(
                            activeColor: theme.primaryColor,
                            value: enabled,
                            onChanged: (_) {
                              enableBiometrics.value = !enableBiometrics.value;
                            });
                      })
                ],
              ).paddingOnly(bottom: 112),
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
                        onPressed: valid ? () {} : null,
                        child: const Text('Sign in'),
                      ).paddingOnly(bottom: 15);
                    }),
                RichTextWidget(
                  texts: [
                    const BaseText(text: "Don't have an account? "),
                    BaseText.custom(
                      text: 'Sign up',
                      underlined: true,
                      onTapped: () async {
                        await ref.read(authorizationStateProvider.notifier).setOnboarded(isLoginPage: false);
                      },
                    ),
                  ],
                  textAlign: TextAlign.center,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
