import 'package:flutter/material.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infraestructure/datasources/local_video_datasource_imp.dart';
import 'package:toktik/infraestructure/repositories/video_post_repository_imp.dart';
import 'package:toktik/presentation/provider/discover_provider.dart';
import 'package:toktik/presentation/screens/discover/discover_screen.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    final videoPostRepository = VideoPostRepositoryImp(videosDatasource: LocalVideoDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiscoverProvider(videosRepository: videoPostRepository)..loadNextPage())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        title: 'TokTik',
        home: const DiscoverScreen()
      ),
    );
  }
}
