import 'package:flutter/material.dart';

class BkgWidget extends StatelessWidget {
  const BkgWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Opacity(
              opacity: 0.03,
              child: Image.asset(
                'assets/images/bkg_1.png',
                width: double.infinity,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 40, left: 20),
            child: Opacity(
              opacity: 0.03,
              child: Image.asset(
                'assets/images/bkg_1.png',
                width: double.infinity,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
