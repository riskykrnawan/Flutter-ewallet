class PinModel {
  final String? oldPin;
  final String? newPin;

  PinModel({
    this.oldPin,
    this.newPin,
  });

  Map<String, dynamic> toJson() {
    return {
      'oldPin': oldPin,
      'newPin': newPin,
    };
  }
}