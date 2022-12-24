class PinModel {
  final String? oldPin;
  final String? newPin;

  PinModel({
    this.oldPin,
    this.newPin,
  });

  Map<String, dynamic> toJson() {
    return {
      'previous_pin': oldPin,
      'new_pin': newPin,
    };
  }
}