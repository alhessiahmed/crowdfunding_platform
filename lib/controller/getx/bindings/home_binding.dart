import 'package:crowdfunding_platform/controller/getx/controllers/discover_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(()=> DiscoverController());
  } 

}