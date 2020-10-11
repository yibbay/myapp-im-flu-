// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..pageSize = json['pageSize'] as String
    ..pageNum = json['pageNum'] as String
    ..id = json['id'] as num
    ..customerId = json['customerId'] as String
    ..userName = json['userName'] as String
    ..nickName = json['nickName'] as String
    ..email = json['email'] as String
    ..phone = json['phone'] as String
    ..provinceId = json['provinceId'] as String
    ..cityId = json['cityId'] as String
    ..photoUrl = json['photoUrl'] as String
    ..casicloudOrgId = json['casicloudOrgId'] as num
    ..casicRegisterDate = json['casicRegisterDate'] as num
    ..sex = json['sex'] as num
    ..birthDate = json['birthDate'] as String
    ..createTime = json['createTime'] as String
    ..unionId = json['unionId'] as String
    ..avatarUrl = json['avatarUrl'] as String
    ..industry = json['industry'] as String
    ..address = json['address'] as String
    ..introduce = json['introduce'] as String
    ..lastLoginTime = json['lastLoginTime'] as num
    ..idCard = json['idCard'] as String
    ..bankCard = json['bankCard'] as String
    ..realName = json['realName'] as String
    ..bankCardPhone = json['bankCardPhone'] as String
    ..isIdentify = json['isIdentify'] as String
    ..isLike = json['isLike'] as String
    ..attentionNum = json['attentionNum'] as String
    ..attPersonType = json['attPersonType'] as String
    ..answerNum = json['answerNum'] as String
    ..ids = json['ids'] as String
    ..token = json['token'] as String
    ..outerChainSource = json['outerChainSource'] as String
    ..roleIds = json['roleIds'] as List
    ..authorizeCode = json['authorizeCode'] as String
    ..functions = json['functions'] as List;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'pageSize': instance.pageSize,
      'pageNum': instance.pageNum,
      'id': instance.id,
      'customerId': instance.customerId,
      'userName': instance.userName,
      'nickName': instance.nickName,
      'email': instance.email,
      'phone': instance.phone,
      'provinceId': instance.provinceId,
      'cityId': instance.cityId,
      'photoUrl': instance.photoUrl,
      'casicloudOrgId': instance.casicloudOrgId,
      'casicRegisterDate': instance.casicRegisterDate,
      'sex': instance.sex,
      'birthDate': instance.birthDate,
      'createTime': instance.createTime,
      'unionId': instance.unionId,
      'avatarUrl': instance.avatarUrl,
      'industry': instance.industry,
      'address': instance.address,
      'introduce': instance.introduce,
      'lastLoginTime': instance.lastLoginTime,
      'idCard': instance.idCard,
      'bankCard': instance.bankCard,
      'realName': instance.realName,
      'bankCardPhone': instance.bankCardPhone,
      'isIdentify': instance.isIdentify,
      'isLike': instance.isLike,
      'attentionNum': instance.attentionNum,
      'attPersonType': instance.attPersonType,
      'answerNum': instance.answerNum,
      'ids': instance.ids,
      'token': instance.token,
      'outerChainSource': instance.outerChainSource,
      'roleIds': instance.roleIds,
      'authorizeCode': instance.authorizeCode,
      'functions': instance.functions
    };
