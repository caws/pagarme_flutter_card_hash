import 'package:encrypt/encrypt.dart';
import 'package:pagarme_flutter_card_hash/models/pagarme_public_key.dart';
import 'package:pointycastle/asymmetric/api.dart';

class PagarMeEncrypt {
  PagarMePublicKey pagarmePublicKey;
  String cardNumber;
  String cardHolderName;
  String cardExpirationDate;
  String cardCvv;

  PagarMeEncrypt(
      {this.pagarmePublicKey,
      this.cardNumber,
      this.cardHolderName,
      this.cardExpirationDate,
      this.cardCvv});

  String generateCardHash() {
    String cardQueryString = _generateCardQueryString();
    String cardHash = "${this.pagarmePublicKey.id}_${_encryptCardQueryString(cardQueryString)}";

    return cardHash;
  }

  String _generateCardQueryString() {
    String cardHashAsString =
        "card_number=$cardNumber&card_holder_name=$cardHolderName&card_expiration_date=$cardExpirationDate&card_cvv=$cardCvv";
    return Uri.encodeFull(cardHashAsString);
  }

  String _encryptCardQueryString(String cardQueryString) {
    final parser = RSAKeyParser();
    final RSAPublicKey publicKey = parser.parse(pagarmePublicKey.publicKey);
    final encrypter = Encrypter(RSA(publicKey: publicKey));
    final encrypted = encrypter.encrypt(cardQueryString);

    return encrypted.base64;
  }
}
