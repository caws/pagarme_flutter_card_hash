library pagarme_flutter_card_hash;

import 'api/pagarme_api.dart';
import 'encryption/pagarme_encrypt.dart';
import 'models/pagarme_card.dart';
import 'models/pagarme_public_key.dart';

class PagarMeFlutterCardHash {
  String pagarMeApiKey;
  PagarMeCard pagarMeCard;

  PagarMeFlutterCardHash({this.pagarMeApiKey, this.pagarMeCard});

  Future<String> generateCardHash() async {
    PagarMeApi pagarMeApi = PagarMeApi(pagarMeApiKey: this.pagarMeApiKey);

    PagarMePublicKey pagarMePublicKey =
        await pagarMeApi.generateEncryptionKeyAndId();

    PagarMeEncrypt pagarmeEncrypt = PagarMeEncrypt(
        pagarMePublicKey: pagarMePublicKey, pagarMeCard: this.pagarMeCard);

    return pagarmeEncrypt.generateCardHash();
  }
}
