import 'package:copa2022/app/groups/group_model.dart';
import 'package:dartz/dartz.dart';

abstract class IGroupRepository {
  Future<Either<Exception, List<GroupModel>>> getAllGroups();
}
