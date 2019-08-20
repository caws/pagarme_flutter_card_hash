library pagarme_flutter_card_hash;

import 'api/pagarme_api.dart';
import 'encryption/pagarme_encrypt.dart';
import 'models/pagarme_public_key.dart';

class PagarMeFlutterCardHash {
  String pagarmeApiKey;
  String cardNumber;
  String cardHolderName;
  String cardExpirationDate;
  String cardCvv;

  PagarMeFlutterCardHash(
      {this.pagarmeApiKey,
      this.cardNumber,
      this.cardHolderName,
      this.cardExpirationDate,
      this.cardCvv});

  Future<String> generateCardHash() async {
    PagarMeApi pagarMeApi = PagarMeApi(pagarmeApiKey: this.pagarmeApiKey);

    PagarMePublicKey pagarmePublicKey =
        await pagarMeApi.generateEncryptionKeyAndId();

    PagarMeEncrypt pagarmeEncrypt = PagarMeEncrypt(
        pagarmePublicKey: pagarmePublicKey,
        cardNumber: this.cardNumber,
        cardHolderName: this.cardHolderName,
        cardCvv: this.cardCvv,
        cardExpirationDate: this.cardExpirationDate);

    return pagarmeEncrypt.generateCardHash();
  }
}
