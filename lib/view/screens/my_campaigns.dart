import 'package:crowdfunding_platform/controller/getx/controllers/my_campagins_controller.dart';
import 'package:crowdfunding_platform/view/widgets/filter_section.dart';
import 'package:crowdfunding_platform/view/widgets/header_with_search.dart';
import 'package:crowdfunding_platform/view/widgets/my_campagine_widgets/my_campagins_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyCampaignsScreen extends GetView<MyCampaginsController> {
  const MyCampaignsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Column( 
        children: [ 
          HeaderWithSearch(title: 'my_campaigns'.tr , subTitle: 'manage_campaigns_and_track'.tr,), 
          SizedBox(height: 15.h,),
          Obx (()=>  FilterSection(filters: controller.filtersMock , selectedIndex: controller.selectedFilterIndex.value , onSelect: controller.selectFilter, ),),
          SizedBox(height: 20.h,),
          Expanded(
            child: ListView.builder(
              itemCount: controller.myCampaignsMock.length,
                    padding: EdgeInsets.only( bottom: 120.h ),

              itemBuilder: (context , index){ 
              
              return MyCampaginsCard(myCampaign: controller.myCampaignsMock[index]);
            }),
          ), 
          //SizedBox(height: 100.h,)
          
        ],
      )),
    );
  }
  
}