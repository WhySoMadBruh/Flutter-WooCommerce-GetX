import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mbb/models/ad_banners.dart';
import 'package:mbb/models/category_lists.dart';
import 'package:mbb/models/customer.dart';
import 'package:mbb/models/product_lists.dart';
import 'package:mbb/routes/app_page.dart';
import 'package:mbb/routes/app_route.dart';
import 'package:mbb/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  //register adapters
  Hive.registerAdapter(AdBannerAdapter());
  Hive.registerAdapter(CategoryListsAdapter());
  Hive.registerAdapter(ProductListsAdapter());
  Hive.registerAdapter(VariationsAdapter());
  Hive.registerAdapter(CustomerAdapter());
  Hive.registerAdapter(AddressAdapter());

  configLoading();
  runApp(const MBB());
}

class MBB extends StatefulWidget {
  const MBB({super.key});

  @override
  State<MBB> createState() => _MBBState();
}

class _MBBState extends State<MBB> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
      builder: EasyLoading.init(),
    );
  }
}

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.white
    ..textColor = Colors.white
    ..userInteractions = false
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = true;
}
