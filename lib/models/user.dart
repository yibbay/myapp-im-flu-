import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
    User();

    String pageSize;
    String pageNum;
    num id;
    String customerId;
    String userName;
    String nickName;
    String email;
    String phone;
    String provinceId;
    String cityId;
    String photoUrl;
    num casicloudOrgId;
    num casicRegisterDate;
    num sex;
    String birthDate;
    String createTime;
    String unionId;
    String avatarUrl;
    String industry;
    String address;
    String introduce;
    num lastLoginTime;
    String idCard;
    String bankCard;
    String realName;
    String bankCardPhone;
    String isIdentify;
    String isLike;
    String attentionNum;
    String attPersonType;
    String answerNum;
    String ids;
    String token;
    String outerChainSource;
    List roleIds;
    String authorizeCode;
    List functions;
    
    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}
