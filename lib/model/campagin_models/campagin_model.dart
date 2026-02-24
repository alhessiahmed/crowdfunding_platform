import 'package:crowdfunding_platform/model/campagin_models/asset_campagin_model.dart';
import 'package:crowdfunding_platform/model/campagin_models/creator_campagin_model.dart';

class CampaignModel {
  final String id;
  final String creatorId;
  final String title;
  final String description;
  final String category;
  final double goal;
  final DateTime startDate;
  final DateTime endDate;
  final String motivationMessage;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool isVerified;
  final String verificationStatus;
  final bool isActive;
  final String notes;
  final bool isDeleted;
  final int likes;
  final Creator creator;
  final List<Asset> assets;

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
    required this.likes,
    required this.creator,
    required this.assets,
  });

  factory CampaignModel.fromJson(Map<String, dynamic> json) {
    final creatorJson = json['creator'];
    final assetsJson = json['assets'];

    return CampaignModel(
      id: (json['id'] ?? '').toString(),
      creatorId: (json['creatorId'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      description: (json['description'] ?? '').toString(),
      category: (json['category'] ?? '').toString(),
      goal: (json['goal'] as num?)?.toDouble() ?? 0,
      startDate: DateTime.tryParse((json['startDate'] ?? '').toString()) ??
          DateTime.now(),
      endDate:
          DateTime.tryParse((json['endDate'] ?? '').toString()) ?? DateTime.now(),
      motivationMessage: (json['motivationMessage'] ?? '').toString(),
      status: (json['status'] ?? '').toString(),
      createdAt: DateTime.tryParse((json['createdAt'] ?? '').toString()) ??
          DateTime.now(),
      updatedAt: DateTime.tryParse((json['updatedAt'] ?? '').toString()) ??
          DateTime.now(),
      isVerified: json['isVerified'] as bool? ?? false,
      verificationStatus: (json['verificationStatus'] ?? '').toString(),
      isActive: json['isActive'] as bool? ?? true,
      notes: (json['notes'] ?? '').toString(),
      isDeleted: json['isDeleted'] as bool? ?? false,
      likes: json['likes'] as int? ?? 0,
      creator: creatorJson is Map<String, dynamic>
          ? Creator.fromJson(creatorJson)
          : Creator(id: '', firstName: '', lastName: '', country: ''),
      assets: (assetsJson is List ? assetsJson : const <dynamic>[])
          .map((asset) => Asset.fromJson(asset as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creatorId': creatorId,
      'title': title,
      'description': description,
      'category': category,
      'goal': goal,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'motivationMessage': motivationMessage,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'isVerified': isVerified,
      'verificationStatus': verificationStatus,
      'isActive': isActive,
      'notes': notes,
      'isDeleted': isDeleted,
      'likes': likes,
      'creator': creator.toJson(),
      'assets': assets.map((asset) => asset.toJson()).toList(),
    };
  }

  CampaignModel copyWith({
    String? id,
    String? creatorId,
    String? title,
    String? description,
    String? category,
    double? goal,
    DateTime? startDate,
    DateTime? endDate,
    String? motivationMessage,
    String? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isVerified,
    String? verificationStatus,
    bool? isActive,
    String? notes,
    bool? isDeleted,
    int? likes,
    Creator? creator,
    List<Asset>? assets,
  }) {
    return CampaignModel(
      id: id ?? this.id,
      creatorId: creatorId ?? this.creatorId,
      title: title ?? this.title,
      description: description ?? this.description,
      category: category ?? this.category,
      goal: goal ?? this.goal,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      motivationMessage: motivationMessage ?? this.motivationMessage,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isVerified: isVerified ?? this.isVerified,
      verificationStatus: verificationStatus ?? this.verificationStatus,
      isActive: isActive ?? this.isActive,
      notes: notes ?? this.notes,
      isDeleted: isDeleted ?? this.isDeleted,
      likes: likes ?? this.likes,
      creator: creator ?? this.creator,
      assets: assets ?? this.assets,
    );
  }
  factory CampaignModel.skelton() {
  return CampaignModel(
    id: '0',
    creatorId: '',
    title: 'Loading...',
    description: 'Loading description...',
    category: '...',
    goal: 100,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    motivationMessage: '',
    status: '',
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    isVerified: false,
    verificationStatus: '',
    isActive: true,
    notes: '',
    isDeleted: false,
    likes: 50,
    creator: Creator(
      id: '',
      firstName: '',
      lastName: '',
      country: '',
    ),
    assets: [],
  );
}

}
