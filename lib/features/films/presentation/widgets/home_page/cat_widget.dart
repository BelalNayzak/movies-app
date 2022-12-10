import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CatWidget extends StatelessWidget {
  final String cat;
  final String img;

  const CatWidget({required this.cat, required this.img, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 5,
        clipBehavior: Clip.antiAlias,
        shadowColor: Colors.redAccent,
        child: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Image.network(
                img,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: size.width * 0.3,
              height: 50,
              color: const Color.fromRGBO(255, 74, 74, 0.95),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              top: 0,
              child: Center(
                child: Text(
                  cat,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
