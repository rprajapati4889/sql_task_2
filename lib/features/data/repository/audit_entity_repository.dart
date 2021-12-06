import 'package:sqlite_2/features/data/datasources/audit_entity_data_source.dart';
import 'package:sqlite_2/features/domain/repositories/audit_entity_repository.dart';

class AuditEntityRepositoryImpl extends AuditEntityRepository {
  final AuditEntityDataSource auditEntityDataSource;
  AuditEntityRepositoryImpl({required this.auditEntityDataSource});
  @override
  Future<List<int>> getEntriesCount() async {
    return await auditEntityDataSource.getEntriesCount();
  }

  @override
  Future<void> getJsonAndInsertAuditEntity() async {
    return await auditEntityDataSource.getJsonAndInsertAuditEntity();
  }
}