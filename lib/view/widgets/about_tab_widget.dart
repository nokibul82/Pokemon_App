import 'package:flutter/material.dart';
import 'package:pokemon_app/models/pokemon_model.dart';

class AboutTabWidget extends StatelessWidget {
  const AboutTabWidget({super.key, required this.pokemon});

  final PokemonModel pokemon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Information about ${pokemon.name} ',
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 80,
                child: Text(
                  'Species',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 25),
              Text(pokemon.species!.name,style: const TextStyle(fontSize: 20,),),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 80,
                child: Text(
                  'Weight',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 25),
              Text("${pokemon.weight! / 10} KG",style: const TextStyle(fontSize: 20,),),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 80,
                child: Text(
                  'Height',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 25),
              Text("${pokemon.height! / 10} m",style: const TextStyle(fontSize: 20,),),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 80,
                child: Text(
                  'Abilities',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(width: 25),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: pokemon.abilities!
                      .map((e) => Text(e.ability.name,style: const TextStyle(fontSize: 20,),))
                      .toList()),
            ],
          ),
        ],
      ),
    );
  }
}
