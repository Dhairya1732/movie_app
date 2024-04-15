import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    fetchMovies();
  }

  Future<void> fetchMovies() async {
    const apiKey = "cd80e15a24757034c7e288c3ffffad57";
    const url = "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        movies = jsonResponse["results"];
      });
    } else {
      throw Exception('Failed to load movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movie App"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
              itemCount: movies.length,
              itemBuilder: (BuildContext context, int index) {
                final movie = movies[index];
                return ListTile(
                  title: Text(movie["title"]),
                  subtitle: Text(movie["overview"]),
                  leading: Image.network(
                    "https://image.tmdb.org/t/p/w200${movie["poster_path"]}",
                    width: 50,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
