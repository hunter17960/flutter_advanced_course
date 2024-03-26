import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_course/core/helpers/extensions.dart';
import 'package:flutter_advanced_course/core/routing/routes.dart';

import '../../../../core/theming/styles.dart';

class DoNotHaveAccountText extends StatelessWidget {
  const DoNotHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyles.font13DarkBlueRegular,
          ),
          TextSpan(
              text: ' Sign Up',
              style: TextStyles.font13BlueSemiBold,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  context.pushReplacementNamed(Routes.signUpScreen);
                }),
        ],
      ),
    );
  }
}