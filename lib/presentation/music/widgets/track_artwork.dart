import 'package:flutter/material.dart';

class TrackArtwork extends StatelessWidget {
  const TrackArtwork({
    required this.imageUrl,
    required this.size,
    this.borderRadius = 14,
    super.key,
  });

  final String imageUrl;
  final double size;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: SizedBox.square(
        dimension: size,
        child: imageUrl.isEmpty
            ? const _ArtworkFallback()
            : Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const _ArtworkFallback(),
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const _ArtworkFallback(showProgress: true);
                },
              ),
      ),
    );
  }
}

class _ArtworkFallback extends StatelessWidget {
  const _ArtworkFallback({this.showProgress = false});

  final bool showProgress;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Center(
        child: showProgress
            ? const SizedBox.square(
                dimension: 22,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
            : Icon(
                Icons.music_note_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
      ),
    );
  }
}
