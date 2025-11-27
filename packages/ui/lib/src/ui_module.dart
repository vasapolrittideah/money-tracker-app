import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:shared/shared.dart';

class UiModule extends BaseModule {
  @override
  String get name => 'ui';

  @override
  void initialize() {
    LicenseRegistry.addLicense(() async* {
      final fontPath = '../../assets/fonts/ibm_plex_sans_thai';
      final license = await rootBundle.loadString('$fontPath/OFL.txt');
      yield LicenseEntryWithLineBreaks(<String>[fontPath], license);
    });
  }
}
