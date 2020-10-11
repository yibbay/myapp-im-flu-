import 'package:json_annotation/json_annotation.dart';

part 'policyList.g.dart';

@JsonSerializable()
class PolicyList {
    PolicyList();

    String code;
    Map<String,dynamic> data;
    String message;
    bool success;
    num time;
    
    factory PolicyList.fromJson(Map<String,dynamic> json) => _$PolicyListFromJson(json);
    Map<String, dynamic> toJson() => _$PolicyListToJson(this);
}
