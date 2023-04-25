import 'base_dto.dart';

class TenantDto extends IdentifiedDTO {
  final String name;

  TenantDto(super.id, this.name);

}