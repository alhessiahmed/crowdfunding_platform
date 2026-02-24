
class Creator {
  final String id;
  final String firstName;
  final String lastName;
  final String country;

  Creator({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.country,
  });

  factory Creator.fromJson(Map<String, dynamic> json) {
    return Creator(
      id: (json['id'] ?? '').toString(),
      firstName: (json['firstName'] ?? '').toString(),
      lastName: (json['lastName'] ?? '').toString(),
      country: (json['country'] ?? '').toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'country': country,
    };
  }

  String get fullName => '$firstName $lastName';
}
