class ControlCampaignData {
  const ControlCampaignData({
    required this.summary,
    required this.performance,
    required this.actions,
    required this.updates,
  });

  final CampaignSummary summary;
  final PerformanceOverview performance;
  final List<CampaignAction> actions;
  final List<CampaignUpdate> updates;
}

class CampaignSummary {
  const CampaignSummary({
    required this.titleKey,
    required this.statusLabelKey,
    required this.categoryLabelKey,
    required this.imagePath,
    required this.starsCollected,
    required this.starsTarget,
    required this.daysRemaining,
  });

  final String titleKey;
  final String statusLabelKey;
  final String categoryLabelKey;
  final String imagePath;
  final int starsCollected;
  final int starsTarget;
  final int daysRemaining;
}

class PerformanceOverview {
  const PerformanceOverview({
    required this.totalStars,
    required this.supporters,
    required this.daysRemaining,
  });

  final int totalStars;
  final int supporters;
  final int daysRemaining;
}

class CampaignUpdate {
  const CampaignUpdate({
    required this.title,
    required this.description,
    required this.timeLabel,
    this.isLiked = false,
  });

  final String title;
  final String description;
  final String timeLabel;
  final bool isLiked;

  CampaignUpdate copyWith({
    String? title,
    String? description,
    String? timeLabel,
    bool? isLiked,
  }) {
    return CampaignUpdate(
      title: title ?? this.title,
      description: description ?? this.description,
      timeLabel: timeLabel ?? this.timeLabel,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}

enum ControlActionType { edit, share, addUpdate }

class CampaignAction {
  const CampaignAction({required this.type, required this.labelKey});

  final ControlActionType type;
  final String labelKey;
}
