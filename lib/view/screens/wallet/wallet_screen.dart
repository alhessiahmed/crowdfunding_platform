import 'package:crowdfunding_platform/controller/getx/controllers/wallet/wallet_controller.dart';
import 'package:crowdfunding_platform/view/screens/wallet/in_processing_withdrawal_processing_list_tile.dart';
import 'package:crowdfunding_platform/view/widgets/update_campaign_widget/appbar_section.dart';
import 'package:crowdfunding_platform/view/widgets/wallet_widget/balance_card_widget.dart';
import 'package:crowdfunding_platform/view/widgets/wallet_widget/wallet_transaction_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WalletScreen extends GetView<WalletController> {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = <_WalletTransactionItem>[
      const _WalletTransactionItem(
        title: 'تحويل بنكي',
        dateText: '2025/أكتوبر/25',
        amount: 5000,
        type: WalletTransactionType.withdraw,
      ),
      const _WalletTransactionItem(
        title: 'تبرع حملة الحقيبة المدرسية',
        dateText: '2025/أكتوبر/25',
        amount: 5000,
        type: WalletTransactionType.donation,
      ),
      const _WalletTransactionItem(
        title: 'تبرع حملة الحقيبة المدرسية',
        dateText: '2025/أكتوبر/25',
        amount: 5000,
        type: WalletTransactionType.donation,
      ),
      const _WalletTransactionItem(
        title: 'تبرع حملة الحقيبة المدرسية',
        dateText: '2025/أكتوبر/25',
        amount: 5000,
        type: WalletTransactionType.donation,
      ),
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppbarSection(
                  title: 'wallet'.tr,
                  subTitle:
                      'Here_you_can_track_Your_donation_balance_and_manage_the_impact_transfer_with_complete_transparency.'
                          .tr,
                ),
                SizedBox(height: 16.h),
                BalanceCardWidget(
                  totalStares: controller.totalStares,
                  mony: controller.mony,
                ),
                SizedBox(height: 16.h),
                InProcessingWithdrawalProcessingListTile(amount: 25000),
                SizedBox(height: 8.h),
                Text(
                  'Transfer_log'.tr,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.h),
                ListView.separated(
                  itemCount: transactions.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => SizedBox(height: 16.h),
                  itemBuilder: (context, index) {
                    final item = transactions[index];
                    return WalletTransactionTile(
                      title: item.title,
                      dateText: item.dateText,
                      amount: item.amount,
                      type: item.type,
                    );
                  },
                ),
                SizedBox(height: 16.h),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Payment_tracking'.tr),
                ),
                SizedBox(height: 16.h),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'All_payments_are_secure_and_encrypted.'.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _WalletTransactionItem {
  const _WalletTransactionItem({
    required this.title,
    required this.dateText,
    required this.amount,
    required this.type,
  });

  final String title;
  final String dateText;
  final int amount;
  final WalletTransactionType type;
}
