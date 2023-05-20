import 'dart:convert';

import 'package:http/http.dart' as http;

getAPI() async{
    var url = Uri.parse('https://dummyjson.com/products');
    var response = await http.get(url);

    if(response.statusCode == 200){
      print('Conectado com sucesso!');
    var data = await jsonDecode(response.body);
    return data;

  }else{
    throw Exception('Falha ao conectar com a API!');
  }
}