import 'package:flutter/material.dart';
import 'package:kenburns_nullsafety/kenburns_nullsafety.dart';

class MyAppTemp extends StatelessWidget {
  final Widget child;
  const MyAppTemp({required this.child, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _buildBody();
  }

  Widget _buildBody() {
    return Stack(
      children: [
        _buildKenBurns(),
        Container(
          height: double.infinity,
          decoration: _buildContainerDecoration(),
          child: child,
        ),
      ],
    );
  }

  BoxDecoration _buildContainerDecoration() {
    return const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomCenter,
        colors: [
          Color.fromRGBO(234, 234, 234, 1.0),
          Color.fromRGBO(234, 234, 234, 1.0),
          Color.fromRGBO(234, 234, 234, 0.9),
          Color.fromRGBO(234, 234, 234, 0.9),
          Colors.white,
          Colors.white,
          Colors.white,
        ],
      ),
    );
  }

  Widget _buildKenBurns() {
    return KenBurns.multiple(
      childLoop: 2,
      maxScale: 1.1,
      children: [
        Image.asset(
          'assets/images/bkg_2.jpg',
          height: 300,
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/bkg_3.png',
          height: 300,
          fit: BoxFit.cover,
        ),
        Image.asset(
          'assets/images/bkg_2.jpg',
          height: 300,
          fit: BoxFit.cover,
        ),
      ],
    );
  }
}
