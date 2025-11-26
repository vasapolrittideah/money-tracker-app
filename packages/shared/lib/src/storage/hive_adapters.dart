import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:shared/shared.dart';

part 'hive_adapters.g.dart';

@GenerateAdapters([AdapterSpec<SessionModel>()])
class HiveAdapters {}
