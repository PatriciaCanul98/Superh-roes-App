// Aqui va el modelo de datos que recibe el json, es response porque son datos que nos llega de backend o internet.

import 'package:superhero_app/data/model/superhero_detail_response.dart';

class SuperheroResponse {
  final String response;
  final List<SuperheroDetailResponse> results;

// Este es un constructor que crea la clase SuperheroResponse
  SuperheroResponse({required this.response, required this.results});

// Convierte el json recibido en un modelo de datos
  factory SuperheroResponse.fromJson(Map<String, dynamic> json) {

    var list = json['results'] as List;
    List<SuperheroDetailResponse> heroList = 
        list.map((hero) => SuperheroDetailResponse.fromJson(hero)).toList();

    return SuperheroResponse(response: json['response'], results: heroList); // busca dentro del json el campo response y lo asigna a response
  }
}