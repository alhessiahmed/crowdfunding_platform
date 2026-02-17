
class Asset {
  final String id;
  final String storageProviderName;
  final String fileId;
  final String url;
  final String fileType;
  final int fileSizeInKB;
  final String kind;
  final String ownerId;
  final String? userId;
  final String campaignId;
  final String? campaignUpdateId;
  final String? creatorId;
  final String? bankAccountId;
  final String? donorIdentityId;
  final DateTime createdAt;
  final DateTime updatedAt;

  Asset({
    required this.id,
    required this.storageProviderName,
    required this.fileId,
    required this.url,
    required this.fileType,
    required this.fileSizeInKB,
    required this.kind,
    required this.ownerId,
    this.userId,
    required this.campaignId,
    this.campaignUpdateId,
    this.creatorId,
    this.bankAccountId,
    this.donorIdentityId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Asset.fromJson(Map<String, dynamic> json) {
    return Asset(
      id: json['id'] as String,
      storageProviderName: json['storageProviderName'] as String,
      fileId: json['fileId'] as String,
      url: json['url'] as String,
      fileType: json['fileType'] as String,
      fileSizeInKB: json['fileSizeInKB'] as int,
      kind: json['kind'] as String,
      ownerId: json['ownerId'] as String,
      userId: json['userId'] as String?,
      campaignId: json['campaignId'] as String,
      campaignUpdateId: json['campaignUpdateId'] as String?,
      creatorId: json['creatorId'] as String?,
      bankAccountId: json['bankAccountId'] as String?,
      donorIdentityId: json['donorIdentityId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'storageProviderName': storageProviderName,
      'fileId': fileId,
      'url': url,
      'fileType': fileType,
      'fileSizeInKB': fileSizeInKB,
      'kind': kind,
      'ownerId': ownerId,
      'userId': userId,
      'campaignId': campaignId,
      'campaignUpdateId': campaignUpdateId,
      'creatorId': creatorId,
      'bankAccountId': bankAccountId,
      'donorIdentityId': donorIdentityId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}