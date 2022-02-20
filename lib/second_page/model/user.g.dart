// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      json['id'] as int,
      json['name'] as String,
      json['username'] as String,
      json['email'] as String,
      Address.fromJson(json['address'] as Map<String, dynamic>),
      json['phone'] as String,
      json['website'] as String,
      Company.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'email': instance.email,
      'address': instance.address,
      'phone': instance.phone,
      'website': instance.website,
      'company': instance.company,
    };

_$_Address _$$_AddressFromJson(Map<String, dynamic> json) => _$_Address(
      json['street'] as String,
      json['suite'] as String,
      json['city'] as String,
      Geo.fromJson(json['geo'] as Map<String, dynamic>),
      json['zipcode'] as String,
    );

Map<String, dynamic> _$$_AddressToJson(_$_Address instance) =>
    <String, dynamic>{
      'street': instance.street,
      'suite': instance.suite,
      'city': instance.city,
      'geo': instance.geo,
      'zipcode': instance.zipcode,
    };

_$_Geo _$$_GeoFromJson(Map<String, dynamic> json) => _$_Geo(
      json['lat'] as String,
      json['lng'] as String,
    );

Map<String, dynamic> _$$_GeoToJson(_$_Geo instance) => <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };

_$_Company _$$_CompanyFromJson(Map<String, dynamic> json) => _$_Company(
      json['name'] as String,
      json['catchPhrase'] as String,
      json['bs'] as String,
    );

Map<String, dynamic> _$$_CompanyToJson(_$_Company instance) =>
    <String, dynamic>{
      'name': instance.name,
      'catchPhrase': instance.catchPhrase,
      'bs': instance.bs,
    };
