

final RegExp emailRegex = RegExp(
  r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
);


final RegExp phoneRegex = RegExp(
  r'^[0-9]{10}$',
);
extension Matcher on String {
  bool isValidEmail() {
    return emailRegex.hasMatch(this);
  }
  bool isValidPhone() {
    return phoneRegex.hasMatch(this);
  }
}