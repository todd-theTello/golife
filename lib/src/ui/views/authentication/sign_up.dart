part of 'authentication.dart';

/// Create the sign in view.
/// This is where existing users perform authentication action to get into the app

class SignUpView extends HookConsumerWidget with InputValidationMixin {
  /// constructor
  SignUpView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController email = useTextEditingController();
    final TextEditingController fullName = useTextEditingController();
    final TextEditingController password = useTextEditingController();
    final TextEditingController confirmPassword = useTextEditingController();
    final ValueNotifier<bool> formIsValid = useValueNotifier(false);

    final ValueNotifier<bool> enableBiometrics = useValueNotifier(false);

    void checkForm() {
      formIsValid.value = fullName.text.trim().isNotEmpty &&
          isEmailValid(email: email.text.trim()) &&
          validPassword(passwordText: password.text.trim()) &&
          (password.text.trim() == confirmPassword.text.trim());
    }

    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(24, 160, 24, 24),
            children: [
              Text("Let's get started", style: kHeading1()),
              Text(
                'First, create your account here',
                style: kBody2(),
              ).paddingOnly(bottom: 36),
              DefaultTextField(
                controller: fullName,
                labelText: 'Full name',
                hintText: 'Enter your full name',
                onChanged: checkForm,
                errorText: 'Full name cannot be empty',
              ).paddingOnly(bottom: 16),
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
              ).paddingOnly(bottom: 32),
              DefaultTextField(
                controller: confirmPassword,
                labelText: 'Confirm password',
                hintText: 'Retype your password',
                onChanged: checkForm,
                errorText: 'Passwords do not match',
              ).paddingOnly(bottom: 32),
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
                label: const Text('Sign up with Apple'),
              ).paddingOnly(bottom: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/images/google.svg',
                  height: 16,
                ),
                label: const Text('Sign up with Google'),
              ).paddingOnly(bottom: 32),
              Row(
                children: [
                  Text('Enable Face ID/Fingerprint', style: kBody2()),
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
                        onPressed: valid
                            ? () {
                                context.goNamed('verify-otp');
                              }
                            : null,
                        child: const Text('Sign up'),
                      ).paddingOnly(bottom: 15);
                    }),
                RichTextWidget(
                  texts: [
                    const BaseText(text: "Don't have an account? "),
                    BaseText.custom(
                        text: 'Sign in',
                        underlined: true,
                        onTapped: () async {
                          await ref.read(authorizationStateProvider.notifier).setOnboarded();
                        }),
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
