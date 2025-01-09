import 'package:licence_driving_admin/core/resources/data_state.dart';

abstract class UseCase<Type, Params, ErrorType extends Object?> {
  Future<DataState<Type, ErrorType>> call(Params params);
}
