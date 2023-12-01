part of 'authentication.dart';

class ForgotPasswordView extends HookConsumerWidget with InputValidationMixin {
  ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController email = useTextEditingController();
    final ValueNotifier<bool> formIsValid = ValueNotifier(false);

    void checkForm() {
      formIsValid.value = isEmailValid(email: email.text);
    }

    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Column(
        children: [
          ListView(
            padding: const EdgeInsets.fromLTRB(20, 48, 20, 24),
            children: [
              Text('Forgot password?', style: kHeading1()),
              Text(
                'If an account exist with the provided email, a password reset link will be sent to it.',
                style: kBody2(),
              ).paddingOnly(bottom: 36),
              DefaultTextField(
                controller: email,
                labelText: 'Email ',
                hintText: 'Enter your email address',
                onChanged: checkForm,
                errorText: 'Please enter a valid email address',
              )
            ],
          ).expanded(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ValueListenableBuilder(
                    valueListenable: formIsValid,
                    builder: (context, valid, _) {
                      return FilledButton(
                        onPressed: valid ? () {} : null,
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
