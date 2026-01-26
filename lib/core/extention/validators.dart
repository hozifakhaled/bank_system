class Validators {
  static String? requiredField(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Enter a valid email';
    }
    return null;
  }

  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }

  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (value.length < 11) {
      return 'Enter a valid phone number';
    }
    return null;
  }

  static String? pinCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter PIN code';
    }
    if (value.length < 4) {
      return 'PIN must be at least 4 digits';
    }
    return null;
  }

  static String? nationalId(String? value) {
    if (value == null || value.isEmpty) {
      return 'National ID is required';
    }
    if (value.length != 14) {
      return 'National ID must be 14 digits';
    }
    return null;
  }

  static String? zipCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'Zip code is required';
    }
    return null;
  }
}
