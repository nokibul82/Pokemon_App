import 'dart:convert';
import 'dart:math';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/pokemon_model.dart';

class PokemonController extends GetxController
    with StateMixin<List<PokemonModel>> {
  // Pagination variables
  final RxInt currentPage = 1.obs;
  final int itemsPerPage = 10;
  int itemCount = 0;

  @override
  void onInit() {
    // getPokemonItemCount();
    getPokemons();
    super.onInit();
  }

  // Future<void> getPokemonItemCount() async {
  //   try {
  //     Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon');
  //     final response = await http.get(url);
  //     final responseData = json.decode(response.body) as Map<String, dynamic>;
  //     itemCount = responseData['count'];
  //     print(responseData['count']);
  //   } catch (e) {
  //     print("=================================");
  //     print(e.toString() + " Error from getPokemonItemCount Function");
  //   }
  // }

  Future<void> getPokemons() async {
    List<PokemonModel> tempList = [];
    for (int index = 1; index < itemsPerPage * currentPage.value; index++) {
      int pokeIndex;
      Random rnd;
      int min = 1;
      int max = 300;
      rnd = Random();
      pokeIndex = min + rnd.nextInt(max - min);
      try {
        Uri url = Uri.parse('https://pokeapi.co/api/v2/pokemon/$pokeIndex');
        Future.delayed(const Duration(seconds: 2));
        final response = await http.get(url);
        final responseData = json.decode(response.body) as Map<String, dynamic>;
        print(responseData.length);
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
