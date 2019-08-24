# pagarme_flutter_card_hash

A Flutter package that allows you to generate card hashes to be used with [pagar.me](https://pagar.me/)'s payment platform.

## Is this safe?

Well, that's something I wondered too when I was looking for a third party package to use to generate
card hashes when facing the fact that generating the card_hash using pagarme.js library wasn't neat enough
in Flutter.

I began looking into pagar.me's C# and PHP libraries and found out that what they do is basically the
process documented [here](https://docs.pagar.me/reference#gerando-card_hash-manualmente).

So I basically replicated that process. 

I tried to keep the code as simple as possible so that people could see that there's no monkey business 
amidst the lines.

Enjoy

## Getting Started

First, add pagarme_flutter_card_hash as a dependency in your pubspec.yaml file.

Then all you have to do is the following:

```dart
String pagarMeApiKey = "ek_test_yCRumKDVQgqFkjlQojnTSHgWw7UI5g";

PagarMeCard pagarMeCard = new PagarMeCard(
      cardHolderName: "John Snow",
      cardCvv: "235",
      cardNumber: "5448280000000007",
      cardExpirationDate: "0620");

PagarMeFlutterCardHash pagarMeFlutterCardHash = new PagarMeFlutterCardHash(
    pagarMeApiKey: pagarMeApiKey, 
    pagarMeCard: pagarMeCard);

String cardHash = await pagarMeFlutterCardHash.generateCardHash();

print(cardHash); //Outputs something like: 1842883_Ha6Q2D/xYkuKXpgbDwy3HnrJpO2oX3c...
```
P.S.: This package assumes that the card data you are using has already been validated.

TODO:

    Improve exceptions
    Write (more) tests
    Improve documentation

## Author

* **Charles Washington de Aquino dos Santos** - [Caws](https://github.com/caws)