import 'package:hive_flutter/hive_flutter.dart';

part 'selected_adapter.g.dart';

@HiveType(typeId: 1)
class SelectedBranchDB {
  @HiveField(0)
  String selctedBranchName;

  SelectedBranchDB({
    required this.selctedBranchName,
  });

  factory SelectedBranchDB.fromJson(Map<String, dynamic> json) {
    return SelectedBranchDB(
      selctedBranchName: json['selctedBranchName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['selctedBranchName'] = selctedBranchName;

    return data;
  }
}
