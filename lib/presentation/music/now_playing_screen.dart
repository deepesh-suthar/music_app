import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/player/player_cubit.dart';
import 'widgets/track_artwork.dart';

class NowPlayingScreen extends StatelessWidget {
  const NowPlayingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          tooltip: 'Back',
          onPressed: Navigator.of(context).pop,
          icon: const Icon(Icons.keyboard_arrow_down_rounded, size: 34),
        ),
        title: const Text(
          'NOW PLAYING',
          style: TextStyle(
            fontSize: 13,
            letterSpacing: 2,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<PlayerCubit, PlayerState>(
        builder: (context, state) {
          final track = state.currentTrack;
          if (track == null) {
            return const Center(
              child: Text('Choose a track to start listening.'),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              final artworkSize = (constraints.maxWidth - 48).clamp(
                220.0,
                440.0,
              );
              return SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(24, 12, 24, 32),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight - 44,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(28),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x667C5CFC),
                              blurRadius: 45,
                              spreadRadius: -8,
                              offset: Offset(0, 20),
                            ),
                          ],
                        ),
                        child: TrackArtwork(
                          imageUrl: track.artworkUrl,
                          size: artworkSize,
                          borderRadius: 28,
                        ),
                      ),
                      const SizedBox(height: 42),
                      Text(
                        track.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 26,
                          height: 1.15,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      const SizedBox(height: 9),
                      Text(
                        track.artist,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white.withValues(alpha: 0.62),
                        ),
                      ),
                      const SizedBox(height: 28),
                      Slider(
                        value: _sliderValue(state),
                        max: _sliderMax(state),
                        onChanged: (value) => context.read<PlayerCubit>().seek(
                          Duration(milliseconds: value.round()),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(_formatDuration(state.position)),
                            Text(_formatDuration(state.duration)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            tooltip: 'Previous',
                            onPressed: context.read<PlayerCubit>().previous,
                            icon: const Icon(Icons.skip_previous_rounded),
                            iconSize: 46,
                          ),
                          const SizedBox(width: 24),
                          SizedBox.square(
                            dimension: 76,
                            child: FilledButton(
                              onPressed: state.isLoading
                                  ? null
                                  : context.read<PlayerCubit>().togglePlayPause,
                              style: FilledButton.styleFrom(
                                shape: const CircleBorder(),
                                padding: EdgeInsets.zero,
                              ),
                              child: state.isLoading
                                  ? const SizedBox.square(
                                      dimension: 28,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                      ),
                                    )
                                  : Icon(
                                      state.isPlaying
                                          ? Icons.pause_rounded
                                          : Icons.play_arrow_rounded,
                                      size: 46,
                                    ),
                            ),
                          ),
                          const SizedBox(width: 24),
                          IconButton(
                            tooltip: 'Next',
                            onPressed: state.hasNext
                                ? context.read<PlayerCubit>().next
                                : null,
                            icon: const Icon(Icons.skip_next_rounded),
                            iconSize: 46,
                          ),
                        ],
                      ),
                      if (state.errorMessage.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Text(
                          state.errorMessage,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  double _sliderMax(PlayerState state) {
    return state.duration.inMilliseconds <= 0
        ? 1
        : state.duration.inMilliseconds.toDouble();
  }

  double _sliderValue(PlayerState state) {
    return state.position.inMilliseconds.toDouble().clamp(0, _sliderMax(state));
  }

  String _formatDuration(Duration value) {
    final minutes = value.inMinutes;
    final seconds = value.inSeconds.remainder(60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }
}
