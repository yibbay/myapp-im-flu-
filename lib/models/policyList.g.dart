// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policyList.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolicyList _$PolicyListFromJson(Map<String, dynamic> json) {
  return PolicyList()
    ..code = json['code'] as String
    ..data = json['data'] as Map<String, dynamic>
    ..message = json['message'] as String
    ..success = json['success'] as bool
    ..time = json['time'] as num;
}

Map<String, dynamic> _$PolicyListToJson(PolicyList instance) =>
    <String, dynamic>{
      'code': instance.code,
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
      'time': instance.time
    };
