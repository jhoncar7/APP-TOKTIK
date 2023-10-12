
import 'package:toktik/domain/datasources/video_post_datasource.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infraestructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class LocalVideoDatasource extends VideoPostDataSource{
  @override
  Future<List<VideoPost>> getFavoriteVideosByUser(String userId) {
    throw UnimplementedError();
  }

  @override
  Future<List<VideoPost>> getTredingVideosByPage(int page) async{
    await Future.delayed(const Duration(seconds: 2));

    List<VideoPost> newVideos = videoPosts
        .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
        .toList();

    return newVideos;
        
  }

}