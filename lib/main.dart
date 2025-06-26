import 'package:flutter/material.dart';
import 'api_service.dart';
import 'movie.dart';
import 'detail_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CineGyn',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Instância do serviço e variável de estado
  final ApiService _apiService = ApiService();
  late Future<List<Movie>> _popularMoviesFuture;

  //Chamada à API no initState
  @override
  void initState() {
    super.initState();
    _popularMoviesFuture = _apiService.fetchPopularMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Text('CineGyn - Filmes Populares')),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: FutureBuilder<List<Movie>>(
        future: _popularMoviesFuture, // O Future que queremos "observar"
        builder: (context, snapshot) {
          return Container(
            color: Colors.grey[900], // Define a cor de fundo
            child: snapshot.connectionState == ConnectionState.waiting
                ? const Center(child: CircularProgressIndicator())
                : snapshot.hasError
                    ? Center(child: Text('Erro: ${snapshot.error}'))
                    : snapshot.hasData
                        ? ListView.builder(
                            itemCount: snapshot.data!.length, // O número de itens na lista
                            itemBuilder: (context, index) {
                              final movie = snapshot.data![index]; // Pega o filme da posição atual

                              // Retorna o widget que representa um filme na lista
                              return Card(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 8,
                                  horizontal: 16,
                                ),
                                child: ListTile(
                                  leading: Container(
                                    width: 70,
                                    height: 70,
                                    child: ClipRRect(
                                      borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                                      child: Image.network(
                                        'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                                        fit: BoxFit.cover,
                                        width: 70,
                                        // Mostra um loading enquanto a imagem do pôster carrega
                                        loadingBuilder: (context, child, loadingProgress) {
                                          if (loadingProgress == null) return child;
                                          return const Center(
                                            child: CircularProgressIndicator(),
                                          );
                                        },
                                        // Mostra um ícone de erro se a imagem falhar
                                        errorBuilder: (context, error, stackTrace) {
                                          return const Icon(Icons.movie, size: 50);
                                        },
                                      ),
                                    ),
                                  ),
                                  title: Text(
                                    movie.title,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text('Nota: ${movie.voteAverage.toString()}'),
                                  onTap: () {
                                    // O Navigator "empurra" uma nova rota (tela) para a pilha de navegação
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        // A nova tela a ser construída é a DetailPage
                                        builder: (context) => DetailPage(movie: movie),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          )
                        : const Center(child: Text('Nenhum filme encontrado.')),
          );
        },
      ),
    );
  }
}
