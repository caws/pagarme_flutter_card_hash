/// A (very) basic test class.

import 'package:flutter_test/flutter_test.dart';
import 'package:pagarme_flutter_card_hash/api/pagarme_api.dart';
import 'package:pagarme_flutter_card_hash/encryption/pagarme_encrypt.dart';
import 'package:pagarme_flutter_card_hash/models/pagarme_card.dart';
import 'package:pagarme_flutter_card_hash/models/pagarme_public_key.dart';

import 'package:pagarme_flutter_card_hash/pagarme_flutter_card_hash.dart';

void main() {
  String pagarMeApiKey = "ek_test_yCRumKDVQgqFkjlQojnTSHgWw7UI5g";
  PagarMeCard pagarMeCardValid = new PagarMeCard(
      cardHolderName: "John Snow",
      cardCvv: "235",
      cardNumber: "5448280000000007",
      cardExpirationDate: "0620");

  group('PagarMePublicKey', () {
    test('generateEncryptionKeyAndId', () async {
      PagarMeApi pagarMeApi = PagarMeApi(pagarMeApiKey: pagarMeApiKey);

      PagarMePublicKey pagarMePublicKey =
          await pagarMeApi.generateEncryptionKeyAndId();

      expect(pagarMePublicKey.id != null, true);
    });
  });

  group('PagarMeEncrypt', () {
    test('generateCardHash', () async {
      PagarMeApi pagarMeApi = PagarMeApi(pagarMeApiKey: pagarMeApiKey);

      PagarMePublicKey pagarMePublicKey =
          await pagarMeApi.generateEncryptionKeyAndId();

      expect(pagarMePublicKey.id != null, true);

      PagarMeEncrypt pagarMeEncrypt = PagarMeEncrypt(
          pagarMePublicKey: pagarMePublicKey, pagarMeCard: pagarMeCardValid);

      String cardHash = pagarMeEncrypt.generateCardHash();

      expect(cardHash.length == 352, true);
    });
  });

  group('PagarMeFlutterCardHash', () {
    test('generateCardHash', () async {
      PagarMeFlutterCardHash pagarMeFlutterCardHash =
          new PagarMeFlutterCardHash(
              pagarMeApiKey: pagarMeApiKey, pagarMeCard: pagarMeCardValid);

      String cardHash = await pagarMeFlutterCardHash.generateCardHash();

      expect(cardHash.length == 352, true);
    });
  });
}
