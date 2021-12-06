import 'package:sqlite_2/features/domain/repositories/audit_entity_repository.dart';

class GetEntriesCountUseCase {
  final AuditEntityRepository auditEntityRepository;
  GetEntriesCountUseCase({required this.auditEntityRepository});

  Future<List<int>> call() async {
    return await auditEntityRepository.getEntriesCount();
  }
}