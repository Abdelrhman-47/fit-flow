class FormValidators {
  FormValidators._();
 
 
  static String? name(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required.';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters.';
    }
    if (value.trim().length > 50) {
      return 'Name must be no more than 50 characters.';
    }
    if (!RegExp(r"^[a-zA-Z\s'-]+$").hasMatch(value.trim())) {
      return 'Name can only contain letters, spaces, hyphens, and apostrophes.';
    }
    return null;
  }
 

  static String? email(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required.';
    }
    final regex = RegExp(r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$');
    if (!regex.hasMatch(value.trim())) {
      return 'Please enter a valid email address.';
    }
    return null;
  }
 
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters.';
    }
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter.';
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one number.';
    }
    if (!value.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>_\-]'))) {
      return 'Password must contain at least one special character.';
    }
    return null;
  }
 
  static String? Function(String?) confirmPassword(
    String Function() getPassword,
  ) {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please confirm your password.';
      }
      if (value != getPassword()) {
        return 'Passwords do not match.';
      }
      return null;
    };
  }
}