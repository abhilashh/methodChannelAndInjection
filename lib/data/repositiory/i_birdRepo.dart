


import 'package:batterylevel/data/model/birdModel.dart';

abstract class IBirdRepo{
  Future<List<BirdModel>> getBirds();
}