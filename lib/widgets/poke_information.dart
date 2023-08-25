import 'package:flutter/material.dart';
import 'package:flutter_pokedex/constants/constants.dart';
import 'package:flutter_pokedex/constants/ui_helper.dart';
import 'package:flutter_pokedex/models/pokemon_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PokeInformation extends StatelessWidget {
  final Pokemon pokemon;
  const PokeInformation({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.w)),
        color: Colors.white,
      ),
      child: Padding(
        padding: UIHelper.getDefaultPadding(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _builInformationRow("Name", pokemon.name),
            _builInformationRow("Height", pokemon.height),
            _builInformationRow("Weight", pokemon.weight),
            _builInformationRow("Spawn Time", pokemon.spawnTime),
            _builInformationRow("Weakness", pokemon.weaknesses),
            _builInformationRow("Pre Evolution", pokemon.prevEvolution),
            _builInformationRow("Next Evoluton", pokemon.nextEvolution),
          ],
        ),
      ),
    );
  }

  _builInformationRow(String label, dynamic value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: Constants.pokeInfoLabelTextStyle,
        ),
        if (value is List && value.isNotEmpty)
          Text(
            value.join(", ").toString(),
            style: Constants.pokeInfoTextStyle,
          )
        else if (value == null)
          Text(
            "Not Avaible",
            style: Constants.pokeInfoTextStyle,
          )
        else
          Text(
            value,
            style: Constants.pokeInfoTextStyle,
          )
      ],
    );
  }
}
