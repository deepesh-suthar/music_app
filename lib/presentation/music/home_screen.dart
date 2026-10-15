import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../application/music_catalog/music_catalog_cubit.dart';
import '../../application/player/player_cubit.dart';
import '../../infrastructure/dto/track_dto/track_dto.dart';
import 'widgets/mini_player.dart';
import 'widgets/track_artwork.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.extentAfter < 500) {
      context.read<MusicCatalogCubit>().loadMore();
    }
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const MiniPlayer(),
      body: SafeArea(
        bottom: false,
        child: RefreshIndicator(
          onRefresh: context.read<MusicCatalogCubit>().loadInitial,
          child: CustomScrollView(
            controller: _scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: EdgeInsets.fromLTRB(5.w, 3.h, 5.w, 1.5.h),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: const Icon(Icons.graphic_eq_rounded),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'JAMENDO',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  letterSpacing: 2.4,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Discover music',
                                style: TextStyle(
                                  fontSize: 21.sp,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        controller: _searchController,
                        textInputAction: TextInputAction.search,
                        onChanged: context
                            .read<MusicCatalogCubit>()
                            .onSearchChanged,
                        onSubmitted: context.read<MusicCatalogCubit>().search,
                        decoration: InputDecoration(
                          hintText: 'Search tracks or artists',
                          prefixIcon: const Icon(Icons.search_rounded),
                          suffixIcon:
                              BlocBuilder<MusicCatalogCubit, MusicCatalogState>(
                                buildWhen: (previous, current) =>
                                    previous.search != current.search,
                                builder: (context, state) {
                                  if (_searchController.text.isEmpty) {
                                    return const SizedBox.shrink();
                                  }
                                  return IconButton(
                                    tooltip: 'Clear search',
                                    onPressed: () {
                                      _searchController.clear();
                                      context.read<MusicCatalogCubit>().search(
                                        '',
                                      );
                                    },
                                    icon: const Icon(Icons.close_rounded),
                                  );
                                },
                              ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      BlocBuilder<MusicCatalogCubit, MusicCatalogState>(
                        buildWhen: (previous, current) =>
                            previous.search != current.search ||
                            previous.status != current.status,
                        builder: (context, state) {
                          return Text(
                            state.search.isEmpty
                                ? 'Popular right now'
                                : 'Results for “${state.search}”',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              BlocBuilder<MusicCatalogCubit, MusicCatalogState>(
                builder: (context, state) => _catalogSliver(context, state),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 24)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _catalogSliver(BuildContext context, MusicCatalogState state) {
    if (state.status == CatalogStatus.initial ||
        state.status == CatalogStatus.loading) {
      return const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: CircularProgressIndicator()),
      );
    }
    if (state.status == CatalogStatus.failure) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: _MessageState(
          icon: Icons.cloud_off_rounded,
          title: 'Couldn’t load music',
          message: state.errorMessage,
          buttonLabel: 'Try again',
          onPressed: context.read<MusicCatalogCubit>().loadInitial,
        ),
      );
    }
    if (state.tracks.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: false,
        child: _MessageState(
          icon: Icons.music_off_rounded,
          title: 'No tracks found',
          message: 'Try another song, album, or artist name.',
          buttonLabel: 'Clear search',
          onPressed: () {
            _searchController.clear();
            context.read<MusicCatalogCubit>().search('');
          },
        ),
      );
    }

    final itemCount = state.tracks.length + (state.isLoadingMore ? 1 : 0);
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      sliver: SliverList.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          if (index == state.tracks.length) {
            return const Padding(
              padding: EdgeInsets.all(20),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          final track = state.tracks[index];
          return _TrackTile(track: track, queue: state.tracks);
        },
      ),
    );
  }
}

class _TrackTile extends StatelessWidget {
  const _TrackTile({required this.track, required this.queue});

  final TrackDto track;
  final List<TrackDto> queue;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PlayerCubit, PlayerState>(
      buildWhen: (previous, current) =>
          previous.currentTrack?.id != current.currentTrack?.id ||
          previous.isPlaying != current.isPlaying,
      builder: (context, playerState) {
        final isCurrent = playerState.currentTrack?.id == track.id;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
          child: Material(
            color: isCurrent
                ? Theme.of(context).colorScheme.primary.withValues(alpha: 0.12)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(18),
            child: ListTile(
              onTap: () => context.read<PlayerCubit>().playTrack(track, queue),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 5,
              ),
              leading: TrackArtwork(imageUrl: track.artworkUrl, size: 58),
              title: Text(
                track.title,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: isCurrent
                      ? Theme.of(context).colorScheme.primary
                      : null,
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  '${track.artist}  •  ${track.album}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: isCurrent
                  ? Icon(
                      playerState.isPlaying
                          ? Icons.graphic_eq_rounded
                          : Icons.pause_circle_outline_rounded,
                      color: Theme.of(context).colorScheme.primary,
                    )
                  : const Icon(Icons.play_circle_outline_rounded),
            ),
          ),
        );
      },
    );
  }
}

class _MessageState extends StatelessWidget {
  const _MessageState({
    required this.icon,
    required this.title,
    required this.message,
    required this.buttonLabel,
    required this.onPressed,
  });

  final IconData icon;
  final String title;
  final String message;
  final String buttonLabel;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 52, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 18),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 21, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 8),
            Text(message, textAlign: TextAlign.center),
            const SizedBox(height: 20),
            FilledButton(onPressed: onPressed, child: Text(buttonLabel)),
          ],
        ),
      ),
    );
  }
}
