import 'package:flutter/material.dart';
import '../models/movie.dart';

/// A widget that displays a movie card with poster, title, overview, rating, and year.
class MovieCard extends StatelessWidget {
  /// The movie to display.
  final Movie movie;

  /// Callback when the card is tapped.
  final VoidCallback onTap;

  const MovieCard({super.key, required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // Card styling
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Poster and image section
              Expanded(flex: 4, child: _buildPosterImage()),
              // The movie information section
              Expanded(flex: 2, child: _buildMovieInfo()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPosterImage() {
    return Container(
      color: Colors.grey[800],
      child: movie.fullPosterPath.isNotEmpty
          ? Image.network(
              movie.fullPosterPath,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                        : null,
                    color: Colors.amber,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Icon(Icons.movie, size: 50, color: Colors.grey),
                );
              },
            )
          : const Center(
              child: Icon(Icons.movie, size: 50, color: Colors.grey),
            ),
    );
  }

  Widget _buildMovieInfo() {
    return Container(
      color: const Color(0xFF1E1E1E),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Icon(Icons.star, color: Colors.amber, size: 14),
              const SizedBox(width: 4),
              Text(
                movie.voteAverage.toStringAsFixed(1),
                style: const TextStyle(
                  color: Colors.amber,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              if (movie.year.isNotEmpty)
                Text(
                  movie.year,
                  style: TextStyle(color: Colors.grey[400], fontSize: 11),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
