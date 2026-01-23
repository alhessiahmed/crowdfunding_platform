import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:crowdfunding_platform/model/campagin_model.dart';
import 'package:crowdfunding_platform/model/filter_item.dart';
import 'package:get/state_manager.dart';

class DiscoverController extends GetxController{

  List<FilterItem>  filtersMock =[];
   RxInt selectedFilterIndex = 0.obs;
  List<campaignModel> campaignsMock = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHomeData();
  }
void selectFilter(int index){ 
  selectedFilterIndex.value = index ;
}
  getHomeData(){ 
    //api request 
     filtersMock = [
  FilterItem(id: 'all', title: 'الكل', count: 120),
  FilterItem(id: 'education', title: 'تعليم', count: 42),
  FilterItem(id: 'health', title: 'صحة', count: 21),
  FilterItem(id: 'relief', title: 'إغاثة', count: 56),
  FilterItem(id: 'orphans', title: 'أيتام', count: 18),
  FilterItem(id: 'water', title: 'مياه', count: 12),
];


 campaignsMock = [
  campaignModel(
    id: '1',
    title: 'دعم تعليم الأطفال المحتاجين',
    description: 'ساهم في توفير التعليم للأطفال في المناطق المتضررة.',
    image: ImagesManager.test,
    raised: 50,
    target: 100,
    category: 'تعليم',
  ),
  campaignModel(
    id: '2',
    title: 'حملة توفير مياه نظيفة',
    description: 'مشروع لتوفير مياه صالحة للشرب للأسر المحتاجة.',
    image: ImagesManager.test,
    raised: 80,
    target: 120,
    category: 'مياه',
  ),
  campaignModel(
    id: '3',
    title: 'إغاثة عاجلة للأسر المتضررة',
    description: 'دعم فوري للأسر المتضررة من الأزمات.',
    image: ImagesManager.test,
    raised: 30,
    target: 150,
    category: 'إغاثة',
  ),
];



    
  }
}
