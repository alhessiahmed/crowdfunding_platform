import 'package:crowdfunding_platform/model/campagin_models/asset_campagin_model.dart';
import 'package:crowdfunding_platform/model/campagin_models/creator_campagin_model.dart';
import 'package:crowdfunding_platform/model/my_campagins_model.dart';


enum CampaignCategory {
   ALL,
  WATER,
  HEALTH,
  ENVIROMENT,
  FOOD,
  EDUCATION,
  SHELTER,
  ANIMALS,
}

class CampaignModel {
  final String id;
  final String creatorId;
  final String title;
  final String description;
  final CampaignCategory category;
  final int goal;
  final DateTime startDate;
  final DateTime endDate;
  final String motivationMessage;
  final CampaignStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isVerified;
  final String verificationStatus;
  final bool isActive;
  final String notes;
  final bool isDeleted;
  final Creator creator;
  final List<Asset> assets;
  final int likesCount;
  final int raisedStars;

  CampaignModel({
    required this.id,
    required this.creatorId,
    required this.title,
    required this.description,
    required this.category,
    required this.goal,
    required this.startDate,
    required this.endDate,
    required this.motivationMessage,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.isVerified,
    required this.verificationStatus,
    required this.isActive,
    required this.notes,
    required this.isDeleted,
    required this.creator,
    required this.assets,
    required this.likesCount,
    required this.raisedStars,
  });

  ///  Progress Percentage
  double get progress =>
      goal == 0 ? 0 : (raisedStars / goal).clamp(0, 1);

  ///  fromJson
  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    return CampaignModel(
      id: json['id'],
      creatorId: json['creatorId'],
      title: json['title'],
      description: json['description'],
      category: CampaignCategory.values.firstWhere(
        (e) => e.name == json['category'],
        orElse: () => CampaignCategory.ALL,
      ),
      goal: json['goal'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      motivationMessage: json['motivationMessage'],
      status: CampaignStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => CampaignStatus.pending,
      ),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      isVerified: json['isVerified'],
      verificationStatus: json['verificationStatus'],
      isActive: json['isActive'],
      notes: json['notes'] ?? '',
      isDeleted: json['isDeleted'],
      creator: Creator.fromJson(json['creator']),
      assets: (json['assets'] as List? ?? [])
    .map((e) => Asset.fromJson(e))
    .toList(),
      likesCount: json['_count']?['likes'] ?? 0,
      raisedStars: json['raisedStars'] ?? 0,
    );
  }

  ///  toJson
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'title': title,
      'description': description,
      'category': category.name,
      'goal': goal,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'motivationMessage': motivationMessage,
      'status': status.name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isVerified': isVerified,
      'verificationStatus': verificationStatus,
      'isActive': isActive,
      'notes': notes,
      'isDeleted': isDeleted,
      'creator': creator.toJson(),
      'assets': assets.map((asset)=> asset.toJson()).toList(),
      '_count': {'likes': likesCount},
      'likesCount': likesCount,
      'raisedStars': raisedStars,
    };
  }

  ///  copyWith
  CampaignModel copyWith({
    String? title,
    String? description,
    int? raisedStars,
    CampaignStatus? status,
  }) {
    return CampaignModel(
      id: id,
      creatorId: creatorId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category,
      goal: goal,
      startDate: startDate,
      endDate: endDate,
      motivationMessage: motivationMessage,
      status: status ?? this.status,
      createdAt: createdAt,
      updatedAt: updatedAt,
      isVerified: isVerified,
      verificationStatus: verificationStatus,
      isActive: isActive,
      notes: notes,
      isDeleted: isDeleted,
      creator: creator,
      assets: assets,
      likesCount: likesCount,
      raisedStars: raisedStars ?? this.raisedStars,
    );
  }

  ///  Skeleton Factory (for Skeletonizer)
  factory CampaignModel.skeleton() {
    return CampaignModel(
      id: '',
      creatorId: '',
      title: 'Loading campaign...',
      description: 'Please wait...',
      category: CampaignCategory.WATER,
      goal: 100,
      startDate: DateTime.now(),
      endDate: DateTime.now(),
      motivationMessage: '',
      status: CampaignStatus.pending,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
      isVerified: false,
      verificationStatus: '',
      isActive: true,
      notes: '',
      isDeleted: false,
      creator: Creator.skeleton(),
      assets: [],
      likesCount: 0,
      raisedStars: 50,
    );
  }
}
