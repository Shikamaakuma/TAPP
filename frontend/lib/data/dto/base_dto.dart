
/// DTO base
abstract class IdentifiedDTO {

  /// Unique identifier
  final int id;

  IdentifiedDTO(this.id);

  /// Json representation of the object
  Map<String, dynamic> get toMap => throw UnimplementedError();
}