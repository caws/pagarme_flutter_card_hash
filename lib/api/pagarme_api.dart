import 'package:dio/dio.dart';
import 'package:pagarme_flutter_card_hash/constants/pagarme_constants.dart';
import 'package:pagarme_flutter_card_hash/exceptions/response_exception.dart';
import 'package:pagarme_flutter_card_hash/models/pagarme_public_key.dart';
import 'package:pagarme_flutter_card_hash/utils/http_tunnel.dart';

class PagarMeApi<T> {
  final HttpTunnel httpTunnel = new HttpTunnel();
  final _baseUrl = PagarMeConstants.CardHashUrl;
  String pagarmeApiKey;

  PagarMeApi({this.pagarmeApiKey});

  Future<PagarMePublicKey> generateEncryptionKeyAndId() async {
    Response response =
        await httpTunnel.get('$_baseUrl?api_key=$pagarmeApiKey');

    if ((response == null) || (response.statusCode != 200)) {
      throw new ResponseException(cause:
          "Pagar.me's API didn't respond as expected or there's no internet connection.");
    }

    PagarMePublicKey pagarmePublicKey =
        PagarMePublicKey.FromJson(response.data);

    return pagarmePublicKey;
  }
}
