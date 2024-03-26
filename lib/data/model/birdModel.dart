import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'birdModel.g.dart';
@JsonSerializable()
class BirdModel extends Equatable {
  int? id;
  String? name;
  String? species;
  String? family;
  String? habitat;
  String? placeOfFound;
  String? diet;
  String? description;
  int? wingspanCm;
  double? weightKg;
  String? image;

  BirdModel(
      {this.id,
      this.name,
      this.species,
      this.family,
      this.habitat,
      this.placeOfFound,
      this.diet,
      this.description,
      this.wingspanCm,
      this.weightKg,
      this.image});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        name,
        species,
        family,
        habitat,
        placeOfFound,
        diet,
        description,
        wingspanCm,
        weightKg,
        image
      ];
factory BirdModel.froJson(Map<String, dynamic> json) => _$BirdModelFromJson(json);
Map<String, dynamic> toJson() => _$BirdModelToJson(this);
}


