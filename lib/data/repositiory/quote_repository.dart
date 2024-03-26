
import 'package:batterylevel/data/model/birdModel.dart';
import 'package:batterylevel/data/model/quote.dart';
import 'package:batterylevel/data/provider/quote_api_provider.dart';
import 'package:injectable/injectable.dart';


@injectable
class QuoteRepository {
  final QuoteApiProvider _provider;
  final String _env;

  const QuoteRepository(
      {@Named("prod") required QuoteApiProvider provider, @factoryParam env})
      : _env = env,
        _provider = provider;

  Future<List<Quote>> getQuotes() {
    return _provider.getQuotes(_env);
  }
  Future<List<BirdModel>> getBird(){
    return _provider.getBirds(_env);
  }
}