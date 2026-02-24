
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
      id: (json['id'] ?? '').toString(),
      storageProviderName: (json['storageProviderName'] ?? '').toString(),
      fileId: (json['fileId'] ?? '').toString(),
      url: (json['url'] ?? '').toString(),
      fileType: (json['fileType'] ?? '').toString(),
      fileSizeInKB: json['fileSizeInKB'] as int? ?? 0,
      kind: (json['kind'] ?? '').toString(),
      ownerId: (json['ownerId'] ?? '').toString(),
      userId: json['userId'] as String?,
      campaignId: (json['campaignId'] ?? '').toString(),
      campaignUpdateId: json['campaignUpdateId'] as String?,
      creatorId: json['creatorId'] as String?,
      bankAccountId: json['bankAccountId'] as String?,
      donorIdentityId: json['donorIdentityId'] as String?,
      createdAt: DateTime.tryParse((json['createdAt'] ?? '').toString()) ??
          DateTime.now(),
      updatedAt: DateTime.tryParse((json['updatedAt'] ?? '').toString()) ??
          DateTime.now(),
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
