/// Check if number is integer
bool isInteger(num value) => value is int || value == value.roundToDouble();
