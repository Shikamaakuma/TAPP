
abstract class IdentifiedModel {
  final int id;

  IdentifiedModel(this.id);

  Map<String, dynamic> get toMap => {
    'id': id
  };
}