import 'package:hive_ce/hive.dart';
import 'package:licence_driving_admin/features/authentication_management/data/models/user.model.dart';


part "hive_adapters.g.dart";

@GenerateAdapters([
  AdapterSpec<UserModel>(),
  AdapterSpec<Roles>(),
])
class HiveAdapters {}
