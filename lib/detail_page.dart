import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'movie.dart';

class DetailPage extends StatelessWidget {
  final Movie movie;

  const DetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Container(
        color: Colors.grey[900],
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w400${movie.posterPath}',
                    fit: BoxFit.cover,
                    
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.movie, size: 100);
                    },
                  ),
                ),
                Gap(20),
                Center(
                  child: Text(
                    movie.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                Gap(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 24),
                    Gap(8),
                    Text(
                      'Nota: ${movie.voteAverage.toString()}/10',
                      style: const TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ],
                ),
                Gap(20),
                const Text(
                  'Sinopse',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                Text(
                  movie.overview,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
