
import 'package:pagarme_flutter_card_hash/utils/json_utils.dart';

class PagarMePublicKey {
  String id;
  String dateCreated;
  String ip;
  String publicKey;

  PagarMePublicKey({this.id, this.dateCreated, this.ip, this.publicKey});

  static FromJson(Map<String, dynamic> json) {

    if (json == null) {
      return null;
    }

    return PagarMePublicKey(
      id: JsonUtils.valueOrThis('', 'id', json).toString(),
      dateCreated: JsonUtils.valueOrThis('', 'date_created', json).toString(),
      ip: JsonUtils.valueOrThis('', 'ip', json).toString(),
      publicKey: JsonUtils.valueOrThis('', 'public_key', json).toString(),
    );
  }
}
