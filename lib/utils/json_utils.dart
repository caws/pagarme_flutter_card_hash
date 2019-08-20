class JsonUtils {
  // The static method below basically tries to return the value
  // tied to the key passed, if said value isn't present, it
  // returns what's in defaultValue.
  static dynamic valueOrThis(
      dynamic defaultValue, key, Map<String, dynamic> json) {
    if (json[key] == null) {
      return defaultValue;
    }

    return json[key];
  }
}
