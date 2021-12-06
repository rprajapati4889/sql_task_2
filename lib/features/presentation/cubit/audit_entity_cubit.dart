import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sqlite_2/features/domain/usecases/get_entry_usecase.dart';
import 'package:sqlite_2/features/domain/usecases/get_json_and_insert_usecase.dart';

part 'audit_entity_state.dart';


class AuditEntityCubit extends Cubit<AuditEntityState> {
  final GetEntriesCountUseCase getEntriesCountUseCase;
  final GetJsonAndInsertAuditEntityUseCase getJsonAndInsertAuditEntityUseCase;

  AuditEntityCubit({
    required this.getEntriesCountUseCase,
    required this.getJsonAndInsertAuditEntityUseCase,
  }) : super(AuditEntityInitial());

  getCount() async {
    emit(AuditEntityLoading());
    final countlist = await getEntriesCountUseCase.call();
    if (countlist[0] == 0) {
      await getJsonAndInsertAuditEntityUseCase
          .call()
          .whenComplete(() => emit(AuditEntityLoaded(countData: countlist)));
    } else {
      emit(AuditEntityLoaded(countData: countlist));
    }
  }
}
