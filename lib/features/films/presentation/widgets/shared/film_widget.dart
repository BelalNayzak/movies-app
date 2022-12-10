import 'package:flutter/material.dart';

class FilmWidget extends StatelessWidget {
  final String name;
  final String img;

  const FilmWidget({
    required this.name,
    required this.img,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Card(
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        elevation: 10,
        color: Colors.white,
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                top: 0,
                right: 0,
                left: 0,
                child: Opacity(
                  opacity: 0.7,
                  child: Image.network(img, fit: BoxFit.cover),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                    bottom: 20,
                    top: 10,
                    right: 15,
                  ),
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(100, 100, 100, 0.5),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                    ),
                  ),
                  child: Text(
                    name,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: false,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
