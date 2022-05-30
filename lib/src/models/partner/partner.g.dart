// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'partner.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Partner _$$_PartnerFromJson(Map<String, dynamic> json) => _$_Partner(
      id: json['id'] as String?,
      name: json['name'] as String,
      type: $enumDecode(_$PartnerTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$$_PartnerToJson(_$_Partner instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$PartnerTypeEnumMap[instance.type],
    };

const _$PartnerTypeEnumMap = {
  PartnerType.vendor: 'vendor',
  PartnerType.supplier: 'supplier',
};
