import 'package:app/common/model/art_work_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'art_work_repository.g.dart';

@RestApi()
abstract class ArtWorkRepository {
  factory ArtWorkRepository(Dio dio, {String baseUrl}) = _ArtWorkRepository;

  // 메인 home 작품 리스트
  @GET('/home')
  Future<List<ArtWorkModel>> getArtWorks();

  // 작품 디테일 조회
  @GET('/{id}')
  Future<List<ArtWorkModel>> getArtWorkDetail({
    @Path('id') required int artworkId,
  });
}
