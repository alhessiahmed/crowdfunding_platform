class User {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final DateTime? dateOfBirth;
  final String role;
  final bool? isVerified;
  final String? verificationStatus;
  final String? country;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.dateOfBirth,
    required this.role,
    this.isVerified,
    this.verificationStatus,
    this.country,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      dateOfBirth: json['dateOfBirth'] != null
          ? DateTime.tryParse(json['dateOfBirth'])
          : null,
      role: json['role'] as String,
      isVerified: json['isVerified'] as bool?,
      verificationStatus: json['verificationStatus'] as String?,
      country: json['country'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role,
      'country': country,
    };
  }
}
