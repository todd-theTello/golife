part of 'authentication.dart';

/// Create the sign in view.
/// This is where existing users perform authentication action to get into the app

class SignInView extends HookConsumerWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController email = useTextEditingController();
    final TextEditingController password = useTextEditingController();

    return Scaffold();
  }
}
