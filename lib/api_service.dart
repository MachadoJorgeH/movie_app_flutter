import 'dart:convert';
import 'package:http/http.dart' as http;
import 'movie.dart'; 

class ApiService {
  final String _apiKey = '2c69e0b47eb816a5314722b01eac56b4';
  final String _baseUrl = 'https://api.themoviedb.org/3';

  Future<List<Movie>> fetchPopularMovies() async {
    final response = await http.get(Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey&language=pt-BR'));

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      // A lista de filmes vem dentro da chave 'results'
      final List<dynamic> movieJsonList = json['results'];
      
      // Converte cada item JSON em um objeto Movie
      return movieJsonList.map((movieJson) => Movie.fromJson(movieJson)).toList();
    } else {
      throw Exception('Falha ao carregar os filmes');
    }
  }
}