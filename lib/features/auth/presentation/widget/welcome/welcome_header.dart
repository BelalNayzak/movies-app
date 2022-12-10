import 'package:flutter/material.dart';
import 'package:mina_pharma_task_movie/features/auth/presentation/widget/welcome/rotation_animated_text.dart';

class WelcomeHeader extends StatelessWidget {
  const WelcomeHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Opacity(
            opacity: 0.2,
            child: Image.asset(
              'assets/images/bkg_1.png',
              width: double.infinity,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, top: 50),
          child: RotationAnimatedText(
            txtColor: Colors.redAccent,
            txtSize: 20,
            fixedTxt: '',
            animatedTxts: [
              'YOUR',
              'BEST',
              'MOVIES',
            ],
          ),
        ),
      ],
    );
  }
}
