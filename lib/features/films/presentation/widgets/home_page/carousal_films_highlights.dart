import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../core/fake_data_bank/fake_data_bank.dart';
import '../shared/film_widget.dart';

class CarousalFilmsHighlights extends StatelessWidget {
  const CarousalFilmsHighlights({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
          options: CarouselOptions(
            pageSnapping: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            enableInfiniteScroll: true,
            viewportFraction: 0.9,
            height: MediaQuery.of(context).size.height * 0.32,
            autoPlay: true,
            pauseAutoPlayOnTouch: true,
            onPageChanged: (index, _) {},
          ),
          items: moviesOfTheWeek
              .map((e) => FilmWidget(
                    name: e['name']!,
                    img: e['img']!,
                  ))
              .toList(),
        ),
      ],
    );
  }
}
