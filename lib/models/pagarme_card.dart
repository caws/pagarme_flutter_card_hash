library pagarme_card;

class PagarMeCard {
  String cardNumber;
  String cardHolderName;
  String cardExpirationDate;
  String cardCvv;

  PagarMeCard(
      {this.cardNumber,
      this.cardHolderName,
      this.cardExpirationDate,
      this.cardCvv});

  String getCardNumber() {
    return this.cardNumber;
  }

  void setCardNumber(String cardNumber) {
    this.cardNumber = cardNumber;
  }

  String getCardHolderName() {
    return this.cardHolderName;
  }

  void setCardHolderName(String cardHolderName) {
    this.cardHolderName = cardHolderName;
  }

  String getCardExpirationDate() {
    return this.cardExpirationDate;
  }

  void setCardExpirationDate(String cardExpirationDate) {
    this.cardExpirationDate = cardExpirationDate;
  }

  String getCardCvv() {
    return this.cardCvv;
  }

  void setCardCvv(String cardCvv) {
    this.cardCvv = cardCvv;
  }
}
