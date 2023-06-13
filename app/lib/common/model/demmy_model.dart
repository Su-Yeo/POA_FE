import 'package:app/common/model/art_work_model.dart';
import 'package:app/common/model/user_model.dart';

List<ArtWorkModel> models = [
  ArtWorkModel(
    artworkId: 0,
    userId: 0,
    userName: '최호영',
    fileUrl: 'assets/images/image6.jpeg',
    title: '달빛 여행',
    content: ' 달빛 아래 반짝이는 환상적인 우주왕복선을 그린 작품입니다. 신비로운 분위기와 유려한 색감이 돋보이는 작품입니다.',
    artworkPrice: 30000,
    artworkSize: '100 x 100',
    like: true,
  ),
  ArtWorkModel(
    artworkId: 1,
    userId: 1,
    userName: '정은혜',
    fileUrl: 'assets/images/image1.jpg',
    title: '무지개 여행',
    content: ' 달빛 아래 반짝이는 환상적인 우주왕복선을 그린 작품입니다. 신비로운 분위기와 유려한 색감이 돋보이는 작품입니다.',
    artworkPrice: 78000,
    artworkSize: '300 x 300',
    like: true,
  ),
];

List<UserModel> userModel = [
  UserModel(
    userId: 0,
    email: 'test@email.com',
    name: '포니어',
    phone: '010-1234-5678',
    nick: '포니어',
    profileUrl: 'assets/images/user_profile.png',
    address: '서울특별시 송파구',
  ),
];
