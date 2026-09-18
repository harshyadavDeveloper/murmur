import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:murmur/repositories/insight_repository.dart';
import 'package:murmur/repositories/insight_repository_impl.dart';
import 'package:murmur/repositories/journal_repository.dart';
import 'package:murmur/repositories/journal_repository_impl.dart';

import '../../data/datasources/isar_service.dart';

final getIt = GetIt.instance;

Future<void> setupDependencies() async {
  getIt.registerSingletonAsync<Isar>(() => IsarService.getInstance());

  getIt.registerSingletonWithDependencies<JournalRepository>(
    () => JournalRepositoryImpl(getIt<Isar>()),
    dependsOn: [Isar],
  );

  getIt.registerSingletonWithDependencies<InsightRepository>(
    () => InsightRepositoryImpl(getIt<Isar>()),
    dependsOn: [Isar],
  );

  await getIt.allReady();
}
