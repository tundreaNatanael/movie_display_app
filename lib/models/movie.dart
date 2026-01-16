class Movie {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final String backdropPath;
  final double voteAverage;
  final String releaseDate;
  final List<int> genreIds;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.voteAverage,
    required this.releaseDate,
    required this.genreIds,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    // Parse API payload with safe defaults.
    return Movie(
      id: json['id'] ?? 0,
      title: json['title'] ?? 'Unknown Title',
      overview: json['overview'] ?? 'No overview available.',
      posterPath: json['poster_path'] ?? '',
      backdropPath: json['backdrop_path'] ?? '',
      voteAverage: (json['vote_average'] ?? 0).toDouble(),
      releaseDate: json['release_date'] ?? 'Unknown',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
    );
  }

  String get fullPosterPath {
    if (posterPath.isEmpty) return '';
    return posterPath;
  }

  String get fullBackdropPath {
    if (backdropPath.isEmpty) return '';
    return backdropPath;
  }

  String get year {
    if (releaseDate.isEmpty || releaseDate == 'Unknown') return '';
    return releaseDate.split('-').first;
  }

  static List<Movie> getHardcodedMovies() {
    return [
      Movie(
        id: 1,
        title: 'The Shawshank Redemption',
        overview:
            'Imprisoned in the 1940s for the double murder of his wife and her lover, upstanding banker Andy Dufresne begins a new life at the Shawshank prison, where he puts his accounting skills to work for an arbitrary warden.',
        posterPath: 'assets/imdb_pictures/main/main1.jpg',
        backdropPath: 'assets/imdb_pictures/backdrop/back1.jpg',
        voteAverage: 8.7,
        releaseDate: '1994-09-23',
        genreIds: [18, 80],
      ),
      Movie(
        id: 2,
        title: 'The Godfather',
        overview:
            'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When the aging patriarch Vito Corleone decides to hand his empire to his reluctant youngest son Michael, sparking a violent mob war.',
        posterPath: 'assets/imdb_pictures/main/main2.jpg',
        backdropPath: 'assets/imdb_pictures/backdrop/back2.jpg',
        voteAverage: 8.7,
        releaseDate: '1972-03-14',
        genreIds: [18, 80],
      ),
      Movie(
        id: 3,
        title: 'The Dark Knight',
        overview:
            'Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets.',
        posterPath: 'assets/imdb_pictures/main/main3.jpg',
        backdropPath: 'assets/imdb_pictures/backdrop/back3.jpeg',
        voteAverage: 8.5,
        releaseDate: '2008-07-16',
        genreIds: [18, 28, 80],
      ),
      Movie(
        id: 4,
        title: 'Pulp Fiction',
        overview:
            'A burger-loving hit man, his philosophical partner, a drug-addled gangster\'s moll and a washed-up boxer converge in this sprawling, comedic crime caper.',
        posterPath: 'assets/imdb_pictures/main/main4.jpg',
        backdropPath: 'assets/imdb_pictures/backdrop/back4.jpg',
        voteAverage: 8.5,
        releaseDate: '1994-09-10',
        genreIds: [53, 80],
      ),
      Movie(
        id: 5,
        title: 'Forrest Gump',
        overview:
            'A man with a low IQ has accomplished great things in his life and been present during significant historic events—in each case, far exceeding what anyone imagined he could do.',
        posterPath: 'assets/imdb_pictures/main/main5.jpg',
        backdropPath: 'assets/imdb_pictures/backdrop/back5.jpg',
        voteAverage: 8.5,
        releaseDate: '1994-06-23',
        genreIds: [35, 18, 10749],
      ),
      Movie(
        id: 6,
        title: 'Inception',
        overview:
            'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible.',
        posterPath: 'assets/imdb_pictures/main/main6.jpg',
        backdropPath: 'assets/imdb_pictures/backdrop/back6.jpg',
        voteAverage: 8.4,
        releaseDate: '2010-07-15',
        genreIds: [28, 878, 12],
      ),
      Movie(
        id: 7,
        title: 'The Matrix',
        overview:
            'Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.',
        posterPath: 'assets/imdb_pictures/main/main7.jpg',
        backdropPath: 'assets/imdb_pictures/backdrop/back7.jpeg',
        voteAverage: 8.2,
        releaseDate: '1999-03-30',
        genreIds: [28, 878],
      ),
      Movie(
        id: 8,
        title: 'Interstellar',
        overview:
            'The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.',
        posterPath: 'assets/imdb_pictures/main/main8.jpg',
        backdropPath: 'assets/imdb_pictures/backdrop/back8.jpg',
        voteAverage: 8.4,
        releaseDate: '2014-11-05',
        genreIds: [12, 18, 878],
      ),
      Movie(
        id: 9,
        title: 'Fight Club',
        overview:
            'A ticking-Loss bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground fight clubs forming in every town.',
        posterPath: 'assets/imdb_pictures/main/main9.jpg',
        backdropPath: 'assets/imdb_pictures/backdrop/back9.jpg',
        voteAverage: 8.4,
        releaseDate: '1999-10-15',
        genreIds: [18],
      ),
      Movie(
        id: 10,
        title: 'Gladiator',
        overview:
            'In the year 180, the death of emperor Marcus Aurelius throws the Roman Empire into chaos. Maximus is one of the Roman army\'s most capable and trusted generals and a key advisor to the emperor.',
        posterPath: 'assets/imdb_pictures/main/main10.jpg',
        backdropPath: 'assets/imdb_pictures/backdrop/back10.jpg',
        voteAverage: 8.2,
        releaseDate: '2000-05-04',
        genreIds: [28, 18, 12],
      ),
    ];
  }
}
