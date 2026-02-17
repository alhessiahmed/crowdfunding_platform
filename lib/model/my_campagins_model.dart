enum CampaignStatus {
  completed,
  active,
  paused,
  stopped,
  deleted,
  draft ,
  pending
  
}
class MyCampaignsModel {
  final int id;
  final String title;
  final String image;
  final double progress; // 0 → 100
  final CampaignStatus status;

  MyCampaignsModel({
    required this.id,
    required this.title,
    required this.image,
    required this.progress,
    required this.status,
  });

  bool get isCompleted => status == CampaignStatus.completed;
  bool get isActive => status == CampaignStatus.active;
  bool get isPaused => status == CampaignStatus.paused;
  bool get isStopped => status == CampaignStatus.stopped;
  bool get isDraft => status == CampaignStatus.draft;
    bool get isPending => status == CampaignStatus.pending;

}
