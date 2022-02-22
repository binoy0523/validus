/// Type of fields in profile.
enum ProfileFieldType {
  /// Name of the user
  name,

  /// Email of the user
  email,

  /// address of the user
  address,
}

/// Extensions on [ProfileFieldType]
extension ProfileFieldTypeExtension on ProfileFieldType {
  /// The string value  for this [ProfileFieldType].
  String get fieldName {
    switch (this) {
      case ProfileFieldType.name:
        return "Name";
      case ProfileFieldType.email:
        return "Email address";
      case ProfileFieldType.address:
        return "Address";
    }
  }
}
