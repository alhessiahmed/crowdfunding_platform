import 'package:crowdfunding_platform/model/campagin_models/campagin_model.dart';
import 'package:crowdfunding_platform/controller/core/utils/show_snackbar.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class CampaignShareHelper {
  CampaignShareHelper._();

  // Prefer passing this at build time:
  // flutter run --dart-define=CAMPAIGN_SHARE_BASE_URL=https://your-domain.com/campaign
  static const String _shareBaseUrl = String.fromEnvironment(
    'CAMPAIGN_SHARE_BASE_URL',
    defaultValue: 'https://gsg-project-group-2-production.up.railway.app/campaign',
  );

  static String buildCampaignShareLink(String campaignId) {
    return '$_shareBaseUrl/$campaignId';
  }

  static Future<void> shareCampaign(CampaignModel campaign) async {
    final link = buildCampaignShareLink(campaign.id);
    final message = '''
${campaign.title}

${campaign.description}

ادعم هذه الحملة:
$link
''';

    try {
      await SharePlus.instance.share(
        ShareParams(
          text: message,
          subject: campaign.title,
        ),
      );
    } on MissingPluginException {
      await Clipboard.setData(ClipboardData(text: link));
      showSnackbar(
        message: 'ميزة المشاركة غير مفعلة حالياً. تم نسخ الرابط.',
        success: false,
      );
    } on PlatformException {
      await Clipboard.setData(ClipboardData(text: link));
      showSnackbar(
        message: 'تعذر فتح المشاركة. تم نسخ الرابط.',
        success: false,
      );
    }
  }
}
