

import 'package:batterylevel/data/model/birdModel.dart';
import 'package:batterylevel/data/repositiory/i_birdRepo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IBirdRepo)
class BirdRepo implements IBirdRepo{
  @override
  Future<List<BirdModel>> getBirds() async {
    List<BirdModel> resp = [];
    try{
      // final response = await .performCall(
      //     url: AppData.signUp,
      //     requestType: RequestType.post,
      //     data: jsonEncode(data));
      return resp;


    }catch(e){
    return resp;
    }
  }

}