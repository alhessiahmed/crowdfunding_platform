enum PaymentType { visa, applePay, paypal }

class PaymentMethod {
  const PaymentMethod({
    required this.type,
    required this.title,
    required this.assetIcon, // png/svg path
  });

  final PaymentType type;
  final String title;
  final String assetIcon;
}
