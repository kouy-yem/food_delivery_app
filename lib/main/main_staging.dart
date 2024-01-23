import 'dart:developer';

import 'package:flutter/material.dart';
import "package:http_client/http_client.dart";
import 'package:dio/dio.dart';
import '../app/view/app.dart';
import '../data/model/environment.dart';
import '../data/storages/storage.dart';
import '../shared/interceptors/authentication_queued_interceptor.dart';
import '../shared/storages/token_storage_provider.dart';
import 'bootstrap.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  bootstrap((sharedPreferences) async {
    final tokenStorageProvider = TokenStorageProvider();

    // Storage
    await Storage().initial();

    const environmentType = EnvironmentType.staging;
    final environment = Environment.values[environmentType];
    if (environment != null) {
      log('Environment: ${environment.name}');
      log('BaseUrl: ${environment.baseUrl}');
      log('API version: ${environment.apiVersion}');
    }

    final httpClient = DioHttpClient(
      dio: Dio(),
      baseUrl: '${environment?.baseUrl}/${environment?.apiVersion}',
      interceptors: [
        AuthenticationQueuedInterceptor(
          tokenStorage: tokenStorageProvider,
          baseUrl: '${environment?.baseUrl}/${environment?.apiVersion}',
        ),
      ],
    );

    return App(
      httpClient: httpClient,
      environmentType: environmentType,
    );
  });
}
