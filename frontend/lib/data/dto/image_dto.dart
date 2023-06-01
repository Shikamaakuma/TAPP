import 'dart:convert';
import 'dart:typed_data';

/// Api representation of an image
class ImageDto {

  /// Image bytes encoded in base64
  final Uint8List bytes;
  final String? mimetype;

  ImageDto(this.bytes, this.mimetype);

  factory ImageDto.fromJson(dynamic json) {
    return ImageDto(base64Decode(json['picture'] as String), json['imageType']);
  }

}