class CampaignUpdateModel {
  final String id;
  final String campaignId;
  final String title;
  final String description;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<AssetModel> assets;

  CampaignUpdateModel({
    required this.id,
    required this.campaignId,
    required this.title,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
    required this.assets,
  });

  factory CampaignUpdateModel.fromJson(Map<String, dynamic> json) {
    return CampaignUpdateModel(
      id: json['id'],
      campaignId: json['campaignId'],
      title: json['title'],
      description: json['description'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      assets: json['assets'] != null
          ? List<AssetModel>.from(
              json['assets'].map((e) => AssetModel.fromJson(e)),
            )
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'campaignId': campaignId,
      'title': title,
      'description': description,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'assets': assets.map((e) => e.toJson()).toList(),
    };
  }
}
class AssetModel {
  final String id;
  final String storageProviderName;
  final String fileId;
  final String url;
  final String fileType;
  final int fileSizeInKB;
  final String kind;
  final String ownerId;
  final String? userId;
  final String? campaignId;
  final String? campaignUpdateId;
  final String? creatorId;
  final String? bankAccountId;
  final String? donorIdentityId;
  final DateTime createdAt;
  final DateTime updatedAt;

  AssetModel({
    required this.id,
    required this.storageProviderName,
    required this.fileId,
    required this.url,
    required this.fileType,
    required this.fileSizeInKB,
    required this.kind,
    required this.ownerId,
    this.userId,
    this.campaignId,
    this.campaignUpdateId,
    this.creatorId,
    this.bankAccountId,
    this.donorIdentityId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['id'],
      storageProviderName: json['storageProviderName'],
      fileId: json['fileId'],
      url: json['url'],
      fileType: json['fileType'],
      fileSizeInKB: json['fileSizeInKB'],
      kind: json['kind'],
      ownerId: json['ownerId'],
      userId: json['userId'],
      campaignId: json['campaignId'],
      campaignUpdateId: json['campaignUpdateId'],
      creatorId: json['creatorId'],
      bankAccountId: json['bankAccountId'],
      donorIdentityId: json['donorIdentityId'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
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