import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mina_pharma_task_movie/features/films/presentation/widgets/home_page/carousal_films_highlights.dart';

import '../../../../core/fake_data_bank/fake_data_bank.dart';
import '../widgets/home_page/cat_widget.dart';
import '../widgets/shared/film_widget.dart';
import 'films_page.dart';

class HomePage extends StatelessWidget {
  static const id = 'HomePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: _buildBody(context)),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody(context) {
    return Column(
      children: [
        _buildAppBar(),
        const Expanded(
          flex: 50,
          child: CarousalFilmsHighlights(),
        ),
        _buildCats(),
        Expanded(
          flex: 65,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildSectionHeading(
                  'Top Movies',
                  () => Navigator.pushNamed(context, FilmsPage.id),
                ),
                _buildTopMovies(context),
                // _buildSectionHeading('Most Popular', () {}),
                // _buildTrendingMovies(context),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          Text('Hi, Belal'),
          IconButton(
            onPressed: () {
              // TODO: logout with block listener
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }

  Widget _buildCats() {
    return SizedBox(
      height: 65,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children:
            cats.map((c) => CatWidget(cat: c['cat'], img: c['img'])).toList(),
      ),
    );
  }

  Widget _buildTopMovies(context) {
    return CarouselSlider(
      options: CarouselOptions(
        pageSnapping: true,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        enableInfiniteScroll: true,
        viewportFraction: 0.3,
        height: MediaQuery.of(context).size.height * 0.3,
        autoPlay: false,
        // pauseAutoPlayOnTouch: true,
        onPageChanged: (index, _) {},
      ),
      items: topMovies
          .map((e) => FilmWidget(
                name: '',
                img: e['img']!,
              ))
          .toList(),
    );
  }

  Widget _buildSectionHeading(String txt, Function action) {
    return Row(
      children: [
        Text(
          txt,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () => action(),
          icon: const Icon(
            Icons.arrow_forward,
            size: 20,
          ),
        ),
      ],
    );
  }
}
