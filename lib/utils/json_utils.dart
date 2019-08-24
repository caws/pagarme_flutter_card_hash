/// This class is responsible for kinda parsing the
/// json data contained in the response returned
/// from Pagar.me's API endpoint.

class JsonUtils {
  // The static method below basically tries to return the value
  // tied to the key passed, if said value isn't present, it
  // returns what was passed as the defaultValue.
  static dynamic valueOrThis(
      dynamic defaultValue, key, Map<String, dynamic> json) {
    if (json[key] == null) {
      return defaultValue;
    }

    return json[key];
  }
}
