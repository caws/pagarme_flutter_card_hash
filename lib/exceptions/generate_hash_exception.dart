/// This class is just a generic exception class
class GenerateHashException implements Exception {
  String cause = "Error during generation of hash.";

  GenerateHashException({this.cause});
}
