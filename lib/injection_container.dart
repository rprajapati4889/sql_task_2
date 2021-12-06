import 'package:get_it/get_it.dart';

import 'features/data/datasources/audit_entity_data_source.dart';
import 'features/data/datasources/audit_entity_data_source_impl.dart';
import 'features/data/datasources/database/audit_entity_database.dart';
import 'features/data/repository/audit_entity_repository.dart';
import 'features/domain/repositories/audit_entity_repository.dart';
import 'features/domain/usecases/get_entry_usecase.dart';
import 'features/domain/usecases/get_json_and_insert_usecase.dart';
import 'features/presentation/cubit/audit_entity_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // cubit
  sl.registerFactory<AuditEntityCubit>(() => AuditEntityCubit(
      getEntriesCountUseCase: sl.call(),
      getJsonAndInsertAuditEntityUseCase: sl.call()));

  // database
  sl.registerLazySingleton<AuditEntityDb>(() => AuditEntityDb());

  //usecase
  sl.registerLazySingleton<GetEntriesCountUseCase>(
          () => GetEntriesCountUseCase(auditEntityRepository: sl.call()));
  sl.registerLazySingleton<GetJsonAndInsertAuditEntityUseCase>(() =>
      GetJsonAndInsertAuditEntityUseCase(auditEntityRepository: sl.call()));

  //repository
  sl.registerLazySingleton<AuditEntityRepository>(
          () => AuditEntityRepositoryImpl(auditEntityDataSource: sl.call()));

  //datasource
  sl.registerLazySingleton<AuditEntityDataSource>(
          () => AuditEntityDataSourceImpl(auditEntityDb: sl.call()));
}