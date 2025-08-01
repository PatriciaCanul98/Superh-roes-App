/* Repositorio que va a acceder a internet
Tendrá un método que recupera el json y lo convierte en un moodelo de datos
que entienda la aplicación y lo devuelve a superhero_searchy*/

// Para consumir apis o backends hay que mofificar el archivo pubspec.yaml

import 'dart:convert';

import 'package:superhero_app/data/model/superhero_response.dart';
import 'package:http/http.dart' as http;

 class Repository {
   // Future va a devolver algo en un futuro que va a llegar.
   /* async pide la información por un hilo secundario mientras la app sigue funcionando
   Si no se usa async, la app se bloquea hasta que la información llegue*/

   Future<SuperheroResponse?> fectchSuperheroInfo(String name) async {
    final response = await http.get(Uri.parse(
      'https://superheroapi.com/api/37e5e85056f568a7a37e519e809ccc9e/search/$name'
    ));

  // Se verifica si el status code es 200 y si es asi lo decodifica o corrió bien
    if(response.statusCode == 200) {
      var decodedJson = jsonDecode(response.body);
      SuperheroResponse superheroResponse = SuperheroResponse.fromJson(decodedJson);
      return superheroResponse;
    }else{
      return null;
    }
   }
}