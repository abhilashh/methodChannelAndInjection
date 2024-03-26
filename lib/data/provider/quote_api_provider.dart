

import 'package:batterylevel/data/model/birdModel.dart';
import 'package:batterylevel/data/model/quote.dart';
import 'package:batterylevel/service/injection/injection.dart';
import 'package:batterylevel/service/services/dioService.dart';
import 'package:batterylevel/service/services/httpUtil.dart';
import 'package:injectable/injectable.dart';

abstract class QuoteApiProvider {
  const QuoteApiProvider();

  Future<List<Quote>> getQuotes(String env);
  Future<List<BirdModel>> getBirds(String env);
}
@Singleton(as: QuoteApiProvider)
class MockQuoteApiProvider implements QuoteApiProvider {
  const MockQuoteApiProvider();
  Future<List<Quote>> getQuotes(String env) async {
    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    return Future.value([
      Quote(quote: "Simplicity is a great virtue - $env.", author: "Edsger Wybe Dijkstra", lang: '', tags: []),
      Quote(quote: "Progress and don't look back.", author: "Michael Nielsen",lang: '', tags: [])
    ]);
  }

  @override
  Future<List<BirdModel>> getBirds(String env) {
    // TODO: implement getBirds
   return Future.value([]);
  }
}

@Named("prod")
@Singleton(as: QuoteApiProvider)
class RealQuoteApiProvider implements QuoteApiProvider  {
  const RealQuoteApiProvider();

  Future<List<Quote>> getQuotes(String env) async {

    //add some delay to give the feel of api call
    await Future.delayed(Duration(seconds: 3));
    return Future.value([
      Quote(quote: "Simplicity is a great virtue from production - $env.", author: "Edsger Wybe Dijkstra", lang: '', tags: []),
      Quote(quote: "Progress and don't look back.", author: "Michael Nielsen", lang: '', tags: [])
    ]);
  }

  @override
  Future<List<BirdModel>> getBirds(String env) async {
    final rep = await locator.get<DioClient>().performCall(requestType: RequestType.get, url: 'https://freetestapi.com/api/v1/birds');
    print('its.........$rep');
    HttpUtil dio = HttpUtil();
    final response  = await dio.get('birds');
    print(response);
    List<BirdModel> birds = List<BirdModel>.from(response.map((x) => BirdModel.froJson(x)));
    return birds;
  }
}
