import 'package:hive/hive.dart';
import 'package:mbb/models/ad_banners.dart';

class LocalAdBannersService {
  late Box<AdBanner> _adbannerBox;

  Future<void> init() async {
    _adbannerBox = await Hive.openBox('AdBanners');
  }

  Future<void> assignAllAdBanners({required List<AdBanner> adbanners}) async {
    await _adbannerBox.clear();
    await _adbannerBox.addAll(adbanners);
  }

  List<AdBanner> getAdBanners() => _adbannerBox.values.toList();
}
