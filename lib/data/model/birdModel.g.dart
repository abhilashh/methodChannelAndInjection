// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'birdModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BirdModel _$BirdModelFromJson(Map<String, dynamic> json) => BirdModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      species: json['species'] as String?,
      family: json['family'] as String?,
      habitat: json['habitat'] as String?,
      placeOfFound: json['placeOfFound'] as String?,
      diet: json['diet'] as String?,
      description: json['description'] as String?,
      wingspanCm: json['wingspanCm'] as int?,
      weightKg: (json['weightKg'] as num?)?.toDouble(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BirdModelToJson(BirdModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'species': instance.species,
      'family': instance.family,
      'habitat': instance.habitat,
      'placeOfFound': instance.placeOfFound,
      'diet': instance.diet,
      'description': instance.description,
      'wingspanCm': instance.wingspanCm,
      'weightKg': instance.weightKg,
      'image': instance.image,
    };
