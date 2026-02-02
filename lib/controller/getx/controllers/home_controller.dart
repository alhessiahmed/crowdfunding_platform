import 'package:crowdfunding_platform/controller/core/constants/images_manager.dart';
import 'package:get/state_manager.dart';

class HomeController extends GetxController{

  List<FilterItem>  filtersMock =[];
  int?  selectedFilterIndex;
  List<CampaignMock> campaignsMock = [];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getHomeData();
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
  CampaignMock(
    id: '1',
    title: 'دعم تعليم الأطفال المحتاجين',
    description: 'ساهم في توفير التعليم للأطفال في المناطق المتضررة.',
    image: ImagesManager.test,
    raised: 50,
    target: 100,
    category: 'تعليم',
  ),
  CampaignMock(
    id: '2',
    title: 'حملة توفير مياه نظيفة',
    description: 'مشروع لتوفير مياه صالحة للشرب للأسر المحتاجة.',
    image: ImagesManager.test,
    raised: 80,
    target: 120,
    category: 'مياه',
  ),
  CampaignMock(
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

class FilterItem {
  final String id;
  final String title;
  final int count;

  const FilterItem({
    required this.id,
    required this.title,
    required this.count,
  });
}

class CampaignMock {
  final String id;
  final String title;
  final String description;
  final String image;
  final int raised;
  final int target;
  final String category;

  const CampaignMock({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.raised,
    required this.target,
    required this.category,
  });
}
