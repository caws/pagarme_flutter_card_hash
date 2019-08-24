/// This class holds constants used throughout the project.
///
/// It now only holds the URL of the endpoint we need in order
/// to generate the RSA key to be used during the encryption
/// phase.
class PagarMeConstants {
  static String cardHashUrl =
      "https://api.pagar.me/1/transactions/card_hash_key";
}
