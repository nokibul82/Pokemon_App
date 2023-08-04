import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/pokemon_model.dart';

class PokemonController extends GetxController
    with StateMixin<List<PokemonModel>> {

  @override
  void onInit() {
    getPokemons();
    super.onInit();
  }

  Future<void> getPokemons() async {
    List<PokemonModel> tempList = [];
    for (int index = 1; index <= 10; index++) {
      int pokeIndex;
      Random rnd;
      int min = 1;
      int max = 150;
      rnd = Random();
      pokeIndex = min + rnd.nextInt(max - min);
      try {
        Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokeIndex');
        final response = await http.get(url);
        Future.delayed(const Duration(seconds: 2));
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        tempList.add(PokemonModel.fromJson(responseData));
        change(tempList, status: RxStatus.success());
      } catch (e) {
        print("=================================");
        print(e.toString() + " Error from getPokemons()");
      }
    }
  }
  void refreshPage(){
    change([],status: RxStatus.loading());
    getPokemons();
  }
}
