import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../application/music_catalog/music_catalog_cubit.dart';
import '../../application/player/player_cubit.dart';
import 'home_screen.dart';

class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [ 
        BlocProvider(
          create: (_) =>
              MusicCatalogCubit(MusicCatalogState.initial())..loadInitial(),
        ),
        BlocProvider(create: (_) => PlayerCubit(PlayerState.initial())),
      ],
      child: HomeScreen(),
    );
  }
}
