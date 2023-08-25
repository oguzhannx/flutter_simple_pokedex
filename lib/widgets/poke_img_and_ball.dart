import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeImageAndBall extends StatelessWidget {
  final Pokemon pokemon;
  const PokeImageAndBall({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: Image.asset(
            Constants.titleImage,
            fit: BoxFit.fitHeight,
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Hero(
            tag: pokemon.id.toString(),
            child: CachedNetworkImage(
              errorWidget: (context, url, error) =>
                  Image.asset(Constants.titleImage.toString()),
              imageUrl: pokemon.img.toString(),
              width: UIHelper.calculatePokeImageAndBallSize(),
              height: 0.25.sh,
              fit: BoxFit.fitHeight,
              placeholder: (context, url) => CircularProgressIndicator(
                  color: Colors.grey.withOpacity(0.8)),
            ),
          ),
        ),
      ],
    );
  }
}
