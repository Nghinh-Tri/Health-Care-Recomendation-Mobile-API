import 'package:mobile_healthcare/model/facility/facility.dart';
import 'package:json_annotation/json_annotation.dart';

part 'facility_sqlite.g.dart';

@JsonSerializable()
class FacilitySQLite extends Facility {
  int like;

  FacilitySQLite(int id, String name, String address, String phone,
      double latitude, double longtitude, String image, this.like)
      : super(
            id: id,
            name: name,
            address: address,
            phone: phone,
            latitude: latitude,
            longtitude: longtitude,
            image: image);

  factory FacilitySQLite.fromJson(Map<String, dynamic> json) =>
      _$FacilitySQLiteFromJson(json);

  Map<String, dynamic> toJson() => _$FacilitySQLiteToJson(this);
}
