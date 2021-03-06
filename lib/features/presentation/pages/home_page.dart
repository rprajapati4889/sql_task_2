import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqlite_2/features/presentation/cubit/audit_entity_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text(" Audit  List"),
      ),
      body: SafeArea(
        child: BlocBuilder<AuditEntityCubit, AuditEntityState>(
          builder: (context, state) {
            if (state is AuditEntityInitial) {
              BlocProvider.of<AuditEntityCubit>(context).getCount();
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuditEntityLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is AuditEntityError) {
              return const Center(child: Text("error while loading data"));
            } else if (state is AuditEntityLoaded) {
              //print(state.auditEntitydata.length);
              return _body(state.countData);
            }
            return const Center(child: Text("something went wrong!!"));
          },
        ),
      ),
    );
  }

  Widget _body(List<int> countData) {
    List<String> tableName = [
      'auditDetailsList',
      'scoringTypes',
      'scoringFormulaInfoModel',
      'auditScoring',
      'auditEntity',
      'auditQuestion',
      'auditEntityTypes',
      'auditEntityTypeQuestions',
      'auditCorrectiveActions',
      'auditFailureReason',
      'auditAdditionalFields',
      'auditAdditionalFieldTypeValues',
      'auditAdditionalFieldEntityTypes',
      'size',
      'auditTeamTask',
      'teamDetails',
      'userDetails',
      'userPermission',
      'occurrenceScheduleDates',
      'auditEnforceTimeData',
      'auditGroups',
    ];

    return ListView.builder(
        itemCount: countData.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white70,
            child: ListTile(
              title: Text("Table Name:- " + tableName[index],style: TextStyle(fontStyle: FontStyle.italic,color: Colors.brown,fontWeight: FontWeight.bold)),
              subtitle: Text("No of Items:- " + countData[index].toString()),
            ),
          );
        });
  }
}