import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

import '../models/models.dart';

final class Utils {
  Utils._();

  /// Creates the arguments for creating public client application.
  /// Argument map will be passed to the native side.
  static Future<Map<String, dynamic>> createPcaArguments({
    required String clientId,
    AndroidConfig? androidConfig,
    AppleConfig? appleConfig,
  }) async {
    final arguments = <String, dynamic>{};
    if (Platform.isAndroid) {
      assert(androidConfig != null, 'Android config can not be null');

      final configStr =
          await rootBundle.loadString(androidConfig!.configFilePath);
      final config = json.decode(configStr) as Map<String, dynamic>
        ..addAll({
          'client_id': clientId,
          'redirect_uri': androidConfig.redirectUri,
        });

      final tenantId = androidConfig.tenantId;
      arguments.addAll({'config': config});

      if (tenantId != null && tenantId.isNotEmpty) {
        config['authorities'][0]['audience']['tenant_id'] = tenantId;

        // Fallback authority for silent auth when the account's is unusable.
        arguments.addAll({
          'authority': 'https://login.microsoftonline.com/$tenantId',
        });
      }
    } else if (Platform.isIOS || Platform.isMacOS) {
      assert(appleConfig != null, 'Apple config can not be null');
      arguments.addAll({
        'clientId': clientId,
        'authority': appleConfig!.authority,
        'authorityType': appleConfig.authorityType.name,
        'redirectUri': appleConfig.redirectUri,
        'broker': appleConfig.broker.name,
      });
    }
    return arguments;
  }
}
