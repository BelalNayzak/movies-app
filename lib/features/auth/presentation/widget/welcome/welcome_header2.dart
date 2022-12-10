import 'package:flutter/material.dart';
import 'package:kenburns_nullsafety/kenburns_nullsafety.dart';
import 'package:mina_pharma_task_movie/features/auth/presentation/widget/welcome/rotation_animated_text.dart';

class WelcomeHeader2 extends StatelessWidget {
  const WelcomeHeader2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 280,
          child: KenBurns.multiple(
            childLoop: 2,
            maxScale: 1.1,
            children: [
              Image.asset(
                'assets/images/bkg_2.jpg',
                height: 300,
                fit: BoxFit.cover,
              ),
              Image.asset(
                'assets/images/bkg_4.jpg',
                height: 300,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            padding: EdgeInsets.only(right: 10, left: 15, bottom: 5),
            height: 800,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topRight,
                colors: [
                  Colors.white60,
                  Colors.white60,
                  Colors.white,
                  Color.fromRGBO(147, 144, 144, 1),
                  Color.fromRGBO(100, 96, 96, 1.0),
                  Color.fromRGBO(115, 92, 92, 0.9019607843137254),
                  Color.fromRGBO(147, 144, 144, 0.7019607843137254),
                  Color.fromRGBO(147, 144, 144, 0.7019607843137254),
                  Color.fromRGBO(147, 144, 144, 0.7019607843137254),
                  Color.fromRGBO(138, 134, 134, 0.5019607843137255),
                ],
              ),
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, top: 50),
          child: RotationAnimatedText(
            txtColor: Colors.white,
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
