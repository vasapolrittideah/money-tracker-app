import 'package:core/src/utilities/directory_util.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Class for initializing and managing Hive storage with type adapters.
class HiveManager {
  HiveManager(this._hive, this._directoryUtil, {this.adapters = const []});

  final HiveInterface _hive;
  final DirectoryUtil _directoryUtil;
  final List<TypeAdapter> adapters;
  String get _subDirectory => 'hive_data';

  /// Initializes Hive by opening the storage and registering the given [adapters].
  Future<void> init() async {
    await _open();
    for (final adapter in adapters) {
      if (!_hive.isAdapterRegistered(adapter.typeId)) {
        _hive.registerAdapter(adapter);
      }
    }
  }

  /// Clears all data stored in Hive and deletes the storage directory.
  Future<void> clear() async {
    await _hive.deleteFromDisk();
    await _directoryUtil.removeSubDirectory(_subDirectory);
  }

  /// Opens the Hive storage at the specified subdirectory.
  Future<void> _open() async {
    final subPath = await _directoryUtil.createSubDirectory(_subDirectory);
    await _hive.initFlutter(subPath);
  }
}
