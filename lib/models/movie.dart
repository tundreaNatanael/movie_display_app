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
    // Build full TMDB image URL when a path exists.
    if (posterPath.isEmpty) return '';
    return 'https://image.tmdb.org/t/p/w500$posterPath';
  }

  String get fullBackdropPath {
    if (backdropPath.isEmpty) return '';
    return 'https://image.tmdb.org/t/p/w780$backdropPath';
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
        posterPath: '/9cqNxx0GxF0bflZmeSMuL5tnGzr.jpg',
        backdropPath: '/kXfqcdQKsToO0OUXHcrrNCHDBzO.jpg',
        voteAverage: 8.7,
        releaseDate: '1994-09-23',
        genreIds: [18, 80],
      ),
      Movie(
        id: 2,
        title: 'The Godfather',
        overview:
            'Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When the aging patriarch Vito Corleone decides to hand his empire to his reluctant youngest son Michael, sparking a violent mob war.',
        posterPath: '/3bhkrj58Vtu7enYsRolD1fZdja1.jpg',
        backdropPath: '/tmU7GeKVybMWFButWEGl2M4GeiP.jpg',
        voteAverage: 8.7,
        releaseDate: '1972-03-14',
        genreIds: [18, 80],
      ),
      Movie(
        id: 3,
        title: 'The Dark Knight',
        overview:
            'Batman raises the stakes in his war on crime. With the help of Lt. Jim Gordon and District Attorney Harvey Dent, Batman sets out to dismantle the remaining criminal organizations that plague the streets.',
        posterPath: '/qJ2tW6WMUDux911r6m7haRef0WH.jpg',
        backdropPath: '/nMKdUUepR0i5zn0y1T4CsSB5chy.jpg',
        voteAverage: 8.5,
        releaseDate: '2008-07-16',
        genreIds: [18, 28, 80],
      ),
      Movie(
        id: 4,
        title: 'Pulp Fiction',
        overview:
            'A burger-loving hit man, his philosophical partner, a drug-addled gangster\'s moll and a washed-up boxer converge in this sprawling, comedic crime caper.',
        posterPath: '/d5iIlFn5s0ImszYzBPb8JPIfbXD.jpg',
        backdropPath: '/suaEOtk1N1sgg2MTM7oZd2cfVp3.jpg',
        voteAverage: 8.5,
        releaseDate: '1994-09-10',
        genreIds: [53, 80],
      ),
      Movie(
        id: 5,
        title: 'Forrest Gump',
        overview:
            'A man with a low IQ has accomplished great things in his life and been present during significant historic events—in each case, far exceeding what anyone imagined he could do.',
        posterPath: '/arw2vcBveWOVZr6pxd9XTd1TdQa.jpg',
        backdropPath: '/3h1JZGDhZ8nzxdgvkxha0qBqi05.jpg',
        voteAverage: 8.5,
        releaseDate: '1994-06-23',
        genreIds: [35, 18, 10749],
      ),
      Movie(
        id: 6,
        title: 'Inception',
        overview:
            'Cobb, a skilled thief who commits corporate espionage by infiltrating the subconscious of his targets is offered a chance to regain his old life as payment for a task considered to be impossible.',
        posterPath: '/ljsZTbVsrQSqZgWeep2B1QiDKuh.jpg',
        backdropPath: '/8ZTVqvKDQ8emSGUEMjsS4yHAwrp.jpg',
        voteAverage: 8.4,
        releaseDate: '2010-07-15',
        genreIds: [28, 878, 12],
      ),
      Movie(
        id: 7,
        title: 'The Matrix',
        overview:
            'Set in the 22nd century, The Matrix tells the story of a computer hacker who joins a group of underground insurgents fighting the vast and powerful computers who now rule the earth.',
        posterPath: '/f89U3ADr1oiB1s9GkdPOEpXUk5H.jpg',
        backdropPath: '/fNG7i7RqMErkcqhohV2a6cV1Ehy.jpg',
        voteAverage: 8.2,
        releaseDate: '1999-03-30',
        genreIds: [28, 878],
      ),
      Movie(
        id: 8,
        title: 'Interstellar',
        overview:
            'The adventures of a group of explorers who make use of a newly discovered wormhole to surpass the limitations on human space travel and conquer the vast distances involved in an interstellar voyage.',
        posterPath: '/gEU2QniE6E77NI6lCU6MxlNBvIx.jpg',
        backdropPath: '/xJHokMbljvjADYdit5fK5VQsXEG.jpg',
        voteAverage: 8.4,
        releaseDate: '2014-11-05',
        genreIds: [12, 18, 878],
      ),
      Movie(
        id: 9,
        title: 'Fight Club',
        overview:
            'A ticking-Loss bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground fight clubs forming in every town.',
        posterPath: '/pV2zhzVWg5TLYYBKGLbLqCSjczR.jpg',
        backdropPath: '/hZkgoQYus5vegHoetLkCJzb17zJ.jpg',
        voteAverage: 8.4,
        releaseDate: '1999-10-15',
        genreIds: [18],
      ),
      Movie(
        id: 10,
        title: 'Gladiator',
        overview:
            'In the year 180, the death of emperor Marcus Aurelius throws the Roman Empire into chaos. Maximus is one of the Roman army\'s most capable and trusted generals and a key advisor to the emperor.',
        posterPath: '/ty8TGRuvJLPUmAR1H1nRIsgwvim.jpg',
        backdropPath: '/Ar7QuJdLfmdJAxyQ0XH3Qsbqpqp.jpg',
        voteAverage: 8.2,
        releaseDate: '2000-05-04',
        genreIds: [28, 18, 12],
      ),
      Movie(
        id: 11,
        title: 'The Lord of the Rings: The Fellowship of the Ring',
        overview:
            'Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator.',
        posterPath: '/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg',
        backdropPath: '/pIUvQ9Ed35wlWhY2oU6OmwEsmzG.jpg',
        voteAverage: 8.4,
        releaseDate: '2001-12-18',
        genreIds: [12, 14, 28],
      ),
      Movie(
        id: 12,
        title: 'Avengers: Endgame',
        overview:
            'After the devastating events of Avengers: Infinity War, the universe is in ruins due to the efforts of the Mad Titan, Thanos. With the help of remaining allies, the Avengers must assemble once more.',
        posterPath: '/or06FN3Dka5tukK1e9sl16pB3iy.jpg',
        backdropPath: '/7RyHsO4yDXtBv1zUU3mTpHeQ0d5.jpg',
        voteAverage: 8.3,
        releaseDate: '2019-04-24',
        genreIds: [12, 878, 28],
      ),
    ];
  }
}
