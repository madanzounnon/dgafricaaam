// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  int id;
  String email;
  String firstName;
  String lastName;
  String username;
  String gender;
  String country;
  String city;
  int? firstSubscription;
  Residence? residence;
  FamilyStatus? familyStatus;
  Piece? piece;
  String? status;
  Photo? photo;
  dynamic accountVerification;
  dynamic emailVerifiedAt;
  dynamic twoFactorCode;
  int? useTwoFactorCode;
  dynamic twoFactorExpiresAt;
  Naiss? naiss;
  Phone? phone;
  String userableType;
  int? userableId;
  dynamic bannedUntil;
  User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.gender,
    required this.country,
    required this.city,
    required this.firstSubscription,
    this.residence,
    this.familyStatus,
    this.piece,
    required this.status,
    this.photo,
    required this.accountVerification,
    required this.emailVerifiedAt,
    required this.twoFactorCode,
    required this.useTwoFactorCode,
    required this.twoFactorExpiresAt,
    this.naiss,
    this.phone,
    required this.userableType,
    required this.userableId,
    required this.bannedUntil,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'gender': gender,
      'country': country,
      'city': city,
      'firstSubscription': firstSubscription,
      'residence': residence?.toMap(),
      'familyStatus': familyStatus?.toMap(),
      'piece': piece?.toMap(),
      'status': status,
      'photo': photo?.toMap(),
      'accountVerification': accountVerification,
      'emailVerifiedAt': emailVerifiedAt,
      'twoFactorCode': twoFactorCode,
      'useTwoFactorCode': useTwoFactorCode,
      'twoFactorExpiresAt': twoFactorExpiresAt,
      'naiss': naiss?.toMap(),
      'phone': phone?.toMap(),
      'userableType': userableType,
      'userableId': userableId,
      'bannedUntil': bannedUntil,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      email: map['email'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      username: map['username'] as String,
      gender: map['gender'] as String,
      country: map['country'] as String,
      city: map['city'] as String,
      firstSubscription: map['first_subscription'] as int,
      residence: map['residence'] != null
          ? Residence.fromMap(map['residence'] as Map<String, dynamic>)
          : null,
      familyStatus: map['family_satus'] != null
          ? FamilyStatus.fromMap(map['family_satus'] as Map<String, dynamic>)
          : null,
      piece: map['piece'] != null
          ? Piece.fromMap(map['piece'] as Map<String, dynamic>)
          : null,
      status: map['status'] as String,
      photo: map['photo'] != null
          ? Photo.fromMap(map['photo'] as Map<String, dynamic>)
          : null,
      accountVerification: map['account_verification'] as dynamic,
      emailVerifiedAt: map['email_verifiedAt'] as dynamic,
      twoFactorCode: map['two_factor_expires_at'] as dynamic,
      useTwoFactorCode: map['use_two_factor_code'] as int,
      twoFactorExpiresAt: map['twoFactorExpiresAt'] as dynamic,
      naiss: map['naiss'] != null
          ? Naiss.fromMap(jsonDecode(map['naiss']) as Map<String, dynamic>)
          : null,
      phone: map['phone'] != null
          ? Phone.fromMap(jsonDecode(map['phone']) as Map<String, dynamic>)
          : null,
      userableType: map['userable_type'] as String,
      userableId: map['userable_id'] as int,
      bannedUntil: map['banned_until'] as dynamic,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}

class FamilyStatus {
  String? familyStatus;
  int? numberEnfants;

  FamilyStatus({
    this.familyStatus,
    this.numberEnfants,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'familyStatus': familyStatus,
      'numberEnfants': numberEnfants,
    };
  }

  factory FamilyStatus.fromMap(Map<String, dynamic> map) {
    return FamilyStatus(
      familyStatus:
          map['family_status'] != null ? map['family_status'] as String : null,
      numberEnfants:
          map['number_enfants'] != null ? map['number_enfants'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory FamilyStatus.fromJson(String source) =>
      FamilyStatus.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Naiss {
  DateTime? dateOfBirth;
  String? placeOfBirth;

  Naiss({
    this.dateOfBirth,
    this.placeOfBirth,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dateOfBirth': dateOfBirth,
      'placeOfBirth': placeOfBirth,
    };
  }

  factory Naiss.fromMap(Map<String, dynamic> map) {
    return Naiss(
      dateOfBirth: map['date_ofBirth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date_ofBirth'] as int)
          : null,
      placeOfBirth: map['place_of_birth'] != null
          ? map['place_of_birth'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Naiss.fromJson(String source) =>
      Naiss.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Phone {
  String? homePhone;
  String? mobilePhone;
  String? fax;

  Phone({
    this.homePhone,
    this.mobilePhone,
    this.fax,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'homePhone': homePhone,
      'mobilePhone': mobilePhone,
      'fax': fax,
    };
  }

  factory Phone.fromMap(Map<String, dynamic> map) {
    return Phone(
      homePhone: map['home_phone'] != null ? map['home_phone'] as String : null,
      mobilePhone:
          map['mobile_phone'] != null ? map['mobile_phone'] as String : null,
      fax: map['fax'] != null ? map['fax'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Phone.fromJson(String source) =>
      Phone.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Photo {
  String? upload;
  String? selfi;

  Photo({
    this.upload,
    this.selfi,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'upload': upload,
      'selfi': selfi,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      upload: map['upload'] != null ? map['upload'] as String : null,
      selfi: map['selfi'] != null ? map['selfi'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) =>
      Photo.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Piece {
  String? document;
  String? identificationDocument;
  String? identificationNumber;
  String? issuedIn;
  String? issuedBy;
  String? expiresOn;

  Piece({
    this.document,
    this.identificationDocument,
    this.identificationNumber,
    this.issuedIn,
    this.issuedBy,
    this.expiresOn,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'document': document,
      'identificationDocument': identificationDocument,
      'identificationNumber': identificationNumber,
      'issuedIn': issuedIn,
      'issuedBy': issuedBy,
      'expiresOn': expiresOn,
    };
  }

  factory Piece.fromMap(Map<String, dynamic> map) {
    return Piece(
      document: map['document'] != null ? map['document'] as String : null,
      identificationDocument: map['identification_document'] != null
          ? map['identification_document'] as String
          : null,
      identificationNumber: map['identification_number'] != null
          ? map['identification_number'] as String
          : null,
      issuedIn: map['issued_in'] != null ? map['issued_in'] as String : null,
      issuedBy: map['issued_by'] != null ? map['issued_by'] as String : null,
      expiresOn:
          map['expires_on'] != null ? (map['expires_on'] as String) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Piece.fromJson(String source) =>
      Piece.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Residence {
  String? document;
  String? address;
  String? zipCode;

  Residence({
    this.document,
    this.address,
    this.zipCode,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'document': document,
      'address': address,
      'zipCode': zipCode,
    };
  }

  factory Residence.fromMap(Map<String, dynamic> map) {
    return Residence(
      document: map['document'] != null ? map['document'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      zipCode: map['zip_code'] != null ? map['zip_code'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Residence.fromJson(String source) =>
      Residence.fromMap(json.decode(source) as Map<String, dynamic>);
}
